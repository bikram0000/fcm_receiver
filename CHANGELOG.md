# Changelog

## 0.0.1

- Initial release.
- Receive FCM pushes over the Google MCS protocol on any Flutter platform,
  with no native binary and no `dart:ffi` setup.
- Pure-Dart ECE `aesgcm` decryption: encrypted payloads are decrypted
  in-process, so the package works on Android, iOS, macOS, Windows and Linux.
- `getToken()`, `register()` and `deleteToken()` for token management.
- Connection status exposed through `reactiveConnection.status`.
- Automatic reconnection with exponential backoff, capped at 10 consecutive
  attempts.
- Credentials are supplied by the caller via `init()`, so no secrets are
  shipped with the package.