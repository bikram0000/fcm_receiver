# Changelog

## 0.0.2

- Formatted the whole package with `dart format` and resolved every
  analyzer finding, so `flutter analyze` and `dart analyze` are clean.
- Renamed the public constants (`MCS_SIZE`, `FCM_ENDPOINT`, `REGISTER_URL`,
  `CHECKIN_URL`, `HOST`, `PORT`, `MAX_RETRY_TIMEOUT`, ...) to Dart's
  `lowerCamelCase` convention. **Breaking for anyone who referenced them
  directly.**
- Replaced `print` diagnostics with `debugPrint`.
- Updated dependencies: `elliptic` 0.4, `pointycastle` 4, `flutter_lints` 6
  (and `window_manager` 0.5 / `cupertino_icons` 2 in the example app).

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