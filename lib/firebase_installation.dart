import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

// Define custom error class (optional)
class FirebaseError implements Exception {
  final String message;

  FirebaseError(this.message);

  @override
  String toString() => message;
}

// Firebase Installation Request model (camelCase by default)
class FirebaseInstallationRequest {
  final String appId;
  final String authVersion;
  final String fid;
  final String sdkVersion;

  FirebaseInstallationRequest(
      {required this.appId,
      required this.authVersion,
      required this.fid,
      required this.sdkVersion});

  Map<String, dynamic> toJson() => {
        'appId': appId,
        'authVersion': authVersion,
        'fid': fid,
        'sdkVersion': sdkVersion,
      };
}

// Firebase Installation Response model (camelCase by default)
class FirebaseInstallationResponse {
  final FirebaseInstallationAuthToken authToken;

  FirebaseInstallationResponse(this.authToken);

  factory FirebaseInstallationResponse.fromJson(Map<String, dynamic> json) {
    return FirebaseInstallationResponse(
      FirebaseInstallationAuthToken.fromJson(json['authToken']),
    );
  }
}

// Firebase Installation Auth Token model (camelCase by default)
class FirebaseInstallationAuthToken {
  final String token;

  FirebaseInstallationAuthToken(this.token);

  factory FirebaseInstallationAuthToken.fromJson(Map<String, dynamic> json) {
    return FirebaseInstallationAuthToken(json['token']);
  }
}

String generateFirebaseFid() {
  List<int> fid = List<int>.filled(17, 0);
  Random.secure().nextInt(256); // Warm-up for secure random number generation
  for (int i = 0; i < 17; i++) {
    fid[i] = Random.secure().nextInt(256);
  }
  fid[0] = 0x70 + (fid[0] % 0x10);
  return base64Url.encode(fid);
}
// // Function to generate a Firebase Installation ID (FID)
// String generateFirebaseFid() {
//   final fid = List<int>.generate(17, (index) => 0);
//   final random = Random();
//   random.nextBytes(fid);
//
//   fid[0] = (0b01110000 | (fid[0] & 0b00010000));
//   return base64UrlEncode(fid); // Assuming base64UrlEncode is available (check required libraries)
// }

// Function to fetch and return the Firebase Installation token
Future<String> getInstallation(
    {required String appId,
    required String projectId,
    required String apiKey}) async {
  final request = FirebaseInstallationRequest(
      appId: appId,
      authVersion: "FIS_v2",
      fid: generateFirebaseFid(),
      sdkVersion: "w:0.6.4");

  const heartbeatJson = '{"heartbeats": [], "version": 2}';
  final heartbeatHeaderValue = base64UrlEncode(utf8.encode(heartbeatJson));

  final client = http.Client();
  final url = Uri.parse(
      "https://firebaseinstallations.googleapis.com/v1/projects/$projectId/installations");
  final response = await client.post(
    url,
    headers: {
      "x-firebase-client": heartbeatHeaderValue,
      "x-goog-api-key": apiKey,
    },
    body: jsonEncode(request),
  );

  if (response.statusCode != 200) {
    throw FirebaseError(
        "Failed to fetch installation token: ${response.statusCode}");
  }

  final responseObject =
      FirebaseInstallationResponse.fromJson(jsonDecode(response.body));
  return responseObject.authToken.token;
}
