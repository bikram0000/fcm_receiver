///
//  Generated code. Do not modify.
//  source: assets/proto/mcs.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'mcs.pbenum.dart';

export 'mcs.pbenum.dart';

class HeartbeatPing extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeartbeatPing', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastStreamIdReceived', $pb.PbFieldType.O3)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  HeartbeatPing._() : super();
  factory HeartbeatPing({
    $core.int? streamId,
    $core.int? lastStreamIdReceived,
    $fixnum.Int64? status,
  }) {
    final _result = create();
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (lastStreamIdReceived != null) {
      _result.lastStreamIdReceived = lastStreamIdReceived;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory HeartbeatPing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatPing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatPing clone() => HeartbeatPing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatPing copyWith(void Function(HeartbeatPing) updates) => super.copyWith((message) => updates(message as HeartbeatPing)) as HeartbeatPing; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatPing create() => HeartbeatPing._();
  HeartbeatPing createEmptyInstance() => create();
  static $pb.PbList<HeartbeatPing> createRepeated() => $pb.PbList<HeartbeatPing>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatPing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatPing>(create);
  static HeartbeatPing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get streamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set streamId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get lastStreamIdReceived => $_getIZ(1);
  @$pb.TagNumber(2)
  set lastStreamIdReceived($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastStreamIdReceived() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastStreamIdReceived() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get status => $_getI64(2);
  @$pb.TagNumber(3)
  set status($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class HeartbeatAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeartbeatAck', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastStreamIdReceived', $pb.PbFieldType.O3)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  HeartbeatAck._() : super();
  factory HeartbeatAck({
    $core.int? streamId,
    $core.int? lastStreamIdReceived,
    $fixnum.Int64? status,
  }) {
    final _result = create();
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (lastStreamIdReceived != null) {
      _result.lastStreamIdReceived = lastStreamIdReceived;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory HeartbeatAck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatAck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatAck clone() => HeartbeatAck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatAck copyWith(void Function(HeartbeatAck) updates) => super.copyWith((message) => updates(message as HeartbeatAck)) as HeartbeatAck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatAck create() => HeartbeatAck._();
  HeartbeatAck createEmptyInstance() => create();
  static $pb.PbList<HeartbeatAck> createRepeated() => $pb.PbList<HeartbeatAck>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatAck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatAck>(create);
  static HeartbeatAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get streamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set streamId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get lastStreamIdReceived => $_getIZ(1);
  @$pb.TagNumber(2)
  set lastStreamIdReceived($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastStreamIdReceived() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastStreamIdReceived() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get status => $_getI64(2);
  @$pb.TagNumber(3)
  set status($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class ErrorInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ErrorInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.Q3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOM<Extension>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extension', subBuilder: Extension.create)
  ;

  ErrorInfo._() : super();
  factory ErrorInfo({
    $core.int? code,
    $core.String? message,
    $core.String? type,
    Extension? extension_4,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (type != null) {
      _result.type = type;
    }
    if (extension_4 != null) {
      _result.extension_4 = extension_4;
    }
    return _result;
  }
  factory ErrorInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ErrorInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ErrorInfo clone() => ErrorInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ErrorInfo copyWith(void Function(ErrorInfo) updates) => super.copyWith((message) => updates(message as ErrorInfo)) as ErrorInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorInfo create() => ErrorInfo._();
  ErrorInfo createEmptyInstance() => create();
  static $pb.PbList<ErrorInfo> createRepeated() => $pb.PbList<ErrorInfo>();
  @$core.pragma('dart2js:noInline')
  static ErrorInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorInfo>(create);
  static ErrorInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  Extension get extension_4 => $_getN(3);
  @$pb.TagNumber(4)
  set extension_4(Extension v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExtension_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtension_4() => clearField(4);
  @$pb.TagNumber(4)
  Extension ensureExtension_4() => $_ensure(3);
}

class Setting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Setting', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aQS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
  ;

  Setting._() : super();
  factory Setting({
    $core.String? name,
    $core.String? value,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Setting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Setting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Setting clone() => Setting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Setting copyWith(void Function(Setting) updates) => super.copyWith((message) => updates(message as Setting)) as Setting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Setting create() => Setting._();
  Setting createEmptyInstance() => create();
  static $pb.PbList<Setting> createRepeated() => $pb.PbList<Setting>();
  @$core.pragma('dart2js:noInline')
  static Setting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Setting>(create);
  static Setting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class HeartbeatStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeartbeatStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ip')
    ..a<$core.bool>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeout', $pb.PbFieldType.QB)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intervalMs', $pb.PbFieldType.Q3)
  ;

  HeartbeatStat._() : super();
  factory HeartbeatStat({
    $core.String? ip,
    $core.bool? timeout,
    $core.int? intervalMs,
  }) {
    final _result = create();
    if (ip != null) {
      _result.ip = ip;
    }
    if (timeout != null) {
      _result.timeout = timeout;
    }
    if (intervalMs != null) {
      _result.intervalMs = intervalMs;
    }
    return _result;
  }
  factory HeartbeatStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatStat clone() => HeartbeatStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatStat copyWith(void Function(HeartbeatStat) updates) => super.copyWith((message) => updates(message as HeartbeatStat)) as HeartbeatStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatStat create() => HeartbeatStat._();
  HeartbeatStat createEmptyInstance() => create();
  static $pb.PbList<HeartbeatStat> createRepeated() => $pb.PbList<HeartbeatStat>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatStat>(create);
  static HeartbeatStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ip => $_getSZ(0);
  @$pb.TagNumber(1)
  set ip($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIp() => $_has(0);
  @$pb.TagNumber(1)
  void clearIp() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get timeout => $_getBF(1);
  @$pb.TagNumber(2)
  set timeout($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeout() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get intervalMs => $_getIZ(2);
  @$pb.TagNumber(3)
  set intervalMs($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIntervalMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntervalMs() => clearField(3);
}

class HeartbeatConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeartbeatConfig', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadStat')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ip')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intervalMs', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  HeartbeatConfig._() : super();
  factory HeartbeatConfig({
    $core.bool? uploadStat,
    $core.String? ip,
    $core.int? intervalMs,
  }) {
    final _result = create();
    if (uploadStat != null) {
      _result.uploadStat = uploadStat;
    }
    if (ip != null) {
      _result.ip = ip;
    }
    if (intervalMs != null) {
      _result.intervalMs = intervalMs;
    }
    return _result;
  }
  factory HeartbeatConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatConfig clone() => HeartbeatConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatConfig copyWith(void Function(HeartbeatConfig) updates) => super.copyWith((message) => updates(message as HeartbeatConfig)) as HeartbeatConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartbeatConfig create() => HeartbeatConfig._();
  HeartbeatConfig createEmptyInstance() => create();
  static $pb.PbList<HeartbeatConfig> createRepeated() => $pb.PbList<HeartbeatConfig>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatConfig>(create);
  static HeartbeatConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get uploadStat => $_getBF(0);
  @$pb.TagNumber(1)
  set uploadStat($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUploadStat() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadStat() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ip => $_getSZ(1);
  @$pb.TagNumber(2)
  set ip($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIp() => $_has(1);
  @$pb.TagNumber(2)
  void clearIp() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get intervalMs => $_getIZ(2);
  @$pb.TagNumber(3)
  set intervalMs($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIntervalMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntervalMs() => clearField(3);
}

class ClientEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..e<ClientEvent_Type>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ClientEvent_Type.UNKNOWN, valueOf: ClientEvent_Type.valueOf, enumValues: ClientEvent_Type.values)
    ..a<$core.int>(100, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberDiscardedEvents', $pb.PbFieldType.OU3)
    ..a<$core.int>(200, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'networkType', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(202, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeConnectionStartedMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(203, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeConnectionEndedMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(204, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(300, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeConnectionEstablishedMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ClientEvent._() : super();
  factory ClientEvent({
    ClientEvent_Type? type,
    $core.int? numberDiscardedEvents,
    $core.int? networkType,
    $fixnum.Int64? timeConnectionStartedMs,
    $fixnum.Int64? timeConnectionEndedMs,
    $core.int? errorCode,
    $fixnum.Int64? timeConnectionEstablishedMs,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (numberDiscardedEvents != null) {
      _result.numberDiscardedEvents = numberDiscardedEvents;
    }
    if (networkType != null) {
      _result.networkType = networkType;
    }
    if (timeConnectionStartedMs != null) {
      _result.timeConnectionStartedMs = timeConnectionStartedMs;
    }
    if (timeConnectionEndedMs != null) {
      _result.timeConnectionEndedMs = timeConnectionEndedMs;
    }
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    if (timeConnectionEstablishedMs != null) {
      _result.timeConnectionEstablishedMs = timeConnectionEstablishedMs;
    }
    return _result;
  }
  factory ClientEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientEvent clone() => ClientEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientEvent copyWith(void Function(ClientEvent) updates) => super.copyWith((message) => updates(message as ClientEvent)) as ClientEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientEvent create() => ClientEvent._();
  ClientEvent createEmptyInstance() => create();
  static $pb.PbList<ClientEvent> createRepeated() => $pb.PbList<ClientEvent>();
  @$core.pragma('dart2js:noInline')
  static ClientEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientEvent>(create);
  static ClientEvent? _defaultInstance;

  @$pb.TagNumber(1)
  ClientEvent_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ClientEvent_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(100)
  $core.int get numberDiscardedEvents => $_getIZ(1);
  @$pb.TagNumber(100)
  set numberDiscardedEvents($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(100)
  $core.bool hasNumberDiscardedEvents() => $_has(1);
  @$pb.TagNumber(100)
  void clearNumberDiscardedEvents() => clearField(100);

  @$pb.TagNumber(200)
  $core.int get networkType => $_getIZ(2);
  @$pb.TagNumber(200)
  set networkType($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(200)
  $core.bool hasNetworkType() => $_has(2);
  @$pb.TagNumber(200)
  void clearNetworkType() => clearField(200);

  @$pb.TagNumber(202)
  $fixnum.Int64 get timeConnectionStartedMs => $_getI64(3);
  @$pb.TagNumber(202)
  set timeConnectionStartedMs($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(202)
  $core.bool hasTimeConnectionStartedMs() => $_has(3);
  @$pb.TagNumber(202)
  void clearTimeConnectionStartedMs() => clearField(202);

  @$pb.TagNumber(203)
  $fixnum.Int64 get timeConnectionEndedMs => $_getI64(4);
  @$pb.TagNumber(203)
  set timeConnectionEndedMs($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(203)
  $core.bool hasTimeConnectionEndedMs() => $_has(4);
  @$pb.TagNumber(203)
  void clearTimeConnectionEndedMs() => clearField(203);

  @$pb.TagNumber(204)
  $core.int get errorCode => $_getIZ(5);
  @$pb.TagNumber(204)
  set errorCode($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(204)
  $core.bool hasErrorCode() => $_has(5);
  @$pb.TagNumber(204)
  void clearErrorCode() => clearField(204);

  @$pb.TagNumber(300)
  $fixnum.Int64 get timeConnectionEstablishedMs => $_getI64(6);
  @$pb.TagNumber(300)
  set timeConnectionEstablishedMs($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(300)
  $core.bool hasTimeConnectionEstablishedMs() => $_has(6);
  @$pb.TagNumber(300)
  void clearTimeConnectionEstablishedMs() => clearField(300);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aQS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'domain')
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user')
    ..aQS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..aQS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authToken')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastRmqId')
    ..pc<Setting>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setting', $pb.PbFieldType.PM, subBuilder: Setting.create)
    ..pPS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receivedPersistentId')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'adaptiveHeartbeat')
    ..aOM<HeartbeatStat>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heartbeatStat', subBuilder: HeartbeatStat.create)
    ..aOB(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'useRmq2')
    ..aInt64(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..e<LoginRequest_AuthService>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authService', $pb.PbFieldType.OE, defaultOrMaker: LoginRequest_AuthService.ANDROID_ID, valueOf: LoginRequest_AuthService.valueOf, enumValues: LoginRequest_AuthService.values)
    ..a<$core.int>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'networkType', $pb.PbFieldType.O3)
    ..aInt64(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..pc<ClientEvent>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientEvent', $pb.PbFieldType.PM, subBuilder: ClientEvent.create)
  ;

  LoginRequest._() : super();
  factory LoginRequest({
    $core.String? id,
    $core.String? domain,
    $core.String? user,
    $core.String? resource,
    $core.String? authToken,
    $core.String? deviceId,
    $fixnum.Int64? lastRmqId,
    $core.Iterable<Setting>? setting,
    $core.Iterable<$core.String>? receivedPersistentId,
    $core.bool? adaptiveHeartbeat,
    HeartbeatStat? heartbeatStat,
    $core.bool? useRmq2,
    $fixnum.Int64? accountId,
    LoginRequest_AuthService? authService,
    $core.int? networkType,
    $fixnum.Int64? status,
    $core.Iterable<ClientEvent>? clientEvent,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (domain != null) {
      _result.domain = domain;
    }
    if (user != null) {
      _result.user = user;
    }
    if (resource != null) {
      _result.resource = resource;
    }
    if (authToken != null) {
      _result.authToken = authToken;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (lastRmqId != null) {
      _result.lastRmqId = lastRmqId;
    }
    if (setting != null) {
      _result.setting.addAll(setting);
    }
    if (receivedPersistentId != null) {
      _result.receivedPersistentId.addAll(receivedPersistentId);
    }
    if (adaptiveHeartbeat != null) {
      _result.adaptiveHeartbeat = adaptiveHeartbeat;
    }
    if (heartbeatStat != null) {
      _result.heartbeatStat = heartbeatStat;
    }
    if (useRmq2 != null) {
      _result.useRmq2 = useRmq2;
    }
    if (accountId != null) {
      _result.accountId = accountId;
    }
    if (authService != null) {
      _result.authService = authService;
    }
    if (networkType != null) {
      _result.networkType = networkType;
    }
    if (status != null) {
      _result.status = status;
    }
    if (clientEvent != null) {
      _result.clientEvent.addAll(clientEvent);
    }
    return _result;
  }
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get domain => $_getSZ(1);
  @$pb.TagNumber(2)
  set domain($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDomain() => $_has(1);
  @$pb.TagNumber(2)
  void clearDomain() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get user => $_getSZ(2);
  @$pb.TagNumber(3)
  set user($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get resource => $_getSZ(3);
  @$pb.TagNumber(4)
  set resource($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResource() => $_has(3);
  @$pb.TagNumber(4)
  void clearResource() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set authToken($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthToken() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deviceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set deviceId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastRmqId => $_getI64(6);
  @$pb.TagNumber(7)
  set lastRmqId($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastRmqId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastRmqId() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<Setting> get setting => $_getList(7);

  @$pb.TagNumber(10)
  $core.List<$core.String> get receivedPersistentId => $_getList(8);

  @$pb.TagNumber(12)
  $core.bool get adaptiveHeartbeat => $_getBF(9);
  @$pb.TagNumber(12)
  set adaptiveHeartbeat($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(12)
  $core.bool hasAdaptiveHeartbeat() => $_has(9);
  @$pb.TagNumber(12)
  void clearAdaptiveHeartbeat() => clearField(12);

  @$pb.TagNumber(13)
  HeartbeatStat get heartbeatStat => $_getN(10);
  @$pb.TagNumber(13)
  set heartbeatStat(HeartbeatStat v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasHeartbeatStat() => $_has(10);
  @$pb.TagNumber(13)
  void clearHeartbeatStat() => clearField(13);
  @$pb.TagNumber(13)
  HeartbeatStat ensureHeartbeatStat() => $_ensure(10);

  @$pb.TagNumber(14)
  $core.bool get useRmq2 => $_getBF(11);
  @$pb.TagNumber(14)
  set useRmq2($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(14)
  $core.bool hasUseRmq2() => $_has(11);
  @$pb.TagNumber(14)
  void clearUseRmq2() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get accountId => $_getI64(12);
  @$pb.TagNumber(15)
  set accountId($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(15)
  $core.bool hasAccountId() => $_has(12);
  @$pb.TagNumber(15)
  void clearAccountId() => clearField(15);

  @$pb.TagNumber(16)
  LoginRequest_AuthService get authService => $_getN(13);
  @$pb.TagNumber(16)
  set authService(LoginRequest_AuthService v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasAuthService() => $_has(13);
  @$pb.TagNumber(16)
  void clearAuthService() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get networkType => $_getIZ(14);
  @$pb.TagNumber(17)
  set networkType($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(17)
  $core.bool hasNetworkType() => $_has(14);
  @$pb.TagNumber(17)
  void clearNetworkType() => clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get status => $_getI64(15);
  @$pb.TagNumber(18)
  set status($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(18)
  $core.bool hasStatus() => $_has(15);
  @$pb.TagNumber(18)
  void clearStatus() => clearField(18);

  @$pb.TagNumber(22)
  $core.List<ClientEvent> get clientEvent => $_getList(16);
}

class LoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jid')
    ..aOM<ErrorInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ErrorInfo.create)
    ..pc<Setting>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setting', $pb.PbFieldType.PM, subBuilder: Setting.create)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamId', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastStreamIdReceived', $pb.PbFieldType.O3)
    ..aOM<HeartbeatConfig>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heartbeatConfig', subBuilder: HeartbeatConfig.create)
    ..aInt64(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serverTimestamp')
  ;

  LoginResponse._() : super();
  factory LoginResponse({
    $core.String? id,
    $core.String? jid,
    ErrorInfo? error,
    $core.Iterable<Setting>? setting,
    $core.int? streamId,
    $core.int? lastStreamIdReceived,
    HeartbeatConfig? heartbeatConfig,
    $fixnum.Int64? serverTimestamp,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (jid != null) {
      _result.jid = jid;
    }
    if (error != null) {
      _result.error = error;
    }
    if (setting != null) {
      _result.setting.addAll(setting);
    }
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (lastStreamIdReceived != null) {
      _result.lastStreamIdReceived = lastStreamIdReceived;
    }
    if (heartbeatConfig != null) {
      _result.heartbeatConfig = heartbeatConfig;
    }
    if (serverTimestamp != null) {
      _result.serverTimestamp = serverTimestamp;
    }
    return _result;
  }
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse)) as LoginResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get jid => $_getSZ(1);
  @$pb.TagNumber(2)
  set jid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJid() => $_has(1);
  @$pb.TagNumber(2)
  void clearJid() => clearField(2);

  @$pb.TagNumber(3)
  ErrorInfo get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ErrorInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  ErrorInfo ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<Setting> get setting => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get streamId => $_getIZ(4);
  @$pb.TagNumber(5)
  set streamId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStreamId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get lastStreamIdReceived => $_getIZ(5);
  @$pb.TagNumber(6)
  set lastStreamIdReceived($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastStreamIdReceived() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastStreamIdReceived() => clearField(6);

  @$pb.TagNumber(7)
  HeartbeatConfig get heartbeatConfig => $_getN(6);
  @$pb.TagNumber(7)
  set heartbeatConfig(HeartbeatConfig v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasHeartbeatConfig() => $_has(6);
  @$pb.TagNumber(7)
  void clearHeartbeatConfig() => clearField(7);
  @$pb.TagNumber(7)
  HeartbeatConfig ensureHeartbeatConfig() => $_ensure(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get serverTimestamp => $_getI64(7);
  @$pb.TagNumber(8)
  set serverTimestamp($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasServerTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearServerTimestamp() => clearField(8);
}

class StreamErrorStanza extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamErrorStanza', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
  ;

  StreamErrorStanza._() : super();
  factory StreamErrorStanza({
    $core.String? type,
    $core.String? text,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory StreamErrorStanza.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamErrorStanza.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamErrorStanza clone() => StreamErrorStanza()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamErrorStanza copyWith(void Function(StreamErrorStanza) updates) => super.copyWith((message) => updates(message as StreamErrorStanza)) as StreamErrorStanza; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamErrorStanza create() => StreamErrorStanza._();
  StreamErrorStanza createEmptyInstance() => create();
  static $pb.PbList<StreamErrorStanza> createRepeated() => $pb.PbList<StreamErrorStanza>();
  @$core.pragma('dart2js:noInline')
  static StreamErrorStanza getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamErrorStanza>(create);
  static StreamErrorStanza? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);
}

class Close extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Close', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Close._() : super();
  factory Close() => create();
  factory Close.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Close.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Close clone() => Close()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Close copyWith(void Function(Close) updates) => super.copyWith((message) => updates(message as Close)) as Close; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Close create() => Close._();
  Close createEmptyInstance() => create();
  static $pb.PbList<Close> createRepeated() => $pb.PbList<Close>();
  @$core.pragma('dart2js:noInline')
  static Close getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Close>(create);
  static Close? _defaultInstance;
}

class Extension extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Extension', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.Q3)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.QY)
  ;

  Extension._() : super();
  factory Extension({
    $core.int? id,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory Extension.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Extension.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Extension clone() => Extension()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Extension copyWith(void Function(Extension) updates) => super.copyWith((message) => updates(message as Extension)) as Extension; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Extension create() => Extension._();
  Extension createEmptyInstance() => create();
  static $pb.PbList<Extension> createRepeated() => $pb.PbList<Extension>();
  @$core.pragma('dart2js:noInline')
  static Extension getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Extension>(create);
  static Extension? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class IqStanza extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IqStanza', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rmqId')
    ..e<IqStanza_IqType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.QE, defaultOrMaker: IqStanza_IqType.GET, valueOf: IqStanza_IqType.valueOf, enumValues: IqStanza_IqType.values)
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..aOM<ErrorInfo>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ErrorInfo.create)
    ..aOM<Extension>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extension', subBuilder: Extension.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'persistentId')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamId', $pb.PbFieldType.O3)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastStreamIdReceived', $pb.PbFieldType.O3)
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..aInt64(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
  ;

  IqStanza._() : super();
  factory IqStanza({
    $fixnum.Int64? rmqId,
    IqStanza_IqType? type,
    $core.String? id,
    $core.String? from,
    $core.String? to,
    ErrorInfo? error,
    Extension? extension_7,
    $core.String? persistentId,
    $core.int? streamId,
    $core.int? lastStreamIdReceived,
    $fixnum.Int64? accountId,
    $fixnum.Int64? status,
  }) {
    final _result = create();
    if (rmqId != null) {
      _result.rmqId = rmqId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (id != null) {
      _result.id = id;
    }
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (error != null) {
      _result.error = error;
    }
    if (extension_7 != null) {
      _result.extension_7 = extension_7;
    }
    if (persistentId != null) {
      _result.persistentId = persistentId;
    }
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (lastStreamIdReceived != null) {
      _result.lastStreamIdReceived = lastStreamIdReceived;
    }
    if (accountId != null) {
      _result.accountId = accountId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory IqStanza.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IqStanza.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IqStanza clone() => IqStanza()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IqStanza copyWith(void Function(IqStanza) updates) => super.copyWith((message) => updates(message as IqStanza)) as IqStanza; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IqStanza create() => IqStanza._();
  IqStanza createEmptyInstance() => create();
  static $pb.PbList<IqStanza> createRepeated() => $pb.PbList<IqStanza>();
  @$core.pragma('dart2js:noInline')
  static IqStanza getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IqStanza>(create);
  static IqStanza? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rmqId => $_getI64(0);
  @$pb.TagNumber(1)
  set rmqId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRmqId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRmqId() => clearField(1);

  @$pb.TagNumber(2)
  IqStanza_IqType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(IqStanza_IqType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get from => $_getSZ(3);
  @$pb.TagNumber(4)
  set from($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get to => $_getSZ(4);
  @$pb.TagNumber(5)
  set to($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);

  @$pb.TagNumber(6)
  ErrorInfo get error => $_getN(5);
  @$pb.TagNumber(6)
  set error(ErrorInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => clearField(6);
  @$pb.TagNumber(6)
  ErrorInfo ensureError() => $_ensure(5);

  @$pb.TagNumber(7)
  Extension get extension_7 => $_getN(6);
  @$pb.TagNumber(7)
  set extension_7(Extension v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasExtension_7() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtension_7() => clearField(7);
  @$pb.TagNumber(7)
  Extension ensureExtension_7() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get persistentId => $_getSZ(7);
  @$pb.TagNumber(8)
  set persistentId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPersistentId() => $_has(7);
  @$pb.TagNumber(8)
  void clearPersistentId() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get streamId => $_getIZ(8);
  @$pb.TagNumber(9)
  set streamId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStreamId() => $_has(8);
  @$pb.TagNumber(9)
  void clearStreamId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get lastStreamIdReceived => $_getIZ(9);
  @$pb.TagNumber(10)
  set lastStreamIdReceived($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastStreamIdReceived() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastStreamIdReceived() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get accountId => $_getI64(10);
  @$pb.TagNumber(11)
  set accountId($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAccountId() => $_has(10);
  @$pb.TagNumber(11)
  void clearAccountId() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get status => $_getI64(11);
  @$pb.TagNumber(12)
  set status($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => clearField(12);
}

class AppData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aQS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
  ;

  AppData._() : super();
  factory AppData({
    $core.String? key,
    $core.String? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory AppData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppData clone() => AppData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppData copyWith(void Function(AppData) updates) => super.copyWith((message) => updates(message as AppData)) as AppData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppData create() => AppData._();
  AppData createEmptyInstance() => create();
  static $pb.PbList<AppData> createRepeated() => $pb.PbList<AppData>();
  @$core.pragma('dart2js:noInline')
  static AppData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppData>(create);
  static AppData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class DataMessageStanza extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataMessageStanza', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..aQS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..pc<AppData>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appData', $pb.PbFieldType.PM, subBuilder: AppData.create)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromTrustedServer')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'persistentId')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamId', $pb.PbFieldType.O3)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastStreamIdReceived', $pb.PbFieldType.O3)
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regId')
    ..aInt64(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceUserId')
    ..a<$core.int>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ttl', $pb.PbFieldType.O3)
    ..aInt64(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sent')
    ..a<$core.int>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'queued', $pb.PbFieldType.O3)
    ..aInt64(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..a<$core.List<$core.int>>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawData', $pb.PbFieldType.OY)
    ..aOB(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'immediateAck')
  ;

  DataMessageStanza._() : super();
  factory DataMessageStanza({
    $core.String? id,
    $core.String? from,
    $core.String? to,
    $core.String? category,
    $core.String? token,
    $core.Iterable<AppData>? appData,
    $core.bool? fromTrustedServer,
    $core.String? persistentId,
    $core.int? streamId,
    $core.int? lastStreamIdReceived,
    $core.String? regId,
    $fixnum.Int64? deviceUserId,
    $core.int? ttl,
    $fixnum.Int64? sent,
    $core.int? queued,
    $fixnum.Int64? status,
    $core.List<$core.int>? rawData,
    $core.bool? immediateAck,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (category != null) {
      _result.category = category;
    }
    if (token != null) {
      _result.token = token;
    }
    if (appData != null) {
      _result.appData.addAll(appData);
    }
    if (fromTrustedServer != null) {
      _result.fromTrustedServer = fromTrustedServer;
    }
    if (persistentId != null) {
      _result.persistentId = persistentId;
    }
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (lastStreamIdReceived != null) {
      _result.lastStreamIdReceived = lastStreamIdReceived;
    }
    if (regId != null) {
      _result.regId = regId;
    }
    if (deviceUserId != null) {
      _result.deviceUserId = deviceUserId;
    }
    if (ttl != null) {
      _result.ttl = ttl;
    }
    if (sent != null) {
      _result.sent = sent;
    }
    if (queued != null) {
      _result.queued = queued;
    }
    if (status != null) {
      _result.status = status;
    }
    if (rawData != null) {
      _result.rawData = rawData;
    }
    if (immediateAck != null) {
      _result.immediateAck = immediateAck;
    }
    return _result;
  }
  factory DataMessageStanza.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataMessageStanza.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataMessageStanza clone() => DataMessageStanza()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataMessageStanza copyWith(void Function(DataMessageStanza) updates) => super.copyWith((message) => updates(message as DataMessageStanza)) as DataMessageStanza; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataMessageStanza create() => DataMessageStanza._();
  DataMessageStanza createEmptyInstance() => create();
  static $pb.PbList<DataMessageStanza> createRepeated() => $pb.PbList<DataMessageStanza>();
  @$core.pragma('dart2js:noInline')
  static DataMessageStanza getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataMessageStanza>(create);
  static DataMessageStanza? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get from => $_getSZ(1);
  @$pb.TagNumber(3)
  set from($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(4)
  set to($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(4)
  void clearTo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get category => $_getSZ(3);
  @$pb.TagNumber(5)
  set category($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get token => $_getSZ(4);
  @$pb.TagNumber(6)
  set token($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasToken() => $_has(4);
  @$pb.TagNumber(6)
  void clearToken() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<AppData> get appData => $_getList(5);

  @$pb.TagNumber(8)
  $core.bool get fromTrustedServer => $_getBF(6);
  @$pb.TagNumber(8)
  set fromTrustedServer($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasFromTrustedServer() => $_has(6);
  @$pb.TagNumber(8)
  void clearFromTrustedServer() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get persistentId => $_getSZ(7);
  @$pb.TagNumber(9)
  set persistentId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasPersistentId() => $_has(7);
  @$pb.TagNumber(9)
  void clearPersistentId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get streamId => $_getIZ(8);
  @$pb.TagNumber(10)
  set streamId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasStreamId() => $_has(8);
  @$pb.TagNumber(10)
  void clearStreamId() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get lastStreamIdReceived => $_getIZ(9);
  @$pb.TagNumber(11)
  set lastStreamIdReceived($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastStreamIdReceived() => $_has(9);
  @$pb.TagNumber(11)
  void clearLastStreamIdReceived() => clearField(11);

  @$pb.TagNumber(13)
  $core.String get regId => $_getSZ(10);
  @$pb.TagNumber(13)
  set regId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(13)
  $core.bool hasRegId() => $_has(10);
  @$pb.TagNumber(13)
  void clearRegId() => clearField(13);

  @$pb.TagNumber(16)
  $fixnum.Int64 get deviceUserId => $_getI64(11);
  @$pb.TagNumber(16)
  set deviceUserId($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(16)
  $core.bool hasDeviceUserId() => $_has(11);
  @$pb.TagNumber(16)
  void clearDeviceUserId() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get ttl => $_getIZ(12);
  @$pb.TagNumber(17)
  set ttl($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(17)
  $core.bool hasTtl() => $_has(12);
  @$pb.TagNumber(17)
  void clearTtl() => clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get sent => $_getI64(13);
  @$pb.TagNumber(18)
  set sent($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(18)
  $core.bool hasSent() => $_has(13);
  @$pb.TagNumber(18)
  void clearSent() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get queued => $_getIZ(14);
  @$pb.TagNumber(19)
  set queued($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(19)
  $core.bool hasQueued() => $_has(14);
  @$pb.TagNumber(19)
  void clearQueued() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get status => $_getI64(15);
  @$pb.TagNumber(20)
  set status($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(20)
  $core.bool hasStatus() => $_has(15);
  @$pb.TagNumber(20)
  void clearStatus() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<$core.int> get rawData => $_getN(16);
  @$pb.TagNumber(21)
  set rawData($core.List<$core.int> v) { $_setBytes(16, v); }
  @$pb.TagNumber(21)
  $core.bool hasRawData() => $_has(16);
  @$pb.TagNumber(21)
  void clearRawData() => clearField(21);

  @$pb.TagNumber(24)
  $core.bool get immediateAck => $_getBF(17);
  @$pb.TagNumber(24)
  set immediateAck($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(24)
  $core.bool hasImmediateAck() => $_has(17);
  @$pb.TagNumber(24)
  void clearImmediateAck() => clearField(24);
}

class StreamAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamAck', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  StreamAck._() : super();
  factory StreamAck() => create();
  factory StreamAck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamAck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamAck clone() => StreamAck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamAck copyWith(void Function(StreamAck) updates) => super.copyWith((message) => updates(message as StreamAck)) as StreamAck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamAck create() => StreamAck._();
  StreamAck createEmptyInstance() => create();
  static $pb.PbList<StreamAck> createRepeated() => $pb.PbList<StreamAck>();
  @$core.pragma('dart2js:noInline')
  static StreamAck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamAck>(create);
  static StreamAck? _defaultInstance;
}

class SelectiveAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SelectiveAck', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mcs_proto'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  SelectiveAck._() : super();
  factory SelectiveAck({
    $core.Iterable<$core.String>? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory SelectiveAck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectiveAck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SelectiveAck clone() => SelectiveAck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SelectiveAck copyWith(void Function(SelectiveAck) updates) => super.copyWith((message) => updates(message as SelectiveAck)) as SelectiveAck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectiveAck create() => SelectiveAck._();
  SelectiveAck createEmptyInstance() => create();
  static $pb.PbList<SelectiveAck> createRepeated() => $pb.PbList<SelectiveAck>();
  @$core.pragma('dart2js:noInline')
  static SelectiveAck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectiveAck>(create);
  static SelectiveAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get id => $_getList(0);
}

