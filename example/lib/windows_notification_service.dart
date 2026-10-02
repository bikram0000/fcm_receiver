import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Shows FCM pushes as native Windows toasts.
///
/// Uses `flutter_local_notifications` (C++/WinRT toasts), which builds the
/// toast XML for us and supports toast actions.
///
/// ## Why a click needs an extra registry entry
///
/// The plugin registers the activator with `CoRegisterClassObject`, which is
/// **process scoped** — it only works while this app is running. It writes
/// `HKCU\Software\Classes\AppUserModelId\<aumid>\CustomActivator`, but it does
/// *not* write a `CLSID\{guid}\LocalServer32` entry.
///
/// Without that entry, Windows has no command to run when the app is closed,
/// so clicking a toast does nothing at all. [initialize] therefore writes the
/// `LocalServer32` value itself, pointing at this exe plus
/// [toastActivatedArg]. That makes cold-start activation work for unpackaged
/// apps, which is otherwise the plugin's documented MSIX-only path.
///
/// Activation is handled on both paths: a cold start via
/// [getNotificationAppLaunchDetails], and a warm click via
/// `onDidReceiveNotificationResponse`.
class WindowsNotificationService {
  WindowsNotificationService._();

  /// Argument Windows appends when it cold-starts this exe from a toast click.
  static const String toastActivatedArg = '-ToastActivated';

  /// Lowercased [toastActivatedArg], for case-insensitive comparison.
  static final String _toastActivatedArgLower =
      toastActivatedArg.toLowerCase();

  /// Stable app user model id. Must not change between runs or Windows will
  /// treat each build as a different app and drop the toast activation.
  static const String appUserModelId = 'FirebasePushReceiver.FirebasePushReceiver.1';

  /// Notification activator GUID. Registered by the plugin as a COM class
  /// factory so a toast click can start this app.
  static const String activatorGuid = '7A80D30B-8F39-4BC3-AE97-7F12D0F51234';

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static Future<bool>? _initialization;

  /// Emits the notification that was activated — on a cold start and on a
  /// warm click alike.
  static final StreamController<ActivatedToast> _activations =
      StreamController<ActivatedToast>.broadcast();

  static Stream<ActivatedToast> get activations => _activations.stream;

  /// True when this process was started by a notification click.
  static bool launchedFromToast = false;

  /// Initialise the plugin and wire up click handling.
  ///
  /// Safe to call more than once; the work only happens once.
  static Future<bool> initialize() {
    return _initialization ??= _initialize();
  }

  static Future<bool> _initialize() async {
    if (!Platform.isWindows) return false;
    try {
      await _plugin.initialize(
        settings: const InitializationSettings(
          windows: WindowsInitializationSettings(
            appName: 'Firebase Push Receiver',
            appUserModelId: appUserModelId,
            guid: activatorGuid,
          ),
        ),
        // Warm click: the app is already running.
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          final toast = parseActivation(response.payload);
          if (toast != null) _activations.add(toast);
        },
      );

      // Cold start: check whether this launch came from a toast click. This
      // has to happen after initialize(), otherwise the plugin has not yet
      // wired up its native side and the details come back empty.
      final launchDetails = await _plugin.getNotificationAppLaunchDetails();
      if (launchDetails?.didNotificationLaunchApp == true) {
        launchedFromToast = true;
        final toast = parseActivation(launchDetails?.notificationResponse?.payload);
        if (toast != null) _activations.add(toast);
      }

      await _registerColdStartActivator();
      return true;
    } catch (error) {
      debugPrint('Could not initialize Windows notifications: $error');
      return false;
    }
  }

  /// Writes `CLSID\{guid}\LocalServer32` so Windows can relaunch this exe when
  /// a toast is clicked while the app is not running.
  ///
  /// The plugin does not do this; without it, cold-start activation silently
  /// fails. Writing under `HKEY_CURRENT_USER` needs no elevation.
  static Future<void> _registerColdStartActivator() async {
    try {
      final exePath = Platform.resolvedExecutable;
      const key = 'HKCU\\Software\\Classes\\CLSID\\{$activatorGuid}\\LocalServer32';
      final result = await Process.run('reg', [
        'add',
        key,
        '/ve', // default value
        '/t',
        'REG_SZ',
        '/d',
        '"$exePath" $toastActivatedArg',
        '/f',
      ]);
      if (result.exitCode != 0) {
        debugPrint('[toast] could not register LocalServer32: ${result.stderr}');
      }
    } catch (error) {
      // Not fatal: warm clicks still work through CoRegisterClassObject.
      debugPrint('[toast] LocalServer32 registration failed: $error');
    }
  }

  /// Records that this process was started by a toast click.
  ///
  /// [arguments] is the entrypoint argument list the Windows runner forwards
  /// to Dart. Windows appends [toastActivatedArg] when it launches the exe to
  /// service a notification click.
  static String? consumeStartupArguments(List<String> arguments) {
    for (final argument in arguments) {
      if (argument.toLowerCase() == _toastActivatedArgLower) {
        launchedFromToast = true;
        return toastActivatedArg;
      }
    }
    return null;
  }

  /// Rebuilds the tapped notification from a toast launch payload.
  ///
  /// The payload is written by [showMessage] as small JSON. On a cold start the
  /// app has not yet received the push itself, so this is the only way the app
  /// can know *which* notification was tapped.
  static ActivatedToast? parseActivation(String? payload) {
    if (payload == null || payload.isEmpty) return null;
    // The command-line cold start carries only the flag, not the payload;
    // the real payload arrives via getNotificationAppLaunchDetails().
    if (payload.toLowerCase() == _toastActivatedArgLower) return null;
    try {
      final json = jsonDecode(payload);
      if (json is Map) {
        final title = json['title'];
        final body = json['body'];
        return ActivatedToast(
          id: json['id'] is int ? json['id'] as int : null,
          title: title is String && title.isNotEmpty ? title : 'Push notification',
          body: body is String ? body : '',
        );
      }
    } catch (_) {
      // Fall through and treat the raw string as the body.
    }
    return ActivatedToast(id: null, title: 'Push notification', body: payload);
  }

  /// Show a toast for a decrypted FCM message.
  static Future<void> showMessage(String message) async {
    if (!Platform.isWindows) return;

    try {
      if (!await initialize()) return;

      final notification = parseNotification(message);

      await _plugin.show(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        notificationDetails: const NotificationDetails(
          windows: WindowsNotificationDetails(
            // Toast buttons. `activationType: foreground` makes the button
            // bring this app forward; the resulting response arrives through
            // onDidReceiveNotificationResponse.
            actions: <WindowsAction>[
              WindowsAction(
                content: 'Open',
                arguments: 'open',
                activationType: WindowsActivationType.foreground,
              ),
            ],
          ),
        ),
        // The payload travels inside the toast XML `launch` attribute and is
        // what lets the app show *which* notification was tapped. The body is
        // already truncated by parseNotification, so it stays small.
        payload: jsonEncode({
          'id': notification.id,
          'title': notification.title,
          'body': notification.body,
        }),
      );
    } catch (error) {
      debugPrint('Could not display Windows notification: $error');
    }
  }

  /// Pull the human-readable title and body out of a decrypted FCM payload.
  ///
  /// FCM puts them under `notification` for display notifications, and
  /// `aps.alert` for APNs-shaped payloads. Data-only pushes put them wherever
  /// the sender chose, so the usual `title`/`body`/`message` keys are checked
  /// too. When the payload is not JSON at all, the raw text is shown as the
  /// body rather than being dropped.
  static ToastNotificationInfo parseNotification(String raw) {
    String? title;
    String? body;

    final trimmed = raw.trim();
    if (trimmed.startsWith('{')) {
      try {
        final json = jsonDecode(trimmed);
        if (json is Map) {
          title = _stringAt(json, const ['notification', 'title']);
          body = _stringAt(json, const ['notification', 'body']);

          title ??= _stringAt(json, const ['aps', 'alert', 'title']);
          body ??= _stringAt(json, const ['aps', 'alert', 'body']);
          if (body == null) {
            final alert = _valueAt(json, const ['aps', 'alert']);
            if (alert is String) body = alert;
          }

          for (final mapKey in const ['data', 'notification']) {
            final map = _valueAt(json, [mapKey]);
            if (map is! Map) continue;
            title ??= _firstString(map, const ['title', 'heading']);
            body ??= _firstString(
                map, const ['body', 'message', 'description', 'text']);
          }
        }
      } catch (_) {
        // Not valid JSON despite the leading brace - fall through to raw text.
      }
    }

    if (body == null || body.isEmpty) {
      // Show something rather than an empty toast.
      body = trimmed.isEmpty ? 'Empty notification' : trimmed;
    }
    if (body.length > 400) {
      body = '${body.substring(0, 400)}…';
    }

    return ToastNotificationInfo(
      id: trimmed.hashCode & 0x7fffffff,
      title:
          (title == null || title.isEmpty) ? 'New push notification' : title,
      body: body,
    );
  }

  static Object? _valueAt(Map<dynamic, dynamic> map, List<String> path) {
    Object? current = map;
    for (final key in path) {
      if (current is Map) {
        current = current[key];
      } else {
        return null;
      }
    }
    return current;
  }

  static String? _stringAt(Map<dynamic, dynamic> map, List<String> path) {
    final value = _valueAt(map, path);
    return value is String && value.isNotEmpty ? value : null;
  }

  static String? _firstString(Map<dynamic, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value is String && value.isNotEmpty) return value;
    }
    return null;
  }
}

/// A parsed FCM message ready to be shown as a toast.
class ToastNotificationInfo {
  const ToastNotificationInfo({
    required this.id,
    required this.title,
    required this.body,
  });

  /// Stable id for this message, so a repeat replaces the earlier toast.
  final int id;
  final String title;
  final String body;
}

/// A notification that the user activated from a toast.
class ActivatedToast {
  const ActivatedToast({
    required this.id,
    required this.title,
    required this.body,
  });

  /// Toast id, used to match the activated notification back to the message
  /// already listed in the app. Null when it could not be recovered.
  final int? id;
  final String title;
  final String body;
}