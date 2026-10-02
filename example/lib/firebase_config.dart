import 'dart:convert';
import 'dart:io';

/// Firebase project credentials for [MessagingUtility.init].
///
/// ## Where the values come from
///
/// **No credentials live in this file.** It ships `YOUR_*` placeholders and
/// loads the real values from a local, git-ignored `firebase_config.local.json`
/// at runtime:
///
/// 1. Copy `firebase_config.local.json.example` to
///    `firebase_config.local.json` (both live in the `example/` folder).
/// 2. Fill it in with your own project's values.
/// 3. `flutter run`. Nothing else is needed.
///
/// `firebase_config.local.json` is listed in `.gitignore`, so your credentials
/// stay on your machine. Delete the file and the app falls back to the
/// placeholders below, which will fail registration rather than leak anything.
///
/// ## Where each value comes from in the Firebase console
///
/// | Key             | Location                                            |
/// |-----------------|-----------------------------------------------------|
/// | `senderId`      | Cloud Messaging → Sender ID                         |
/// | `webApiKey`     | General → Your apps → Web API Key                   |
/// | `projectId`     | General → Project ID                                |
/// | `firebaseAppID` | General → Your apps → App ID                        |
/// | `vapidKey`      | General → Web configuration → Web Push certificates |
///
/// ## Notes
///
/// * The Web API Key is **shared by every app in the project** — the Android,
///   iOS and Web app all show the same key.
/// * The plugin masquerades as the web SDK (`sdkVersion: "w:0.6.4"`, checkin
///   type `DEVICE_CHROME_BROWSER`) and registers through
///   `fcmregistrations.googleapis.com` with a WebPush subscription, so an App
///   ID in `1:<sender>:web:<hash>` form is the consistent choice.
/// * `authDomain`, `databaseURL`, `storageBucket` and `measurementId` are not
///   used by this plugin — it never touches Analytics, RTDB or Storage.
class FirebaseConfig {
  FirebaseConfig._();

  static const String _fileName = 'firebase_config.local.json';

  /// Placeholders used when no local credentials file is present.
  static const Map<String, String> _defaults = <String, String>{
    'senderId': 'YOUR_SENDER_ID',
    'webApiKey': 'YOUR_WEB_API_KEY',
    'projectId': 'YOUR_PROJECT_ID',
    'firebaseAppID': 'YOUR_FIREBASE_APP_ID',
    'vapidKey': 'YOUR_VAPID_PUBLIC_KEY',
  };

  static Map<String, String>? _overrides;
  static bool _loaded = false;

  /// True when a local credentials file supplied real values.
  static bool get isConfigured {
    _ensureLoaded();
    return !_defaults.containsValue(senderId);
  }

  /// Project settings → Cloud Messaging → Sender ID.
  static String get senderId => _value('senderId');

  /// Project settings → General → Your apps → Web API Key.
  static String get webApiKey => _value('webApiKey');

  /// Project settings → General → Project ID.
  static String get projectId => _value('projectId');

  /// Project settings → General → Your apps → App ID.
  static String get firebaseAppID => _value('firebaseAppID');

  /// Project settings → Web configuration → Web Push certificates.
  ///
  /// This is the VAPID **public** key and is sent as `application_pub_key`
  /// during FCM registration. `init()` cannot complete without it.
  static String get vapidKey => _value('vapidKey');

  static String _value(String key) {
    _ensureLoaded();
    return _overrides?[key] ?? _defaults[key]!;
  }

  static void _ensureLoaded() {
    if (_loaded) return;
    _loaded = true;
    for (final path in _candidatePaths()) {
      try {
        final file = File(path);
        if (!file.existsSync()) continue;
        final decoded = jsonDecode(file.readAsStringSync());
        if (decoded is! Map) continue;
        final values = <String, String>{
          for (final entry in decoded.entries)
            if (entry.key is String && entry.value is String &&
                (entry.value as String).isNotEmpty)
              entry.key as String: entry.value as String,
        };
        if (values.isEmpty) continue;
        _overrides = values;
        return;
      } catch (_) {
        // Unreadable or malformed - fall through to the next candidate.
      }
    }
  }

  /// Locations to look for the local credentials file.
  ///
  /// Debug runs start with the current directory at the `example/` folder, but
  /// a release build runs from the install directory, so both are checked.
  static List<String> _candidatePaths() {
    final paths = <String>[];
    final current = Directory.current.path;
    paths.add(File('$current/$_fileName').path);
    paths.add(File('$current/example/$_fileName').path);

    if (Platform.isWindows) {
      try {
        final exeDir = File(Platform.resolvedExecutable).parent.path;
        paths.add(File('$exeDir/$_fileName').path);
        paths.add(File('$exeDir/data/flutter_assets/$_fileName').path);
      } catch (_) {
        // Ignore - the two paths above are enough for `flutter run`.
      }
    }
    return paths;
  }
}