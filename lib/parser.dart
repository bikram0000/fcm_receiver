import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';

import 'constants.dart';
import 'protos/mcs.pb.dart';


class Parser {
  late StreamSubscription _dataSubscription;
  ByteData _data = ByteData(0);
  int _state = ProcessingState.MCS_VERSION_TAG_AND_SIZE;
  int _sizePacketSoFar = 0;
  int _messageTag = 0;
  int _messageSize = 0;
  bool _handshakeComplete = false;
  bool _isWaitingForData = true;
  Function(Map<String, dynamic> data) onMessage;
  Function? onDone;

  /// Guards against [onDone] firing more than once for a single connection,
  /// which would otherwise start a reconnect storm.
  bool _doneNotified = false;

  Parser(
    Socket socket, {
    required this.onMessage,
    this.onDone,
  }) {
    _dataSubscription = socket.listen(
      _onData,
      onDone: _notifyDone,
      onError: _emitError,
      cancelOnError: true,
    );
  }

  void destroy() {
    _isWaitingForData = false;
    _dataSubscription.cancel();
    _notifyDone();
  }

  /// Notifies the owner exactly once that this connection is finished.
  ///
  /// Connection death is detected from real socket events — the stream
  /// completing or erroring — rather than from a period of silence. MCS is a
  /// mostly-idle protocol: the server sends nothing until a push arrives, so a
  /// silent socket is a healthy one. Treating silence as death tore down
  /// healthy connections every few minutes and needlessly reconnected.
  void _notifyDone() {
    if (_doneNotified) return;
    _doneNotified = true;
    if (onDone != null) onDone!();
  }

  void _emitError(dynamic error) {
    print("on Error socket  :: $error");
    destroy();
  }

  void _onData(Uint8List buffer) {
    Uint8List dataList = Uint8List.view(_data.buffer);
    dataList = Uint8List.fromList([...dataList, ...buffer]);
    _data = ByteData.view(dataList.buffer);
    if (_isWaitingForData) {
      _isWaitingForData = false;
      _waitForData();
    }
  }

  void _waitForData() {
    var minBytesNeeded = 0;

    switch (_state) {
      case ProcessingState.MCS_VERSION_TAG_AND_SIZE:
        minBytesNeeded = MCSConstants.kVersionPacketLen +
            MCSConstants.kTagPacketLen +
            MCSConstants.kSizePacketLenMin;
        break;
      case ProcessingState.MCS_TAG_AND_SIZE:
        minBytesNeeded =
            MCSConstants.kTagPacketLen + MCSConstants.kSizePacketLenMin;
        break;
      case ProcessingState.MCS_SIZE:
        minBytesNeeded = _sizePacketSoFar + 1;
        break;
      case ProcessingState.MCS_PROTO_BYTES:
        minBytesNeeded = _messageSize;
        break;
      default:
        _emitError('Unexpected state: $_state');
        return;
    }

    if (_data.lengthInBytes < minBytesNeeded) {
      //print('Socket read finished prematurely. Waiting for '
      //     '${minBytesNeeded - _data.lengthInBytes} more bytes');
      _isWaitingForData = true;
      return;
    }

    //print('Processing MCS data: state == $_state');

    switch (_state) {
      case ProcessingState.MCS_VERSION_TAG_AND_SIZE:
        _onGotVersion();
        break;
      case ProcessingState.MCS_TAG_AND_SIZE:
        _onGotMessageTag();
        break;
      case ProcessingState.MCS_SIZE:
        _onGotMessageSize();
        break;
      case ProcessingState.MCS_PROTO_BYTES:
        _onGotMessageBytes();
        break;
      default:
        _emitError('Unexpected state: $_state');
        return;
    }
  }

  void _onGotVersion() {
    int version = _data.getInt8(0);
    Uint8List dataList = _data.buffer.asUint8List();
    dataList = dataList.sublist(1);
    _data = ByteData.view(dataList.buffer);
    if (version < MCSConstants.kMCSVersion && version != 38) {
      _emitError(Exception('Got wrong version: $version'));
      return;
    }

    // Process the LoginResponse message tag.
    _onGotMessageTag();
  }

  void _onGotMessageTag() {
    _messageTag = _data.getInt8(0);
    Uint8List dataList = _data.buffer.asUint8List();
    dataList = dataList.sublist(1);
    _data = ByteData.view(dataList.buffer);
    //print('RECEIVED PROTO OF TYPE ${_data.lengthInBytes}');
    _onGotMessageSize();
  }

  void _onGotMessageSize() {
    bool incompleteSizePacket = false;
    Uint8List dataList = _data.buffer.asUint8List();
    CodedBufferReader reader = CodedBufferReader(dataList);
    //print("Proto 1 size: ${_messageSize}  ${dataList.lengthInBytes}");

    try {
      _messageSize = reader.readInt32();
    } catch (error) {
      if (error.toString().startsWith('RangeError')) {
        incompleteSizePacket = true;
      } else {
        _emitError(error);
        return;
      }
    }

    if (incompleteSizePacket) {
      _sizePacketSoFar = _data.buffer.lengthInBytes - _messageSize;
      _state = ProcessingState.MCS_SIZE;
      _waitForData();
      return;
    }
    Uint8List dataList2 = _data.buffer.asUint8List();
    dataList2 = dataList2.sublist(_data.buffer.lengthInBytes - _messageSize);
    _data = ByteData.view(dataList2.buffer);

    _sizePacketSoFar = 0;

    if (_messageSize > 0) {
      _state = ProcessingState.MCS_PROTO_BYTES;
      _waitForData();
    } else {
      _onGotMessageBytes();
    }
  }

  void _onGotMessageBytes() {
    // Messages with no content are valid; just use the default protobuf for that tag.
    if (_messageSize == 0) {
      onMessage({"tag": _messageTag, "object": {}});
      _getNextMessage();
      return;
    }

    if (_data.buffer.lengthInBytes < _messageSize) {
      // Continue reading data.
      _state = ProcessingState.MCS_PROTO_BYTES;
      _waitForData();
      return;
    }

    final buffer = _data.buffer.asUint8List(0, _messageSize);
    Uint8List dataList3 = _data.buffer.asUint8List();
    dataList3 = dataList3.sublist(_messageSize);
    _data = ByteData.view(dataList3.buffer);
    final protobuf = _buildProtobufFromTag(_messageTag, buffer);
    if (protobuf == null) {
      _emitError(Exception('Unknown tag'));
      return;
    }

    final object = protobuf;

    onMessage({
      "tag": _messageTag,
      "object": object,
    });
    // emit('message', {'tag': _messageTag, 'object': object});

    if (_messageTag == MCSProtoTag.kLoginResponseTag) {
      if (_handshakeComplete) {
        //print('Unexpected login response');
      } else {
        _handshakeComplete = true;
        //print('GCM Handshake complete.');
      }
    }

    _getNextMessage();
  }

  _getNextMessage() {
    _messageTag = 0;
    _messageSize = 0;
    _state = ProcessingState.MCS_TAG_AND_SIZE;
    _waitForData();
  }

  dynamic _buildProtobufFromTag(int tag, Uint8List buffer) {
    switch (tag) {
      case MCSProtoTag.kHeartbeatPingTag:
        return HeartbeatPing.fromBuffer(buffer);
      case MCSProtoTag.kHeartbeatAckTag:
        return HeartbeatAck.fromBuffer(buffer);
      case MCSProtoTag.kLoginRequestTag:
        return LoginRequest.fromBuffer(buffer);
      case MCSProtoTag.kLoginResponseTag:
        return LoginResponse.fromBuffer(buffer);
      case MCSProtoTag.kCloseTag:
        return Close.fromBuffer(buffer);
      case MCSProtoTag.kIqStanzaTag:
        return IqStanza.fromBuffer(buffer);
      case MCSProtoTag.kDataMessageStanzaTag:
        return DataMessageStanza.fromBuffer(buffer);
      case MCSProtoTag.kStreamErrorStanzaTag:
        return StreamErrorStanza.fromBuffer(buffer);
      default:
        return null;
    }
  }
}
