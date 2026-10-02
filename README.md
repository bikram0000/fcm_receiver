# fcm_receiver

Receive Firebase Cloud Messaging (FCM) pushes from Flutter on **any platform** —
Android, iOS, macOS, Windows, Linux — by speaking the Google MCS protocol
directly.

No `firebase_messaging`, no native `decoder.exe`, no `dart:ffi` setup. Encrypted
payloads are decrypted **in-process** by a pure-Dart implementation of the IETF
Encrypted Content Encoding (ECE) `aesgcm` algorithm.

Useful when you need FCM on a platform `firebase_messaging` does not cover —
most commonly Windows desktop.

## Install

```yaml
dependencies:
  fcm_receiver: ^0.0.1
```

```sh
flutter pub get
```

## Setup

### 1. Get your project values

Firebase console → ⚙ **Project settings**:

| Value           | Where                                              |
|-----------------|----------------------------------------------------|
| `senderId`      | Cloud Messaging → Sender ID                         |
| `webApiKey`     | General → Your apps → Web API Key                   |
| `projectId`     | General → Project ID                                |
| `firebaseAppID` | General → Your apps → App ID                        |
| `vapidKey`      | Web configuration → Web Push certificates           |

All five are required. `vapidKey` is the **public** VAPID key; `init()` cannot
complete without it.

> The plugin registers as the **web** SDK, so `firebaseAppID` should be a Web
> app ID in `1:<sender>:web:<hash>` form.

### 2. Pass them in

Keep them out of your source control with `--dart-define`:

```dart
const senderId      = String.fromEnvironment('FCM_SENDER_ID');
const webApiKey     = String.fromEnvironment('FCM_WEB_API_KEY');
const projectId     = String.fromEnvironment('FCM_PROJECT_ID');
const firebaseAppID = String.fromEnvironment('FCM_APP_ID');
const vapidKey      = String.fromEnvironment('FCM_VAPID_KEY');
```

```sh
flutter run \
  --dart-define=FCM_SENDER_ID=1234567890 \
  --dart-define=FCM_WEB_API_KEY=AIza... \
  --dart-define=FCM_PROJECT_ID=my-project \
  --dart-define=FCM_APP_ID=1:1234567890:web:abcdef \
  --dart-define=FCM_VAPID_KEY=BPKr...
```

Or read them from a JSON file you gitignore — see
[`example/lib/firebase_config.dart`](example/lib/firebase_config.dart) for a
working implementation of exactly that.

## Usage

```dart
import 'package:fcm_receiver/messaging_utility.dart';

await MessagingUtility.instance.init(
  senderId: senderId,
  firebaseAppID: firebaseAppID,
  webApiKey: webApiKey,
  projectId: projectId,
  vapidKey: vapidKey,
  onTokenRefresh: (token) => print('FCM token: $token'),
  onNewMessage: (message) => print('Decrypted: $message'),
);
```

`onNewMessage` receives the **decrypted** payload. To send a push, hand the
token from `onTokenRefresh` to your backend or the FCM HTTP v1 API.

### Optional parameters

| Parameter      | Purpose                                                       |
|----------------|---------------------------------------------------------------|
| `storagePath`  | Where the Hive box is written. Defaults to `Directory.current`. |
| `boxName`      | Hive box name. Defaults to `testBox`.                          |

```dart
await MessagingUtility.instance.init(
  // ...
  storagePath: (await getApplicationSupportDirectory()).path,
  boxName: 'push_credentials',
);
```

### Other methods

```dart
MessagingUtility.instance.getToken();    // current token, registers if missing
MessagingUtility.instance.register();   // force a fresh registration
MessagingUtility.instance.deleteToken(); // unregister and clear the local token
```

Watch the connection with `MessagingUtility.instance.reactiveConnection.status`.

## What it does

1. Registers a virtual Chrome/Android client with Google's check-in, GCM and
   FCM registration endpoints.
2. Opens a persistent MCS socket to `mtalk.google.com:5228`.
3. For each `DataMessageStanza`, derives an ECDH P-256 shared secret with the
   sender's ephemeral key, derives the AES-128-GCM key and nonce via
   HKDF-SHA256, decrypts, strips the padding prefix, and hands you the JSON.
4. Reconnects with exponential backoff (2s → 4s → 8s, capped at 60s) on
   failure, up to 10 consecutive attempts, and refills that budget once a
   connection proves healthy.

The Hive box stores your keypair, auth secret, `androidId`, `securityToken`,
FCM token and a Firebase Installations JWT. Treat it as a secret — do not
commit it.

## Example

A full Flutter app showing token display, connection status, decrypted
messages, and native Windows toasts lives in [`example/`](example/).

### Demo

A short screen recording of the example app receiving, decrypting and
displaying a real push notification:

[![Demo video](https://raw.githubusercontent.com/bikram0000/fcm_receiver/main/doc/demo.mp4)](https://github.com/bikram0000/fcm_receiver/blob/main/doc/demo.mp4)

<video controls width="640">
  <source src="https://raw.githubusercontent.com/bikram0000/fcm_receiver/main/doc/demo.mp4" type="video/mp4">
  Your browser cannot play embedded video —
  <a href="https://github.com/bikram0000/fcm_receiver/blob/main/doc/demo.mp4">view the demo video on GitHub</a>.
</video>

Or download it directly:
[doc/demo.mp4](https://github.com/bikram0000/fcm_receiver/raw/main/doc/demo.mp4)

## Limitations

- Android only — this is an MCS client, not the Play Services SDK.
- Requires the project to have a **Web** app registered for a WebPush
  subscription.
- Repeating/scheduled notifications are not supported.
- You need your own backend or the FCM HTTP v1 API to send pushes; this
  package receives them.

## License

MIT — see [LICENSE](LICENSE).

## Source

Source code, issue tracker and the demo video live at
[github.com/bikram0000/fcm_receiver](https://github.com/bikram0000/fcm_receiver).