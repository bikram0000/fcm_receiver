import 'dart:io';
import 'dart:async';

import 'package:fcm_receiver/messaging_utility.dart';
import 'package:fcm_receiver/reactive_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

import 'firebase_config.dart';
import 'windows_notification_service.dart';

void main(List<String> arguments) {
  // The plugin's channel handlers need the binding to exist first.
  WidgetsFlutterBinding.ensureInitialized();
  // window_manager must be initialised before any show/focus call.
  unawaited(windowManager.ensureInitialized());
  // A toast click cold-starts the exe with '-ToastActivated'; the Windows
  // runner forwards the command line here.
  WindowsNotificationService.consumeStartupArguments(arguments);
  // Set up toasts before the first frame so a cold start launched by a
  // notification click is detected via getNotificationAppLaunchDetails().
  unawaited(WindowsNotificationService.initialize());
  runApp(const MyApp());
}

/// Brings the window back to the foreground when a notification is tapped.
///
/// If the app is minimized or sitting behind other windows, tapping a toast
/// should surface it rather than silently updating state the user cannot see.
Future<void> bringWindowToFront() async {
  if (!Platform.isWindows) return;
  try {
    if (await windowManager.isMinimized()) {
      await windowManager.restore();
    }
    // `show` restores a hidden window and `focus` moves it to the front of the
    // z-order. Both are needed: a minimized window is already "shown".
    await windowManager.show();
    await windowManager.focus();
  } catch (error) {
    debugPrint('[window] could not bring window to front: $error');
  }
}

const _ink = Color(0xFF17243B);
const _muted = Color(0xFF69778C);
const _background = Color(0xFFF5F7FB);
const _accent = Color(0xFF5268E8);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _ReceivedMessage {
  const _ReceivedMessage(this.id, this.body, this.receivedAt);

  /// Matches [ToastNotificationInfo.id], so a toast tap can be matched back to
  /// this message in the list.
  final int id;
  final String body;
  final DateTime receivedAt;
}

class _MyAppState extends State<MyApp> {
  String _token = '';
  String? _error;
  final List<_ReceivedMessage> _messages = [];
  ConnectionStatus _status = ConnectionStatus.pending;

  /// Which token action is currently running, so the buttons can show progress
  /// and be disabled while a network call is in flight.
  String? _tokenAction;
  StreamSubscription<ConnectionStatus>? _connectionSubscription;
  StreamSubscription<ActivatedToast>? _notificationTapSubscription;

  /// The notification the user opened from a toast, shown prominently so it is
  /// obvious which one they tapped. Null until they tap one.
  ActivatedToast? _openedFromToast;
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    final utility = MessagingUtility.instance;
    _status = utility.reactiveConnection.status;
    _connectionSubscription = utility.reactiveConnection.statusStream.listen(
      (status) {
        if (mounted) setState(() => _status = status);
      },
    );
    _notificationTapSubscription =
        WindowsNotificationService.activations.listen((toast) {
      if (!mounted) return;
      setState(() => _openedFromToast = toast);
      // Surface the window: it may be minimized or behind another app.
      unawaited(bringWindowToFront());
    });
    _initializeMessaging();
    // Opened by a toast click before any push arrived in this process.
    if (WindowsNotificationService.launchedFromToast) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _revealApp());
    }
  }

  /// Runs when the app is launched by a toast click but the activation payload
  /// has not arrived yet (the command-line flag arrives first).
  ///
  /// On a cold start the Windows runner has already created and shown the
  /// window before Dart runs, but it may still land behind other windows, so
  /// focus it explicitly.
  void _revealApp() {
    if (!mounted) return;
    setState(() {});
    unawaited(bringWindowToFront());
  }

  Future<void> _initializeMessaging() async {
    try {
      await MessagingUtility.instance.init(
        senderId: FirebaseConfig.senderId,
        firebaseAppID: FirebaseConfig.firebaseAppID,
        webApiKey: FirebaseConfig.webApiKey,
        projectId: FirebaseConfig.projectId,
        vapidKey: FirebaseConfig.vapidKey,
        onTokenRefresh: (value) {
          if (mounted) setState(() => _token = value);
        },
        onNewMessage: (value) {
          if (!mounted) return;
          final message = value.toString();
          setState(() {
            _messages.insert(0, _ReceivedMessage(
                WindowsNotificationService.parseNotification(message).id,
                message,
                DateTime.now()));
            if (_messages.length > 20) _messages.removeLast();
          });
          unawaited(WindowsNotificationService.showMessage(message));
        },
      );
    } catch (error) {
      if (mounted) setState(() => _error = error.toString());
    }
  }

  @override
  void dispose() {
    _connectionSubscription?.cancel();
    _notificationTapSubscription?.cancel();
    super.dispose();
  }

  String get _statusLabel {
    if (_error != null) return 'Setup failed';
    switch (_status) {
      case ConnectionStatus.connected:
        return 'Connected';
      case ConnectionStatus.connecting:
        return 'Connecting';
      case ConnectionStatus.disconnected:
        return 'Disconnected';
      case ConnectionStatus.pending:
        return 'Starting up';
    }
  }

  Color get _statusColor =>
      _error != null || _status == ConnectionStatus.disconnected
          ? const Color(0xFFEF705C)
          : _status == ConnectionStatus.connected
              ? const Color(0xFF38B99A)
              : const Color(0xFFF5B956);

  /// Shows a snackbar without touching [context].
///
/// Safe to call after an `await`, unlike `ScaffoldMessenger.of(context)`.
void _notify(String message, {bool isError = false}) {
    _scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? const Color(0xFFEF705C) : null,
        ),
      );
  }

  Future<void> _copyToken() async {
    if (_token.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: _token));
    if (!mounted) return;
    _notify('FCM token copied to clipboard');
  }

  /// Forces a fresh FCM registration and shows the resulting token.
  ///
  /// [MessagingUtility.register] always re-registers, unlike `getToken` which
  /// only registers when no token is stored, so this is what actually forces a
  /// new token rather than re-reading the cached one.
  Future<void> _refreshToken() async {
    if (_tokenAction != null) return;
    setState(() => _tokenAction = 'refresh');
    try {
      final token = await MessagingUtility.instance.register();
      if (!mounted) return;
      setState(() {
        _token = token;
        _tokenAction = null;
      });
      _notify('Registered a new FCM token');
    } catch (error) {
      if (!mounted) return;
      setState(() => _tokenAction = null);
      _notify('Refresh failed: $error', isError: true);
    }
  }

  /// Deletes the FCM registration, both server-side and in local storage.
  Future<void> _deleteToken() async {
    if (_tokenAction != null) return;
    setState(() => _tokenAction = 'delete');
    try {
      await MessagingUtility.instance.deleteToken();
      if (!mounted) return;
      setState(() {
        _token = '';
        _tokenAction = null;
      });
      _notify('FCM token deleted');
    } catch (error) {
      if (!mounted) return;
      setState(() => _tokenAction = null);
      _notify('Delete failed: $error', isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Receiver',
      scaffoldMessengerKey: _scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _accent),
        scaffoldBackgroundColor: _background,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: _ink, displayColor: _ink),
      ),
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          final wide = constraints.maxWidth >= 900;
          return Row(
            children: [
              if (wide) _sidebar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1180),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: wide ? 48 : 24,
                          vertical: wide ? 42 : 28,
                        ),
                        child: _dashboard(wide, context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _sidebar() {
    return Container(
      width: 240,
      color: const Color(0xFF17243B),
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            _brandIcon(),
            const SizedBox(width: 12),
            const Text('PULSE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2)),
          ]),
          const SizedBox(height: 64),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(children: [
              Icon(Icons.dashboard_rounded, color: Colors.white, size: 20),
              SizedBox(width: 14),
              Text('Overview',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ]),
          ),
          const Spacer(),
          const Text('FCM PUSH RECEIVER',
              style: TextStyle(
                  color: Color(0xFF94A4BF),
                  fontSize: 11,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text('Your notification workspace',
              style: TextStyle(color: Color(0xFF94A4BF), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _brandIcon() => Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: _accent,
          borderRadius: BorderRadius.circular(11),
        ),
        child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 24),
      );

  Widget _dashboard(bool wide, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          if (!wide) ...[_brandIcon(), const SizedBox(width: 12)],
          const Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Overview',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.8)),
              SizedBox(height: 4),
              Text('Your push notifications, all in one place.',
                  style: TextStyle(color: _muted, fontSize: 14)),
            ]),
          ),
          if (wide) _statusBadge(),
        ]),
        if (_openedFromToast != null) ...[
          const SizedBox(height: 20),
          _openedFromToastCard(context),
        ],
        const SizedBox(height: 32),
        _hero(),
        const SizedBox(height: 26),
        if (wide)
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(flex: 3, child: _tokenCard(context)),
            const SizedBox(width: 24),
            Expanded(flex: 2, child: _connectionCard()),
          ])
        else ...[
          _tokenCard(context),
          const SizedBox(height: 20),
          _connectionCard(),
        ],
        const SizedBox(height: 26),
        _messagesCard(context),
        const SizedBox(height: 24),
        const Center(
            child: Text('Powered by fcm_receiver',
                style: TextStyle(color: _muted, fontSize: 12))),
      ],
    );
  }

  /// Highlights the notification the user opened from a Windows toast, so it is
  /// clear which one they tapped. Dismissible.
  Widget _openedFromToastCard(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(18, 14, 10, 14),
        decoration: BoxDecoration(
          color: const Color(0xFFEEF0FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _accent, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.notifications_active_rounded,
                color: _accent, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Opened from notification',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _accent,
                          letterSpacing: 0.4)),
                  const SizedBox(height: 4),
                  Text(_openedFromToast!.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  if (_openedFromToast!.body.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(_openedFromToast!.body,
                        style: const TextStyle(fontSize: 13, height: 1.4)),
                  ],
                ],
              ),
            ),
            IconButton(
              tooltip: 'Dismiss',
              icon: const Icon(Icons.close_rounded, size: 18, color: _muted),
              onPressed: () => setState(() => _openedFromToast = null),
            ),
          ],
        ),
      );

  Widget _statusBadge() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xFFE8ECF3))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
              width: 8,
              height: 8,
              decoration:
                  BoxDecoration(color: _statusColor, shape: BoxShape.circle)),
          const SizedBox(width: 9),
          Text(_statusLabel,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ]),
      );

  Widget _hero() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFF5268E8), Color(0xFF3547AD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Wrap(
            spacing: 24,
            runSpacing: 22,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                  width: 470,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 6),
                          decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.17),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text('LIVE DASHBOARD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.4)),
                        ),
                        const SizedBox(height: 18),
                        const Text('Messages in motion.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.7)),
                        const SizedBox(height: 10),
                        const Text(
                            'Receive and view decrypted Firebase Cloud Messaging events in real time.',
                            style: TextStyle(
                                color: Color(0xFFE0E5FF),
                                fontSize: 14,
                                height: 1.5)),
                      ])),
              Container(
                width: 106,
                height: 106,
                decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(28)),
                child: const Icon(Icons.notifications_active_outlined,
                    color: Colors.white, size: 52),
              ),
            ]),
      );

  Widget _card({required Widget child}) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE9EDF4)),
          boxShadow: const [
            BoxShadow(
                color: Color(0x080E2041), blurRadius: 24, offset: Offset(0, 8))
          ],
        ),
        child: child,
      );

  Widget _tokenCard(BuildContext context) => _card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(children: [
            Icon(Icons.key_rounded, color: _accent, size: 21),
            SizedBox(width: 10),
            Text('Device token',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 8),
          const Text(
              'Use this token to send a test notification to this device.',
              style: TextStyle(color: _muted, fontSize: 13)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _background, borderRadius: BorderRadius.circular(12)),
            child: SelectableText(
              _token.isEmpty ? 'Waiting for a device token…' : _token,
              style: TextStyle(
                  fontSize: 12,
                  height: 1.6,
                  color: _token.isEmpty ? _muted : _ink,
                  fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton.icon(
                onPressed: _token.isEmpty || _tokenAction != null
                    ? null
                    : _copyToken,
                icon: const Icon(Icons.content_copy_rounded, size: 16),
                label: const Text('Copy token'),
              ),
              OutlinedButton.icon(
                onPressed: _tokenAction != null ? null : _refreshToken,
                icon: _tokenAction == 'refresh'
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Refresh token'),
              ),
              OutlinedButton.icon(
                onPressed: _token.isEmpty || _tokenAction != null
                    ? null
                    : _deleteToken,
                icon: _tokenAction == 'delete'
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.delete_outline_rounded, size: 16),
                label: const Text('Delete token'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFEF705C),
                ),
              ),
            ],
          ),
        ],
      ));

  Widget _connectionCard() => _card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(children: [
            Icon(Icons.wifi_tethering_rounded, color: _accent, size: 21),
            SizedBox(width: 10),
            Text('Connection',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 22),
          Row(children: [
            Container(
                width: 12,
                height: 12,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: _statusColor)),
            const SizedBox(width: 10),
            Text(_statusLabel,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 12),
          Text(_error ?? 'Connection to the FCM messaging server.',
              style: const TextStyle(color: _muted, fontSize: 13, height: 1.5)),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFFE9EDF4)),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Messages received',
                style: TextStyle(color: _muted, fontSize: 13)),
            Text('${_messages.length}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ]),
        ],
      ));

  Widget _messagesCard(BuildContext context) => _card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent messages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          const Text('Decrypted notifications appear here as they arrive.',
              style: TextStyle(color: _muted, fontSize: 13)),
          const SizedBox(height: 20),
          if (_messages.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 16),
              decoration: BoxDecoration(
                  color: _background, borderRadius: BorderRadius.circular(14)),
              child: const Column(children: [
                Icon(Icons.inbox_outlined, color: Color(0xFF9AA8BF), size: 36),
                SizedBox(height: 12),
                Text('No messages yet',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                SizedBox(height: 5),
                Text('Your next notification will show up here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: _muted, fontSize: 13)),
              ]),
            )
          else
            for (final item in _messages) ...[
              const Divider(color: Color(0xFFE9EDF4)),
              const SizedBox(height: 8),
              if (_openedFromToast != null &&
                  _openedFromToast!.id != null &&
                  item.id == _openedFromToast!.id) ...[
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF0FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(children: [
                    Icon(Icons.push_pin_rounded, color: _accent, size: 15),
                    SizedBox(width: 7),
                    Text('Opened from notification',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _accent)),
                  ]),
                ),
              ],
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEEF0FF),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.notifications_none_rounded,
                        color: _accent, size: 20)),
                const SizedBox(width: 14),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                          'Push notification · ${TimeOfDay.fromDateTime(item.receivedAt).format(context)}',
                          style: const TextStyle(color: _muted, fontSize: 12)),
                      const SizedBox(height: 6),
                      SelectableText(item.body,
                          style: const TextStyle(fontSize: 14, height: 1.5)),
                    ])),
              ]),
              const SizedBox(height: 8),
            ],
        ],
      ));
}
