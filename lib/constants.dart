class ProcessingState {
  static const int MCS_VERSION_TAG_AND_SIZE = 0;
  static const int MCS_TAG_AND_SIZE = 1;
  static const int MCS_SIZE = 2;
  static const int MCS_PROTO_BYTES = 3;
}

class MCSProtoTag {
  static const int kHeartbeatPingTag = 0;
  static const int kHeartbeatAckTag = 1;
  static const int kLoginRequestTag = 2;
  static const int kLoginResponseTag = 3;
  static const int kCloseTag = 4;
  static const int kMessageStanzaTag = 5;
  static const int kPresenceStanzaTag = 6;
  static const int kIqStanzaTag = 7;
  static const int kDataMessageStanzaTag = 8;
  static const int kBatchPresenceStanzaTag = 9;
  static const int kStreamErrorStanzaTag = 10;
  static const int kHttpRequestTag = 11;
  static const int kHttpResponseTag = 12;
  static const int kBindAccountRequestTag = 13;
  static const int kBindAccountResponseTag = 14;
  static const int kTalkMetadataTag = 15;
  static const int kNumProtoTypes = 16;
}

class MCSConstants {
  static const int kVersionPacketLen = 1;
  static const int kTagPacketLen = 1;
  static const int kSizePacketLenMin = 1;
  static const int kSizePacketLenMax = 5;
  static const int kMCSVersion = 41;
}
