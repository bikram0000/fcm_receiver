import 'dart:convert';
import 'package:http/http.dart' as http;

import 'fcm.dart';

class FcmRegisterResult {
  final String fcmToken;
  final WebPushKeys keys;

  FcmRegisterResult(this.fcmToken, this.keys);
}

class WebPushKeys {
  final String authSecret;
  final String publicKey;

  WebPushKeys(this.authSecret, this.publicKey);
}

class FcmRegisterRequest {
  final FcmRegisterRequestWeb web;

  FcmRegisterRequest(this.web);

  Map<String, dynamic> toJson() => {'web': web.toJson()};
}

class FcmRegisterRequestWeb {
  final String applicationPubKey;
  final String auth;
  final String endpoint;
  final String p256dh;

  FcmRegisterRequestWeb(
      this.applicationPubKey, this.auth, this.endpoint, this.p256dh);

  Map<String, dynamic> toJson() => {
        'application_pub_key': applicationPubKey,
        'auth': auth,
        'endpoint': endpoint,
        'p256dh': p256dh,
      };
}

class FcmRegisterResponse {
  final String token;

  FcmRegisterResponse(this.token);

  factory FcmRegisterResponse.fromJson(Map<String, dynamic> json) =>
      FcmRegisterResponse(json['token']);
}

Future<Map<String, dynamic>> registerFcm2({
  required String projectId,
  required String apiKey,
  required String applicationPubKey,
  required String firebaseInstallationAuthToken,
  required String gcmToken,
}) async {
  final endpoint = 'https://fcm.googleapis.com/fcm/send/$gcmToken';

  var createdKeys = await createKeys();

  final request = FcmRegisterRequest(FcmRegisterRequestWeb(
    applicationPubKey,
    createdKeys['authSecret']!,
    endpoint,
    createdKeys['publicKey']!,
  ));

  final client = http.Client();
  final url =
      'https://fcmregistrations.googleapis.com/v1/projects/$projectId/registrations';
  final response = await client.post(Uri.parse(url),
      headers: {
        'x-goog-api-key': apiKey,
        'x-goog-firebase-installations-auth': firebaseInstallationAuthToken,
      },
      body: jsonEncode(request.toJson()));

  // print("registration 22 ${response.body}");
  final responseJson = jsonDecode(response.body);
  // final responseObj = FcmRegisterResponse.fromJson(responseJson);

  // return FcmRegisterResult(responseObj.token, pushKeys);
  return {
    'keys': createdKeys,
    'fcm': responseJson,
  };
}
