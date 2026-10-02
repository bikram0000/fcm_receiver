///
//  Generated code. Do not modify.
//  source: assets/proto/android_checkin.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'android_checkin.pbenum.dart';

export 'android_checkin.pbenum.dart';

class ChromeBuildProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChromeBuildProto',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'checkin_proto'),
      createEmptyInstance: create)
    ..e<ChromeBuildProto_Platform>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform',
        $pb.PbFieldType.OE,
        defaultOrMaker: ChromeBuildProto_Platform.PLATFORM_WIN,
        valueOf: ChromeBuildProto_Platform.valueOf,
        enumValues: ChromeBuildProto_Platform.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chromeVersion')
    ..e<ChromeBuildProto_Channel>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'channel',
        $pb.PbFieldType.OE,
        defaultOrMaker: ChromeBuildProto_Channel.CHANNEL_STABLE,
        valueOf: ChromeBuildProto_Channel.valueOf,
        enumValues: ChromeBuildProto_Channel.values)
    ..hasRequiredFields = false;

  ChromeBuildProto._() : super();
  factory ChromeBuildProto({
    ChromeBuildProto_Platform? platform,
    $core.String? chromeVersion,
    ChromeBuildProto_Channel? channel,
  }) {
    final _result = create();
    if (platform != null) {
      _result.platform = platform;
    }
    if (chromeVersion != null) {
      _result.chromeVersion = chromeVersion;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    return _result;
  }
  factory ChromeBuildProto.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChromeBuildProto.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChromeBuildProto clone() => ChromeBuildProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChromeBuildProto copyWith(void Function(ChromeBuildProto) updates) =>
      super.copyWith((message) => updates(message as ChromeBuildProto))
          as ChromeBuildProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChromeBuildProto create() => ChromeBuildProto._();
  ChromeBuildProto createEmptyInstance() => create();
  static $pb.PbList<ChromeBuildProto> createRepeated() =>
      $pb.PbList<ChromeBuildProto>();
  @$core.pragma('dart2js:noInline')
  static ChromeBuildProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChromeBuildProto>(create);
  static ChromeBuildProto? _defaultInstance;

  @$pb.TagNumber(1)
  ChromeBuildProto_Platform get platform => $_getN(0);
  @$pb.TagNumber(1)
  set platform(ChromeBuildProto_Platform v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chromeVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set chromeVersion($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChromeVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearChromeVersion() => clearField(2);

  @$pb.TagNumber(3)
  ChromeBuildProto_Channel get channel => $_getN(2);
  @$pb.TagNumber(3)
  set channel(ChromeBuildProto_Channel v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannel() => clearField(3);
}

class AndroidCheckinProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AndroidCheckinProto',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'checkin_proto'),
      createEmptyInstance: create)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastCheckinMsec')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cellOperator')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'simOperator')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roaming')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userNumber',
        $pb.PbFieldType.O3)
    ..e<DeviceType>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: DeviceType.DEVICE_ANDROID_OS,
        valueOf: DeviceType.valueOf,
        enumValues: DeviceType.values)
    ..aOM<ChromeBuildProto>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chromeBuild',
        subBuilder: ChromeBuildProto.create)
    ..hasRequiredFields = false;

  AndroidCheckinProto._() : super();
  factory AndroidCheckinProto({
    $fixnum.Int64? lastCheckinMsec,
    $core.String? cellOperator,
    $core.String? simOperator,
    $core.String? roaming,
    $core.int? userNumber,
    DeviceType? type,
    ChromeBuildProto? chromeBuild,
  }) {
    final _result = create();
    if (lastCheckinMsec != null) {
      _result.lastCheckinMsec = lastCheckinMsec;
    }
    if (cellOperator != null) {
      _result.cellOperator = cellOperator;
    }
    if (simOperator != null) {
      _result.simOperator = simOperator;
    }
    if (roaming != null) {
      _result.roaming = roaming;
    }
    if (userNumber != null) {
      _result.userNumber = userNumber;
    }
    if (type != null) {
      _result.type = type;
    }
    if (chromeBuild != null) {
      _result.chromeBuild = chromeBuild;
    }
    return _result;
  }
  factory AndroidCheckinProto.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AndroidCheckinProto.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AndroidCheckinProto clone() => AndroidCheckinProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AndroidCheckinProto copyWith(void Function(AndroidCheckinProto) updates) =>
      super.copyWith((message) => updates(message as AndroidCheckinProto))
          as AndroidCheckinProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AndroidCheckinProto create() => AndroidCheckinProto._();
  AndroidCheckinProto createEmptyInstance() => create();
  static $pb.PbList<AndroidCheckinProto> createRepeated() =>
      $pb.PbList<AndroidCheckinProto>();
  @$core.pragma('dart2js:noInline')
  static AndroidCheckinProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AndroidCheckinProto>(create);
  static AndroidCheckinProto? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastCheckinMsec => $_getI64(0);
  @$pb.TagNumber(2)
  set lastCheckinMsec($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastCheckinMsec() => $_has(0);
  @$pb.TagNumber(2)
  void clearLastCheckinMsec() => clearField(2);

  @$pb.TagNumber(6)
  $core.String get cellOperator => $_getSZ(1);
  @$pb.TagNumber(6)
  set cellOperator($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCellOperator() => $_has(1);
  @$pb.TagNumber(6)
  void clearCellOperator() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get simOperator => $_getSZ(2);
  @$pb.TagNumber(7)
  set simOperator($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSimOperator() => $_has(2);
  @$pb.TagNumber(7)
  void clearSimOperator() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get roaming => $_getSZ(3);
  @$pb.TagNumber(8)
  set roaming($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRoaming() => $_has(3);
  @$pb.TagNumber(8)
  void clearRoaming() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get userNumber => $_getIZ(4);
  @$pb.TagNumber(9)
  set userNumber($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUserNumber() => $_has(4);
  @$pb.TagNumber(9)
  void clearUserNumber() => clearField(9);

  @$pb.TagNumber(12)
  DeviceType get type => $_getN(5);
  @$pb.TagNumber(12)
  set type(DeviceType v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(12)
  void clearType() => clearField(12);

  @$pb.TagNumber(13)
  ChromeBuildProto get chromeBuild => $_getN(6);
  @$pb.TagNumber(13)
  set chromeBuild(ChromeBuildProto v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasChromeBuild() => $_has(6);
  @$pb.TagNumber(13)
  void clearChromeBuild() => clearField(13);
  @$pb.TagNumber(13)
  ChromeBuildProto ensureChromeBuild() => $_ensure(6);
}
