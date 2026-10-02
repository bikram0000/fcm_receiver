/// Pure-Dart decoder for the legacy ECE "aesgcm" content-encoding
/// (Web Push Encryption Draft 4) that FCM uses for encrypted push
/// messages.
///
/// This is a port of the Rust `fcm_decrypt` tool (which uses the `ece`
/// crate's `legacy::decrypt_aesgcm`), so encrypted push messages can be
/// decoded in-process on every platform — no `decoder.exe`, no native
/// library, no Python.
///
/// Algorithm:
///  1. ECDH P-256 between the receiver's private key and the sender's
///     ephemeral public key from the `crypto-key` header.
///  2. HKDF-SHA256 over the ECDH secret with the auth secret as salt to
///     get the intermediate key material (IKM).
///  3. HKDF-SHA256 over the IKM with the `encryption` header salt to
///     derive the AES-128 key and the 12-byte nonce.
///  4. AES-128-GCM decrypt (single record, so the IV is the nonce
///     itself), then strip the 2-byte big-endian ECE padding.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:elliptic/ecdh.dart' show computeSecret;
import 'package:elliptic/elliptic.dart' show PrivateKey, PublicKey, getP256;
// `show` keeps pointycastle's PublicKey/PrivateKey from clashing with
// the elliptic ones above.
import 'package:pointycastle/export.dart'
    show AEADParameters, AESEngine, GCMBlockCipher, HMac, KeyParameter, SHA256Digest;

// Sizes fixed by the ECE spec. The sender always uses AES-128-GCM with
// a 12-byte nonce and a 16-byte authentication tag.
const int _keyLength = 16;
const int _nonceLength = 12;
const int _saltLength = 16;
const int _authSecretLength = 16;
const int _tagLength = 16;

/// An uncompressed P-256 point: 0x04 || X(32 bytes) || Y(32 bytes).
const int _rawKeyLength = 65;

/// Length of the encoded key pair that goes into the HKDF info string:
/// (2-byte length prefix + 65-byte key) * 2.
const int _keypairLength = 134;

/// FCM never overrides the spec default record size of 4096.
const int _defaultRecordSize = 4096;

/// Decrypts an FCM message in the same JSON shape the Rust decoder
/// accepts:
///
/// ```json
/// {
///   "object": {
///     "rawData": [/* ciphertext bytes */],
///     "appData": [
///       {"key": "crypto-key", "value": "dh=<base64url>"},
///       {"key": "encryption", "value": "salt=<base64url>"}
///     ]
///   },
///   "keys": {
///     "privateKey": "<base64url>",
///     "publicKey": "<base64url>",
///     "authSecret": "<base64url>"
///   }
/// }
/// ```
///
/// Returns the decrypted payload (JSON for FCM data messages).
String decryptMessage(String messageJson) {
  final message = jsonDecode(messageJson) as Map<String, dynamic>;
  final object = message['object'] as Map<String, dynamic>;
  final keys = message['keys'] as Map<String, dynamic>;

  final ciphertext = Uint8List.fromList(
      (object['rawData'] as List<dynamic>).map((e) => e as int).toList());

  String appDataValue(String name) {
    for (final entry in (object['appData'] as List<dynamic>)) {
      final map = Map<String, dynamic>.from(entry as Map<String, dynamic>);
      if (map['key'] == name) {
        return map['value'] as String;
      }
    }
    throw ArgumentError('Missing appData entry "$name"');
  }

  // The Crypto-Key header is "dh=<sender public key>" and the Encryption
  // header is "salt=<salt>"; strip the prefixes before decoding.
  final senderPublicKey =
      _base64UrlDecode(appDataValue('crypto-key').substring(3));
  final salt = _base64UrlDecode(appDataValue('encryption').substring(5));

  final plaintext = decryptAesgcm(
    receiverPrivateKey: _base64UrlDecode(keys['privateKey'] as String),
    receiverPublicKey: _base64UrlDecode(keys['publicKey'] as String),
    senderPublicKey: senderPublicKey,
    authSecret: _base64UrlDecode(keys['authSecret'] as String),
    salt: salt,
    ciphertext: ciphertext,
  );

  return utf8.decode(plaintext);
}

/// Decrypts a single-record legacy "aesgcm" block, mirroring
/// `ece::legacy::decrypt_aesgcm`.
Uint8List decryptAesgcm({
  required Uint8List receiverPrivateKey,
  required Uint8List receiverPublicKey,
  required Uint8List senderPublicKey,
  required Uint8List authSecret,
  required Uint8List salt,
  required Uint8List ciphertext,
  int recordSize = _defaultRecordSize,
}) {
  if (authSecret.length != _authSecretLength) {
    throw ArgumentError('Invalid auth secret (expected 16 bytes)');
  }
  if (salt.length != _saltLength) {
    throw ArgumentError('Invalid salt (expected 16 bytes)');
  }
  // Only a single record is supported: the ciphertext minus the tag
  // must be smaller than the record size.
  if (ciphertext.length - _tagLength >= recordSize) {
    throw UnsupportedError('Multiple records are not supported');
  }
  if (ciphertext.length <= _tagLength + 2) {
    throw ArgumentError('Encrypted block is too short');
  }

  // ECDH between our (receiver) private key and the sender's ephemeral
  // public key.
  final curve = getP256();
  final privateKey = PrivateKey.fromBytes(curve, receiverPrivateKey);
  final publicKey =
      PublicKey.fromHex(curve, hex.encode(senderPublicKey));
  final sharedSecret =
      Uint8List.fromList(computeSecret(privateKey, publicKey));

  // The key-pair encoding goes into the HKDF info strings. In decrypt
  // mode the receiver's public key comes first, the sender's second.
  final keypair = _encodeKeys(receiverPublicKey, senderPublicKey);
  final keyInfo = _generateInfo('aesgcm', keypair);
  final nonceInfo = _generateInfo('nonce', keypair);

  // HKDF-SHA256 chain: first extract intermediate key material from the
  // ECDH secret using the auth secret as salt, then derive the
  // content-encryption key and the nonce from it using the salt.
  final ikm = _hkdfSha256(
    salt: authSecret,
    inputKeyMaterial: sharedSecret,
    info: utf8.encode('Content-Encoding: auth\u0000'),
    length: 32,
  );
  final key = _hkdfSha256(
    salt: salt,
    inputKeyMaterial: ikm,
    info: keyInfo,
    length: _keyLength,
  );
  final nonce = _hkdfSha256(
    salt: salt,
    inputKeyMaterial: ikm,
    info: nonceInfo,
    length: _nonceLength,
  );

  // A single record is encrypted with the derived nonce directly: XORing
  // the record index 0 into the nonce changes nothing.
  final paddedPlaintext = _aesGcmDecrypt(key, nonce, ciphertext);

  // ECE padding: a 2-byte big-endian pad length, that many zero bytes,
  // then the plaintext.
  final paddingLength = (paddedPlaintext[0] << 8) | paddedPlaintext[1];
  if (paddingLength + 2 >= paddedPlaintext.length) {
    throw StateError('Decrypt padding error');
  }
  for (var i = 2; i < 2 + paddingLength; i++) {
    if (paddedPlaintext[i] != 0) {
      throw StateError('Decrypt padding error');
    }
  }
  return paddedPlaintext.sublist(2 + paddingLength);
}

/// Length-prefixes two raw public keys for the HKDF info string.
Uint8List _encodeKeys(Uint8List key1, Uint8List key2) {
  if (key1.length != _rawKeyLength || key2.length != _rawKeyLength) {
    throw ArgumentError('Invalid public key (expected 65 bytes)');
  }
  return Uint8List(_keypairLength)
    ..[1] = _rawKeyLength
    ..setRange(2, 2 + _rawKeyLength, key1)
    ..[68] = _rawKeyLength
    ..setRange(69, 69 + _rawKeyLength, key2);
}

/// Builds the HKDF info string:
/// "Content-Encoding: <encoding>\0P-256\0" followed by the key pair.
Uint8List _generateInfo(String encoding, Uint8List keypair) {
  final prefix = utf8.encode('Content-Encoding: $encoding\u0000P-256\u0000');
  return Uint8List(prefix.length + keypair.length)
    ..setRange(0, prefix.length, prefix)
    ..setRange(prefix.length, prefix.length + keypair.length, keypair);
}

/// HKDF with SHA-256 (extract-then-expand), as specified by ECE.
Uint8List _hkdfSha256({
  required Uint8List salt,
  required Uint8List inputKeyMaterial,
  required Uint8List info,
  required int length,
}) {
  // Extract: PRK = HMAC-SHA256(salt, IKM).
  final prk = _hmacSha256(salt, inputKeyMaterial);

  // Expand: T(i) = HMAC-SHA256(prk, T(i-1) || info || i), starting
  // with i = 1 and an empty T(0).
  final output = BytesBuilder(copy: false);
  var blockIndex = 1;
  var previous = Uint8List(0);
  while (output.length < length) {
    previous = _hmacSha256(
        prk, Uint8List.fromList([...previous, ...info, blockIndex]));
    output.add(previous);
    blockIndex++;
  }
  return output.toBytes().sublist(0, length);
}

Uint8List _hmacSha256(Uint8List key, Uint8List data) {
  final mac = HMac(SHA256Digest(), 64)..init(KeyParameter(key));
  mac.update(data, 0, data.length);
  final tag = Uint8List(mac.macSize);
  mac.doFinal(tag, 0);
  return tag;
}

Uint8List _aesGcmDecrypt(
    Uint8List key, Uint8List nonce, Uint8List ciphertext) {
  final cipher = GCMBlockCipher(AESEngine());
  cipher.init(
    false,
    AEADParameters(KeyParameter(key), 128, nonce, Uint8List(0)),
  );
  // The ciphertext includes the trailing 16-byte authentication tag;
  // process() strips it and verifies it, throwing
  // InvalidCipherTextException on a mismatch.
  return cipher.process(ciphertext);
}

/// Base64url decode that accepts both padded and unpadded input, matching
/// the Rust `URL_SAFE` / `URL_SAFE_NO_PAD` engines used by the decoder.
Uint8List _base64UrlDecode(String input) =>
    base64Url.decode(base64Url.normalize(input));
