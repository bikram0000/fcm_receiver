import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fcm_receiver/fcm2.dart';
import 'package:fcm_receiver/firebase_installation.dart';
import 'package:fcm_receiver/parser.dart';
import 'package:fcm_receiver/protos/android_checkin.pb.dart';
import 'package:fcm_receiver/protos/mcs.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'constants.dart';
import 'decrypt/ece_aesgcm.dart' as ece;
import 'fcm.dart';
import 'hive_storage.dart';
import 'protos/checkin.pb.dart';
import 'reactive_connection.dart';

class MessagingUtility {
  //initialize..
  static MessagingUtility? _instance;

  MessagingUtility._internal();

  static MessagingUtility get instance => _getInstance();

  static MessagingUtility _getInstance() {
    _instance ??= MessagingUtility._internal();
    return _instance!;
  }

  HiveStorage hiveStorage = HiveStorage();

  final registerUrl = 'https://android.clients.google.com/c2dm/register3';
  final checkinUrl = 'https://android.clients.google.com/checkin';
  final mcsHost = 'mtalk.google.com';
  final mcsPort = 5228;
  final maxRetryTimeout = 15;

  /// Maximum number of consecutive reconnection attempts before giving up.
  ///
  /// The budget resets once a connection has stayed up long enough to be
  /// considered healthy, so this limits a *run* of failures rather than
  /// capping how often the client may ever reconnect.
  static const int maxReconnectAttempts = 10;

  /// How long a connection must survive before the retry budget is refilled.
  static const Duration _healthyConnectionThreshold = Duration(minutes: 1);

  /// Base delay for the exponential backoff between attempts.
  static const Duration _reconnectBaseDelay = Duration(seconds: 2);

  /// Upper bound on a single backoff wait.
  static const Duration _reconnectMaxDelay = Duration(seconds: 60);

  /// How long to wait for the TCP/TLS handshake before treating it as failed.
  static const Duration _connectTimeout = Duration(seconds: 20);

  int _reconnectAttempts = 0;
  Timer? _reconnectTimer;
  Timer? _healthyTimer;
  bool _connectInFlight = false;
  SecureSocket? _activeSocket;
  Parser? _activeParser;

  /// Number of reconnection attempts made since the last healthy connection.
  int get reconnectAttempts => _reconnectAttempts;

  final fcmKey = [
    0x04,
    0x33,
    0x94,
    0xf7,
    0xdf,
    0xa1,
    0xeb,
    0xb1,
    0xdc,
    0x03,
    0xa2,
    0x5e,
    0x15,
    0x71,
    0xdb,
    0x48,
    0xd3,
    0x2e,
    0xed,
    0xed,
    0xb2,
    0x34,
    0xdb,
    0xb7,
    0x47,
    0x3a,
    0x0c,
    0x8f,
    0xc4,
    0xcc,
    0xe1,
    0x6f,
    0x3c,
    0x8c,
    0x84,
    0xdf,
    0xab,
    0xb6,
    0x66,
    0x3e,
    0xf2,
    0x0c,
    0xd4,
    0x8b,
    0xfe,
    0xe3,
    0xf9,
    0x76,
    0x2f,
    0x14,
    0x1c,
    0x63,
    0x08,
    0x6a,
    0x6f,
    0x2d,
    0xb1,
    0x1a,
    0x95,
    0xb0,
    0xce,
    0x37,
    0xc0,
    0x9c,
    0x6e,
  ];
  late String serverKey;
  bool initialized = false;
  var credentials = {};

  var projectId = "";
  var senderId = "";
  var firebaseAppID = "";
  var webApiKey = "";
  var uuid = '';
  String vapidKey = '';

  // 04fed190-5c92-409d-b8e5-7f42e4a00b81
  GservicesSetting? root;
  Function(dynamic)? onNewMessage;
  Function(String)? onTokenRefresh;
  final reactiveConnection = ReactiveConnection();

  bool reconnectAuto = true;

  Future<void> init({
    required String senderId,
    required String firebaseAppID,
    required String webApiKey,
    required String projectId,
    String? storagePath,
    required String vapidKey,
    String? boxName,
    required Function(String) onTokenRefresh,
    required Function(dynamic) onNewMessage,
  }) async {
    initialized = true;
    this.senderId = senderId;
    this.webApiKey = webApiKey;
    this.firebaseAppID = firebaseAppID;
    this.vapidKey = vapidKey;
    this.projectId = projectId;
    this.onNewMessage = onNewMessage;
    this.onTokenRefresh = onTokenRefresh;
    await hiveStorage.init(storagePath: storagePath, boxName: boxName);
    String? fcmToken = hiveStorage.getBox.get('fcmToken');
    if (fcmToken != null && fcmToken.isNotEmpty && fcmToken != 'null') {
      String androidId = hiveStorage.getBox.get('androidId');
      String securityToken = hiveStorage.getBox.get('securityToken');
      // await checkIn(securityToken: securityToken, androidId: androidId);
      await sendData(securityToken: securityToken, androidId: androidId);
    } else {
      await register();
      fcmToken = hiveStorage.getBox.get('fcmToken');
    }
    if (fcmToken != null) {
      onTokenRefresh(fcmToken);
    }
  }

  Future<String> register() async {
    uuid = const Uuid().v4();
    serverKey = toBase64(Uint8List.fromList(fcmKey));
    var appId = "wp:receiver.push.com#$uuid";
    var gsm = await registerGCM(appId);

    var firebaseInstallationAuthToken = await getInstallation(
      appId: firebaseAppID,
      projectId: projectId,
      apiKey: webApiKey,
    );
    var fcm = await registerFcm2(
      projectId: projectId,
      apiKey: webApiKey,
      applicationPubKey: vapidKey,
      firebaseInstallationAuthToken: firebaseInstallationAuthToken,
      gcmToken: gsm['token'],
    );
    // var fcm = await registerFCM(senderId: senderId, token: gsm['token']);
    credentials.addAll(gsm);
    credentials.addAll(fcm);
    await checkIn(
      androidId: gsm['androidId'].toString(),
      securityToken: gsm['securityToken'].toString(),
    );
    sendData(
      androidId: gsm['androidId'].toString(),
      securityToken: gsm['securityToken'].toString(),
    );
    final box = hiveStorage.getBox;
    box.put('keys', jsonEncode(credentials['keys']));
    box.put('androidId', credentials['androidId'].toString());
    box.put('securityToken', credentials['securityToken'].toString());
    box.put('fcmToken', credentials['fcm']['token'].toString());
    box.put('firebase-installations-auth', firebaseInstallationAuthToken);
    return credentials['fcm']['token'];
  }

  Future<String?> getToken() async {
    String? fcmToken = hiveStorage.getBox.get('fcmToken');
    if (fcmToken == null || fcmToken.isEmpty || fcmToken == 'null') {
      await register();
      fcmToken = hiveStorage.getBox.get('fcmToken');
      if (onTokenRefresh != null && fcmToken != null) {
        onTokenRefresh!(fcmToken);
      }
    }
    // fcmToken = hiveStorage.getBox.get('fcmToken');
    // if (onTokenRefresh != null && fcmToken != null) {
    //   onTokenRefresh!(fcmToken);
    // }
    return fcmToken;
  }

  Uint8List encodeDelimited(Uint8List payload) {
    var length = payload.length;
    final size = _getVarintSize(length);
    final result = Uint8List(size + length);

    // Write the varint-encoded length to the beginning of the output buffer.
    var offset = 0;
    while (length >= 0x80) {
      result[offset++] = (length & 0x7f) | 0x80;
      length >>= 7;
    }
    result[offset++] = length & 0x7f;

    // Copy the payload to the output buffer.
    result.setRange(offset, size + length, payload);
    return result;
  }

  int _getVarintSize(int value) {
    var size = 0;
    while (value >= 0x80) {
      size++;
      value >>= 7;
    }
    return size + 1;
  }

  Future<void> sendData({dynamic securityToken, dynamic androidId}) async {
    // Guard against overlapping connects: a socket error and a liveness
    // timeout can both fire close together.
    if (_connectInFlight) return;
    _connectInFlight = true;

    SecureSocket? socket;
    try {
      reactiveConnection.status = ConnectionStatus.connecting;
      socket =
          await SecureSocket.connect(mcsHost, mcsPort).timeout(_connectTimeout);
    } catch (e) {
      debugPrint('[mcs] connect failed: $e');
      socket = null;
    } finally {
      _connectInFlight = false;
    }

    if (socket == null) {
      _scheduleReconnect(securityToken, androidId, 'connect failed');
      return;
    }

    // Replace any previous connection before adopting this one.
    _disposeConnection();
    _activeSocket = socket;

    // Refill the retry budget once this connection proves itself healthy.
    _healthyTimer?.cancel();
    _healthyTimer = Timer(_healthyConnectionThreshold, () {
      if (identical(_activeSocket, socket)) {
        _reconnectAttempts = 0;
      }
    });

    _activeParser = Parser(
      socket,
      onDone: () {
        _disposeConnection();
        if (reconnectAuto) {
          _scheduleReconnect(securityToken, androidId, 'socket closed');
        } else {
          reactiveConnection.status = ConnectionStatus.disconnected;
        }
      },
      onMessage: onNotificationMessage,
    );
    loginWithId(socket, androidId, securityToken);
    reactiveConnection.status = ConnectionStatus.connected;
  }

  /// Schedules a reconnection attempt, honouring [maxReconnectAttempts].
  ///
  /// Uses exponential backoff so a server that is briefly unavailable is not
  /// hammered, and gives up (rather than looping forever) once the budget is
  /// exhausted.
  void _scheduleReconnect(
      dynamic securityToken, dynamic androidId, String reason) {
    if (!reconnectAuto) {
      reactiveConnection.status = ConnectionStatus.disconnected;
      return;
    }
    if (_reconnectTimer?.isActive ?? false) {
      // A reconnect is already pending; do not stack another one.
      return;
    }
    if (_reconnectAttempts >= maxReconnectAttempts) {
      debugPrint(
          '[mcs] giving up after $maxReconnectAttempts attempts ($reason). '
          'Call sendData() again to retry manually.');
      reactiveConnection.status = ConnectionStatus.disconnected;
      return;
    }

    _reconnectAttempts++;
    final delay = _backoffDelay(_reconnectAttempts);
    debugPrint(
        '[mcs] reconnect attempt $_reconnectAttempts/$maxReconnectAttempts '
        'in ${delay.inSeconds}s ($reason)');

    _reconnectTimer = Timer(delay, () {
      _reconnectTimer = null;
      sendData(securityToken: securityToken, androidId: androidId);
    });
  }

  /// Exponential backoff: 2s, 4s, 8s ... capped at [_reconnectMaxDelay].
  Duration _backoffDelay(int attempt) {
    final millis = _reconnectBaseDelay.inMilliseconds * (1 << (attempt - 1));
    return Duration(
      milliseconds: millis.clamp(0, _reconnectMaxDelay.inMilliseconds),
    );
  }

  /// Tears down the current socket/parser without notifying the owner.
  ///
  /// The parser's `onDone` fires from here, so it is detached first to avoid
  /// triggering another reconnect while we are already handling one.
  void _disposeConnection() {
    _healthyTimer?.cancel();
    _healthyTimer = null;
    final parser = _activeParser;
    final socket = _activeSocket;
    _activeParser = null;
    _activeSocket = null;
    if (parser != null) {
      parser.onDone = null;
      parser.destroy();
    }
    socket?.destroy();
  }

  void loginWithId(dynamic socket, dynamic androidId, dynamic securityToken) {
    var androidId2 = "android-${BigInt.parse(androidId).toRadixString(16)}";
    LoginRequest loginRequest = LoginRequest()
      ..adaptiveHeartbeat = false
      ..authService = LoginRequest_AuthService.ANDROID_ID
      ..authToken = securityToken
      ..id = "chrome-63.0.3234.0"
      ..domain = "mcs.android.com"
      ..deviceId = androidId2
      ..networkType = 1
      ..resource = androidId
      ..user = androidId
      ..useRmq2 = true;
    loginRequest.setting.addAll([Setting(name: "new_vc", value: "1")]);
    loginRequest.clientEvent.addAll([]);
    List<String> preIds = [];
    if (hiveStorage.getBox.get('last_persistentId') != null) {
      try {
        preIds.addAll(List<String>.from(jsonDecode(
            hiveStorage.getBox.get('last_persistentId').toString())));
      } catch (e) {
        preIds.addAll([hiveStorage.getBox.get('last_persistentId').toString()]);
      }
    }
    if (preIds.isNotEmpty) {
      loginRequest.receivedPersistentId.addAll(preIds);
    } else {
      loginRequest.receivedPersistentId.addAll([]);
    }
    var delimitedBuffer = loginRequest.writeToBuffer();
    final packet = Uint8List.fromList([
      ...[MCSConstants.kMCSVersion, MCSProtoTag.kLoginRequestTag],
      ...divideBy128(delimitedBuffer.length),
      ...delimitedBuffer,
    ]);
    socket.add(packet);
    hiveStorage.getBox.delete('last_persistentId');
  }

  List<int> divideBy128(int number) {
    if (number <= 255) {
      return [number, 1];
    }
    int quotient = number ~/ 128;
    int remainder = number % 128;
    if (remainder < 128) {
      remainder = remainder + 128;
      quotient = quotient;
    }
    return [remainder, quotient];
  }

  //credentials['fcm']['pushSet']
  Future<void> deleteToken() async {
    var headers = {
      'authority': 'fcmregistrations.googleapis.com',
      'accept': 'application/json',
      'accept-language': 'en-US,en;q=0.9',
      'content-type': 'application/json',
      'dnt': '1',
      'origin': 'http://127.0.0.1:5501',
      'referer': 'http://127.0.0.1:5501/',
      'sec-ch-ua':
          '"Not/A)Brand";v="99", "Microsoft Edge";v="115", "Chromium";v="115"',
      'sec-ch-ua-mobile': '?1',
      'sec-ch-ua-platform': '"Android"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'cross-site',
      'user-agent':
          'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Mobile Safari/537.36 Edg/115.0.1901.183',
      'x-goog-api-key': webApiKey,
      'x-goog-firebase-installations-auth':
          'FIS ${hiveStorage.box.get('firebase-installations-auth')}'
    };
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'https://fcmregistrations.googleapis.com/v1/projects/$projectId/registrations/${hiveStorage.box.get('fcmToken')}'));
    request.bodyFields = {};
    request.headers.addAll(headers);
    await request.send();
    hiveStorage.box.delete('fcmToken');
    // if (response.statusCode == 200 || response.statusCode == 404) {
    //   hiveStorage.box.delete('fcmToken');
    // }
  }

  Future<dynamic> registerGCM(String appId) async {
    var options = await checkIn();
    var credentials = await doRegister(
        androidId: options.androidId,
        securityToken: options.securityToken,
        appId: appId);
    return credentials;
  }

  Future<GservicesSetting> loadProtoFile() async {
    if (root != null) {
      return root!;
    }
    var descriptor = GservicesSetting();
    root = descriptor;
    return descriptor;
  }

  Future<AndroidCheckinResponse> checkIn(
      {dynamic androidId, dynamic securityToken}) async {
    await loadProtoFile();
    var buffer = getCheckinRequest(androidId, securityToken);
    final response = await http.post(Uri.parse(checkinUrl),
        headers: {'Content-Type': 'application/x-protobuf'}, body: buffer);
    final message = AndroidCheckinResponse.fromBuffer(response.bodyBytes);
    return message;
  }

  Uint8List getCheckinRequest(String? androidId, String? securityToken) {
    final AndroidCheckinRequest androidCheckinRequest = AndroidCheckinRequest()
      ..userSerialNumber = 0
      ..checkin = (AndroidCheckinProto()
        ..type = DeviceType.DEVICE_CHROME_BROWSER
        ..chromeBuild = (ChromeBuildProto()
          ..platform = ChromeBuildProto_Platform.PLATFORM_MAC
          ..chromeVersion = '63.0.3234.0'
          ..channel = ChromeBuildProto_Channel.CHANNEL_STABLE))
      ..version = 3;

    if (androidId != null) {
      androidCheckinRequest.id = Int64.parseInt(androidId);
    }

    if (securityToken != null) {
      androidCheckinRequest.securityToken = Int64(int.parse(securityToken));
    }

    return androidCheckinRequest.writeToBuffer();
  }

  Future<Map<String, dynamic>> doRegister(
      {required Int64 androidId,
      required Int64 securityToken,
      required String appId}) async {
    final body = {
      'app': 'org.chromium.linux',
      'X-subtype': appId,
      'device': androidId.toString(),
      'sender': serverKey.toString(),
    };
    final response = await postRegister(
        androidId: androidId, securityToken: securityToken, body: body);
    final token = response.split('=')[1];
    return {
      'token': token,
      'androidId': androidId,
      'securityToken': securityToken,
      'appId': appId,
    };
  }

  Future<String> postRegister(
      {required Int64 androidId,
      required Int64 securityToken,
      required body,
      int retry = 0}) async {
    final response = await http.post(Uri.parse(registerUrl),
        headers: {
          'Authorization':
              'AidLogin ${androidId.toString()}:${securityToken.toString()}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body);
    if (response.body.contains('Error')) {
      if (retry >= 5) {
        throw Exception('GCM register has failed');
      }
      await Future.delayed(const Duration(milliseconds: 1000));
      return await postRegister(
          androidId: androidId,
          securityToken: securityToken,
          body: body,
          retry: retry + 1);
    }
    return response.body;
  }

  Future<dynamic> onNotificationMessage(Map<String, dynamic> data) async {
    reactiveConnection.status = ConnectionStatus.connected;
    Map<String, String> keys =
        Map<String, String>.from(jsonDecode(hiveStorage.getBox.get('keys')));
    Object? data2 = {};
    if (data['object'] is DataMessageStanza) {
      data2 = (data['object'] as DataMessageStanza).toProto3Json();
      (data2 as Map)['rawData'] = (data['object'] as DataMessageStanza).rawData;
      List<String> preIds = [];
      if (hiveStorage.getBox.get('last_persistentId') != null) {
        preIds.addAll(List<String>.from(jsonDecode(
            hiveStorage.getBox.get('last_persistentId').toString())));
      }
      preIds.add((data['object'] as DataMessageStanza).persistentId.toString());
      await hiveStorage.getBox.put('last_persistentId', jsonEncode(preIds));
    } else {
      return;
    }
    String dataNeedToSend = json.encode({
      "object": data2,
      "keys": keys,
    });
    // debugPrint("data $dataNeedToSend");

    String? message;

    // Pure-Dart ECE decoder: in-process, every platform, no native binary.
    try {
      message = ece.decryptMessage(dataNeedToSend);
    } catch (e) {
      // Fail loudly instead of silently dropping the notification.
      debugPrint('[decrypt] pure-Dart decoder threw: $e');
      return;
    }
    if (message.isEmpty) {
      debugPrint('[decrypt] FAILED — decoder produced no output.');
      return;
    }
    debugPrint('[decrypt] decrypted via dart (ece_aesgcm)');
    if (onNewMessage != null) {
      onNewMessage!(message);
      // await socket.close();
      // await sendData(securityToken: securityToken,androidId: androidId);
    }
  }
}
