import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:elliptic/elliptic.dart';
import 'package:http/http.dart' as http;

const String fcmSubscribe = 'https://fcm.googleapis.com/fcm/connect/subscribe';
const String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

Future<Map<String, dynamic>> registerFCM(
    {required String senderId, required String token}) async {
  final keys = await createKeys();
  final response = await http.post(Uri.parse(fcmSubscribe), headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
  }, body: {
    'authorized_entity': senderId,
    'endpoint': '$fcmEndpoint/$token',
    'encryption_key': keys['publicKey']!
        .replaceAll('=', '')
        .replaceAll('+', '-')
        .replaceAll('/', '_'),
    'encryption_auth': keys['authSecret']!
        .replaceAll('=', '')
        .replaceAll('+', '-')
        .replaceAll('/', '_'),
  });
  return {
    'keys': keys,
    'fcm': jsonDecode(response.body),
  };
}

Future<Map<String, String>> createKeys() async {
  // Generate a new random symmetric key pair
  // var keyPair = KeyPair.generateEc(algorithms.encryption.aes.gcm);
  var ec = getP256();

  var privateAlice = ec.generatePrivateKey();

  var publicAlice = privateAlice.publicKey.toHex();
  final random = Random();
  final randomBytes = List<int>.generate(16, (_) {
    late int codeUnit;
    switch (random.nextInt(3)) {
      case 0:
        codeUnit = random.nextInt(10) + 48;
        break;
      case 1:
        codeUnit = random.nextInt(26) + 65;
        break;
      case 2:
        codeUnit = random.nextInt(26) + 97;
        break;
    }
    return codeUnit;
  });

  Map<String, String> keys = {
    'privateKey': toBase64(privateAlice.bytes),
    'publicKey': toBase64(hex.decode(publicAlice)),
    'authSecret': toBase64(randomBytes),
  };
  return Future.value(keys);
}

String escape(String string) {
  return string
      .replaceAll(RegExp('='), '')
      .replaceAll(RegExp(r'\+'), '-')
      .replaceAll(RegExp(r'/'), '_');
}

String toBase64(List<int> input) {
  return escape(base64.encode(input));
}
