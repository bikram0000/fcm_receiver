///
//  Generated code. Do not modify.
//  source: assets/proto/mcs.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use heartbeatPingDescriptor instead')
const HeartbeatPing$json = const {
  '1': 'HeartbeatPing',
  '2': const [
    const {'1': 'stream_id', '3': 1, '4': 1, '5': 5, '10': 'streamId'},
    const {'1': 'last_stream_id_received', '3': 2, '4': 1, '5': 5, '10': 'lastStreamIdReceived'},
    const {'1': 'status', '3': 3, '4': 1, '5': 3, '10': 'status'},
  ],
};

/// Descriptor for `HeartbeatPing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatPingDescriptor = $convert.base64Decode('Cg1IZWFydGJlYXRQaW5nEhsKCXN0cmVhbV9pZBgBIAEoBVIIc3RyZWFtSWQSNQoXbGFzdF9zdHJlYW1faWRfcmVjZWl2ZWQYAiABKAVSFGxhc3RTdHJlYW1JZFJlY2VpdmVkEhYKBnN0YXR1cxgDIAEoA1IGc3RhdHVz');
@$core.Deprecated('Use heartbeatAckDescriptor instead')
const HeartbeatAck$json = const {
  '1': 'HeartbeatAck',
  '2': const [
    const {'1': 'stream_id', '3': 1, '4': 1, '5': 5, '10': 'streamId'},
    const {'1': 'last_stream_id_received', '3': 2, '4': 1, '5': 5, '10': 'lastStreamIdReceived'},
    const {'1': 'status', '3': 3, '4': 1, '5': 3, '10': 'status'},
  ],
};

/// Descriptor for `HeartbeatAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatAckDescriptor = $convert.base64Decode('CgxIZWFydGJlYXRBY2sSGwoJc3RyZWFtX2lkGAEgASgFUghzdHJlYW1JZBI1ChdsYXN0X3N0cmVhbV9pZF9yZWNlaXZlZBgCIAEoBVIUbGFzdFN0cmVhbUlkUmVjZWl2ZWQSFgoGc3RhdHVzGAMgASgDUgZzdGF0dXM=');
@$core.Deprecated('Use errorInfoDescriptor instead')
const ErrorInfo$json = const {
  '1': 'ErrorInfo',
  '2': const [
    const {'1': 'code', '3': 1, '4': 2, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'extension', '3': 4, '4': 1, '5': 11, '6': '.mcs_proto.Extension', '10': 'extension'},
  ],
};

/// Descriptor for `ErrorInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorInfoDescriptor = $convert.base64Decode('CglFcnJvckluZm8SEgoEY29kZRgBIAIoBVIEY29kZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEhIKBHR5cGUYAyABKAlSBHR5cGUSMgoJZXh0ZW5zaW9uGAQgASgLMhQubWNzX3Byb3RvLkV4dGVuc2lvblIJZXh0ZW5zaW9u');
@$core.Deprecated('Use settingDescriptor instead')
const Setting$json = const {
  '1': 'Setting',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 2, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Setting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingDescriptor = $convert.base64Decode('CgdTZXR0aW5nEhIKBG5hbWUYASACKAlSBG5hbWUSFAoFdmFsdWUYAiACKAlSBXZhbHVl');
@$core.Deprecated('Use heartbeatStatDescriptor instead')
const HeartbeatStat$json = const {
  '1': 'HeartbeatStat',
  '2': const [
    const {'1': 'ip', '3': 1, '4': 2, '5': 9, '10': 'ip'},
    const {'1': 'timeout', '3': 2, '4': 2, '5': 8, '10': 'timeout'},
    const {'1': 'interval_ms', '3': 3, '4': 2, '5': 5, '10': 'intervalMs'},
  ],
};

/// Descriptor for `HeartbeatStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatStatDescriptor = $convert.base64Decode('Cg1IZWFydGJlYXRTdGF0Eg4KAmlwGAEgAigJUgJpcBIYCgd0aW1lb3V0GAIgAigIUgd0aW1lb3V0Eh8KC2ludGVydmFsX21zGAMgAigFUgppbnRlcnZhbE1z');
@$core.Deprecated('Use heartbeatConfigDescriptor instead')
const HeartbeatConfig$json = const {
  '1': 'HeartbeatConfig',
  '2': const [
    const {'1': 'upload_stat', '3': 1, '4': 1, '5': 8, '10': 'uploadStat'},
    const {'1': 'ip', '3': 2, '4': 1, '5': 9, '10': 'ip'},
    const {'1': 'interval_ms', '3': 3, '4': 1, '5': 5, '10': 'intervalMs'},
  ],
};

/// Descriptor for `HeartbeatConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatConfigDescriptor = $convert.base64Decode('Cg9IZWFydGJlYXRDb25maWcSHwoLdXBsb2FkX3N0YXQYASABKAhSCnVwbG9hZFN0YXQSDgoCaXAYAiABKAlSAmlwEh8KC2ludGVydmFsX21zGAMgASgFUgppbnRlcnZhbE1z');
@$core.Deprecated('Use clientEventDescriptor instead')
const ClientEvent$json = const {
  '1': 'ClientEvent',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.mcs_proto.ClientEvent.Type', '10': 'type'},
    const {'1': 'number_discarded_events', '3': 100, '4': 1, '5': 13, '10': 'numberDiscardedEvents'},
    const {'1': 'network_type', '3': 200, '4': 1, '5': 5, '10': 'networkType'},
    const {'1': 'time_connection_started_ms', '3': 202, '4': 1, '5': 4, '10': 'timeConnectionStartedMs'},
    const {'1': 'time_connection_ended_ms', '3': 203, '4': 1, '5': 4, '10': 'timeConnectionEndedMs'},
    const {'1': 'error_code', '3': 204, '4': 1, '5': 5, '10': 'errorCode'},
    const {'1': 'time_connection_established_ms', '3': 300, '4': 1, '5': 4, '10': 'timeConnectionEstablishedMs'},
  ],
  '4': const [ClientEvent_Type$json],
  '9': const [
    const {'1': 201, '2': 202},
  ],
};

@$core.Deprecated('Use clientEventDescriptor instead')
const ClientEvent_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'DISCARDED_EVENTS', '2': 1},
    const {'1': 'FAILED_CONNECTION', '2': 2},
    const {'1': 'SUCCESSFUL_CONNECTION', '2': 3},
  ],
};

/// Descriptor for `ClientEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientEventDescriptor = $convert.base64Decode('CgtDbGllbnRFdmVudBIvCgR0eXBlGAEgASgOMhsubWNzX3Byb3RvLkNsaWVudEV2ZW50LlR5cGVSBHR5cGUSNgoXbnVtYmVyX2Rpc2NhcmRlZF9ldmVudHMYZCABKA1SFW51bWJlckRpc2NhcmRlZEV2ZW50cxIiCgxuZXR3b3JrX3R5cGUYyAEgASgFUgtuZXR3b3JrVHlwZRI8Chp0aW1lX2Nvbm5lY3Rpb25fc3RhcnRlZF9tcxjKASABKARSF3RpbWVDb25uZWN0aW9uU3RhcnRlZE1zEjgKGHRpbWVfY29ubmVjdGlvbl9lbmRlZF9tcxjLASABKARSFXRpbWVDb25uZWN0aW9uRW5kZWRNcxIeCgplcnJvcl9jb2RlGMwBIAEoBVIJZXJyb3JDb2RlEkQKHnRpbWVfY29ubmVjdGlvbl9lc3RhYmxpc2hlZF9tcxisAiABKARSG3RpbWVDb25uZWN0aW9uRXN0YWJsaXNoZWRNcyJbCgRUeXBlEgsKB1VOS05PV04QABIUChBESVNDQVJERURfRVZFTlRTEAESFQoRRkFJTEVEX0NPTk5FQ1RJT04QAhIZChVTVUNDRVNTRlVMX0NPTk5FQ1RJT04QA0oGCMkBEMoB');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 2, '5': 9, '10': 'id'},
    const {'1': 'domain', '3': 2, '4': 2, '5': 9, '10': 'domain'},
    const {'1': 'user', '3': 3, '4': 2, '5': 9, '10': 'user'},
    const {'1': 'resource', '3': 4, '4': 2, '5': 9, '10': 'resource'},
    const {'1': 'auth_token', '3': 5, '4': 2, '5': 9, '10': 'authToken'},
    const {'1': 'device_id', '3': 6, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'last_rmq_id', '3': 7, '4': 1, '5': 3, '10': 'lastRmqId'},
    const {'1': 'setting', '3': 8, '4': 3, '5': 11, '6': '.mcs_proto.Setting', '10': 'setting'},
    const {'1': 'received_persistent_id', '3': 10, '4': 3, '5': 9, '10': 'receivedPersistentId'},
    const {'1': 'adaptive_heartbeat', '3': 12, '4': 1, '5': 8, '10': 'adaptiveHeartbeat'},
    const {'1': 'heartbeat_stat', '3': 13, '4': 1, '5': 11, '6': '.mcs_proto.HeartbeatStat', '10': 'heartbeatStat'},
    const {'1': 'use_rmq2', '3': 14, '4': 1, '5': 8, '10': 'useRmq2'},
    const {'1': 'account_id', '3': 15, '4': 1, '5': 3, '10': 'accountId'},
    const {'1': 'auth_service', '3': 16, '4': 1, '5': 14, '6': '.mcs_proto.LoginRequest.AuthService', '10': 'authService'},
    const {'1': 'network_type', '3': 17, '4': 1, '5': 5, '10': 'networkType'},
    const {'1': 'status', '3': 18, '4': 1, '5': 3, '10': 'status'},
    const {'1': 'client_event', '3': 22, '4': 3, '5': 11, '6': '.mcs_proto.ClientEvent', '10': 'clientEvent'},
  ],
  '4': const [LoginRequest_AuthService$json],
  '9': const [
    const {'1': 19, '2': 20},
    const {'1': 20, '2': 21},
    const {'1': 21, '2': 22},
  ],
};

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest_AuthService$json = const {
  '1': 'AuthService',
  '2': const [
    const {'1': 'ANDROID_ID', '2': 2},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSDgoCaWQYASACKAlSAmlkEhYKBmRvbWFpbhgCIAIoCVIGZG9tYWluEhIKBHVzZXIYAyACKAlSBHVzZXISGgoIcmVzb3VyY2UYBCACKAlSCHJlc291cmNlEh0KCmF1dGhfdG9rZW4YBSACKAlSCWF1dGhUb2tlbhIbCglkZXZpY2VfaWQYBiABKAlSCGRldmljZUlkEh4KC2xhc3Rfcm1xX2lkGAcgASgDUglsYXN0Um1xSWQSLAoHc2V0dGluZxgIIAMoCzISLm1jc19wcm90by5TZXR0aW5nUgdzZXR0aW5nEjQKFnJlY2VpdmVkX3BlcnNpc3RlbnRfaWQYCiADKAlSFHJlY2VpdmVkUGVyc2lzdGVudElkEi0KEmFkYXB0aXZlX2hlYXJ0YmVhdBgMIAEoCFIRYWRhcHRpdmVIZWFydGJlYXQSPwoOaGVhcnRiZWF0X3N0YXQYDSABKAsyGC5tY3NfcHJvdG8uSGVhcnRiZWF0U3RhdFINaGVhcnRiZWF0U3RhdBIZCgh1c2Vfcm1xMhgOIAEoCFIHdXNlUm1xMhIdCgphY2NvdW50X2lkGA8gASgDUglhY2NvdW50SWQSRgoMYXV0aF9zZXJ2aWNlGBAgASgOMiMubWNzX3Byb3RvLkxvZ2luUmVxdWVzdC5BdXRoU2VydmljZVILYXV0aFNlcnZpY2USIQoMbmV0d29ya190eXBlGBEgASgFUgtuZXR3b3JrVHlwZRIWCgZzdGF0dXMYEiABKANSBnN0YXR1cxI5CgxjbGllbnRfZXZlbnQYFiADKAsyFi5tY3NfcHJvdG8uQ2xpZW50RXZlbnRSC2NsaWVudEV2ZW50Ih0KC0F1dGhTZXJ2aWNlEg4KCkFORFJPSURfSUQQAkoECBMQFEoECBQQFUoECBUQFg==');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 2, '5': 9, '10': 'id'},
    const {'1': 'jid', '3': 2, '4': 1, '5': 9, '10': 'jid'},
    const {'1': 'error', '3': 3, '4': 1, '5': 11, '6': '.mcs_proto.ErrorInfo', '10': 'error'},
    const {'1': 'setting', '3': 4, '4': 3, '5': 11, '6': '.mcs_proto.Setting', '10': 'setting'},
    const {'1': 'stream_id', '3': 5, '4': 1, '5': 5, '10': 'streamId'},
    const {'1': 'last_stream_id_received', '3': 6, '4': 1, '5': 5, '10': 'lastStreamIdReceived'},
    const {'1': 'heartbeat_config', '3': 7, '4': 1, '5': 11, '6': '.mcs_proto.HeartbeatConfig', '10': 'heartbeatConfig'},
    const {'1': 'server_timestamp', '3': 8, '4': 1, '5': 3, '10': 'serverTimestamp'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEg4KAmlkGAEgAigJUgJpZBIQCgNqaWQYAiABKAlSA2ppZBIqCgVlcnJvchgDIAEoCzIULm1jc19wcm90by5FcnJvckluZm9SBWVycm9yEiwKB3NldHRpbmcYBCADKAsyEi5tY3NfcHJvdG8uU2V0dGluZ1IHc2V0dGluZxIbCglzdHJlYW1faWQYBSABKAVSCHN0cmVhbUlkEjUKF2xhc3Rfc3RyZWFtX2lkX3JlY2VpdmVkGAYgASgFUhRsYXN0U3RyZWFtSWRSZWNlaXZlZBJFChBoZWFydGJlYXRfY29uZmlnGAcgASgLMhoubWNzX3Byb3RvLkhlYXJ0YmVhdENvbmZpZ1IPaGVhcnRiZWF0Q29uZmlnEikKEHNlcnZlcl90aW1lc3RhbXAYCCABKANSD3NlcnZlclRpbWVzdGFtcA==');
@$core.Deprecated('Use streamErrorStanzaDescriptor instead')
const StreamErrorStanza$json = const {
  '1': 'StreamErrorStanza',
  '2': const [
    const {'1': 'type', '3': 1, '4': 2, '5': 9, '10': 'type'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `StreamErrorStanza`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamErrorStanzaDescriptor = $convert.base64Decode('ChFTdHJlYW1FcnJvclN0YW56YRISCgR0eXBlGAEgAigJUgR0eXBlEhIKBHRleHQYAiABKAlSBHRleHQ=');
@$core.Deprecated('Use closeDescriptor instead')
const Close$json = const {
  '1': 'Close',
};

/// Descriptor for `Close`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closeDescriptor = $convert.base64Decode('CgVDbG9zZQ==');
@$core.Deprecated('Use extensionDescriptor instead')
const Extension$json = const {
  '1': 'Extension',
  '2': const [
    const {'1': 'id', '3': 1, '4': 2, '5': 5, '10': 'id'},
    const {'1': 'data', '3': 2, '4': 2, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `Extension`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionDescriptor = $convert.base64Decode('CglFeHRlbnNpb24SDgoCaWQYASACKAVSAmlkEhIKBGRhdGEYAiACKAxSBGRhdGE=');
@$core.Deprecated('Use iqStanzaDescriptor instead')
const IqStanza$json = const {
  '1': 'IqStanza',
  '2': const [
    const {'1': 'rmq_id', '3': 1, '4': 1, '5': 3, '10': 'rmqId'},
    const {'1': 'type', '3': 2, '4': 2, '5': 14, '6': '.mcs_proto.IqStanza.IqType', '10': 'type'},
    const {'1': 'id', '3': 3, '4': 2, '5': 9, '10': 'id'},
    const {'1': 'from', '3': 4, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 5, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'error', '3': 6, '4': 1, '5': 11, '6': '.mcs_proto.ErrorInfo', '10': 'error'},
    const {'1': 'extension', '3': 7, '4': 1, '5': 11, '6': '.mcs_proto.Extension', '10': 'extension'},
    const {'1': 'persistent_id', '3': 8, '4': 1, '5': 9, '10': 'persistentId'},
    const {'1': 'stream_id', '3': 9, '4': 1, '5': 5, '10': 'streamId'},
    const {'1': 'last_stream_id_received', '3': 10, '4': 1, '5': 5, '10': 'lastStreamIdReceived'},
    const {'1': 'account_id', '3': 11, '4': 1, '5': 3, '10': 'accountId'},
    const {'1': 'status', '3': 12, '4': 1, '5': 3, '10': 'status'},
  ],
  '4': const [IqStanza_IqType$json],
};

@$core.Deprecated('Use iqStanzaDescriptor instead')
const IqStanza_IqType$json = const {
  '1': 'IqType',
  '2': const [
    const {'1': 'GET', '2': 0},
    const {'1': 'SET', '2': 1},
    const {'1': 'RESULT', '2': 2},
    const {'1': 'IQ_ERROR', '2': 3},
  ],
};

/// Descriptor for `IqStanza`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iqStanzaDescriptor = $convert.base64Decode('CghJcVN0YW56YRIVCgZybXFfaWQYASABKANSBXJtcUlkEi4KBHR5cGUYAiACKA4yGi5tY3NfcHJvdG8uSXFTdGFuemEuSXFUeXBlUgR0eXBlEg4KAmlkGAMgAigJUgJpZBISCgRmcm9tGAQgASgJUgRmcm9tEg4KAnRvGAUgASgJUgJ0bxIqCgVlcnJvchgGIAEoCzIULm1jc19wcm90by5FcnJvckluZm9SBWVycm9yEjIKCWV4dGVuc2lvbhgHIAEoCzIULm1jc19wcm90by5FeHRlbnNpb25SCWV4dGVuc2lvbhIjCg1wZXJzaXN0ZW50X2lkGAggASgJUgxwZXJzaXN0ZW50SWQSGwoJc3RyZWFtX2lkGAkgASgFUghzdHJlYW1JZBI1ChdsYXN0X3N0cmVhbV9pZF9yZWNlaXZlZBgKIAEoBVIUbGFzdFN0cmVhbUlkUmVjZWl2ZWQSHQoKYWNjb3VudF9pZBgLIAEoA1IJYWNjb3VudElkEhYKBnN0YXR1cxgMIAEoA1IGc3RhdHVzIjQKBklxVHlwZRIHCgNHRVQQABIHCgNTRVQQARIKCgZSRVNVTFQQAhIMCghJUV9FUlJPUhAD');
@$core.Deprecated('Use appDataDescriptor instead')
const AppData$json = const {
  '1': 'AppData',
  '2': const [
    const {'1': 'key', '3': 1, '4': 2, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 2, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `AppData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appDataDescriptor = $convert.base64Decode('CgdBcHBEYXRhEhAKA2tleRgBIAIoCVIDa2V5EhQKBXZhbHVlGAIgAigJUgV2YWx1ZQ==');
@$core.Deprecated('Use dataMessageStanzaDescriptor instead')
const DataMessageStanza$json = const {
  '1': 'DataMessageStanza',
  '2': const [
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'from', '3': 3, '4': 2, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 4, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'category', '3': 5, '4': 2, '5': 9, '10': 'category'},
    const {'1': 'token', '3': 6, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'app_data', '3': 7, '4': 3, '5': 11, '6': '.mcs_proto.AppData', '10': 'appData'},
    const {'1': 'from_trusted_server', '3': 8, '4': 1, '5': 8, '10': 'fromTrustedServer'},
    const {'1': 'persistent_id', '3': 9, '4': 1, '5': 9, '10': 'persistentId'},
    const {'1': 'stream_id', '3': 10, '4': 1, '5': 5, '10': 'streamId'},
    const {'1': 'last_stream_id_received', '3': 11, '4': 1, '5': 5, '10': 'lastStreamIdReceived'},
    const {'1': 'reg_id', '3': 13, '4': 1, '5': 9, '10': 'regId'},
    const {'1': 'device_user_id', '3': 16, '4': 1, '5': 3, '10': 'deviceUserId'},
    const {'1': 'ttl', '3': 17, '4': 1, '5': 5, '10': 'ttl'},
    const {'1': 'sent', '3': 18, '4': 1, '5': 3, '10': 'sent'},
    const {'1': 'queued', '3': 19, '4': 1, '5': 5, '10': 'queued'},
    const {'1': 'status', '3': 20, '4': 1, '5': 3, '10': 'status'},
    const {'1': 'raw_data', '3': 21, '4': 1, '5': 12, '10': 'rawData'},
    const {'1': 'immediate_ack', '3': 24, '4': 1, '5': 8, '10': 'immediateAck'},
  ],
};

/// Descriptor for `DataMessageStanza`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataMessageStanzaDescriptor = $convert.base64Decode('ChFEYXRhTWVzc2FnZVN0YW56YRIOCgJpZBgCIAEoCVICaWQSEgoEZnJvbRgDIAIoCVIEZnJvbRIOCgJ0bxgEIAEoCVICdG8SGgoIY2F0ZWdvcnkYBSACKAlSCGNhdGVnb3J5EhQKBXRva2VuGAYgASgJUgV0b2tlbhItCghhcHBfZGF0YRgHIAMoCzISLm1jc19wcm90by5BcHBEYXRhUgdhcHBEYXRhEi4KE2Zyb21fdHJ1c3RlZF9zZXJ2ZXIYCCABKAhSEWZyb21UcnVzdGVkU2VydmVyEiMKDXBlcnNpc3RlbnRfaWQYCSABKAlSDHBlcnNpc3RlbnRJZBIbCglzdHJlYW1faWQYCiABKAVSCHN0cmVhbUlkEjUKF2xhc3Rfc3RyZWFtX2lkX3JlY2VpdmVkGAsgASgFUhRsYXN0U3RyZWFtSWRSZWNlaXZlZBIVCgZyZWdfaWQYDSABKAlSBXJlZ0lkEiQKDmRldmljZV91c2VyX2lkGBAgASgDUgxkZXZpY2VVc2VySWQSEAoDdHRsGBEgASgFUgN0dGwSEgoEc2VudBgSIAEoA1IEc2VudBIWCgZxdWV1ZWQYEyABKAVSBnF1ZXVlZBIWCgZzdGF0dXMYFCABKANSBnN0YXR1cxIZCghyYXdfZGF0YRgVIAEoDFIHcmF3RGF0YRIjCg1pbW1lZGlhdGVfYWNrGBggASgIUgxpbW1lZGlhdGVBY2s=');
@$core.Deprecated('Use streamAckDescriptor instead')
const StreamAck$json = const {
  '1': 'StreamAck',
};

/// Descriptor for `StreamAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamAckDescriptor = $convert.base64Decode('CglTdHJlYW1BY2s=');
@$core.Deprecated('Use selectiveAckDescriptor instead')
const SelectiveAck$json = const {
  '1': 'SelectiveAck',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `SelectiveAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectiveAckDescriptor = $convert.base64Decode('CgxTZWxlY3RpdmVBY2sSDgoCaWQYASADKAlSAmlk');
