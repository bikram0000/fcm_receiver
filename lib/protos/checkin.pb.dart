///
//  Generated code. Do not modify.
//  source: assets/proto/checkin.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'android_checkin.pb.dart' as $0;

class GservicesSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GservicesSetting',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'checkin_proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name',
        $pb.PbFieldType.QY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.QY);

  GservicesSetting._() : super();
  factory GservicesSetting({
    $core.List<$core.int>? name,
    $core.List<$core.int>? value,
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
  factory GservicesSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GservicesSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GservicesSetting clone() => GservicesSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GservicesSetting copyWith(void Function(GservicesSetting) updates) =>
      super.copyWith((message) => updates(message as GservicesSetting))
          as GservicesSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GservicesSetting create() => GservicesSetting._();
  GservicesSetting createEmptyInstance() => create();
  static $pb.PbList<GservicesSetting> createRepeated() =>
      $pb.PbList<GservicesSetting>();
  @$core.pragma('dart2js:noInline')
  static GservicesSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GservicesSetting>(create);
  static GservicesSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get name => $_getN(0);
  @$pb.TagNumber(1)
  set name($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class AndroidCheckinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AndroidCheckinRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'checkin_proto'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imei')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'digest')
    ..aQM<$0.AndroidCheckinProto>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkin',
        subBuilder: $0.AndroidCheckinProto.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desiredBuild')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'locale')
    ..aInt64(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loggingId')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marketCheckin')
    ..pPS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'macAddr')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'meid')
    ..pPS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accountCookie')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeZone')
    ..a<$fixnum.Int64>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'securityToken',
        $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.O3)
    ..pPS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'otaCert')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serialNumber')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'esn')
    ..pPS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'macAddrType')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fragment',
        $pb.PbFieldType.O3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userSerialNumber',
        $pb.PbFieldType.O3);

  AndroidCheckinRequest._() : super();
  factory AndroidCheckinRequest({
    $core.String? imei,
    $fixnum.Int64? id,
    $core.String? digest,
    $0.AndroidCheckinProto? checkin,
    $core.String? desiredBuild,
    $core.String? locale,
    $fixnum.Int64? loggingId,
    $core.String? marketCheckin,
    $core.Iterable<$core.String>? macAddr,
    $core.String? meid,
    $core.Iterable<$core.String>? accountCookie,
    $core.String? timeZone,
    $fixnum.Int64? securityToken,
    $core.int? version,
    $core.Iterable<$core.String>? otaCert,
    $core.String? serialNumber,
    $core.String? esn,
    $core.Iterable<$core.String>? macAddrType,
    $core.int? fragment,
    $core.String? userName,
    $core.int? userSerialNumber,
  }) {
    final _result = create();
    if (imei != null) {
      _result.imei = imei;
    }
    if (id != null) {
      _result.id = id;
    }
    if (digest != null) {
      _result.digest = digest;
    }
    if (checkin != null) {
      _result.checkin = checkin;
    }
    if (desiredBuild != null) {
      _result.desiredBuild = desiredBuild;
    }
    if (locale != null) {
      _result.locale = locale;
    }
    if (loggingId != null) {
      _result.loggingId = loggingId;
    }
    if (marketCheckin != null) {
      _result.marketCheckin = marketCheckin;
    }
    if (macAddr != null) {
      _result.macAddr.addAll(macAddr);
    }
    if (meid != null) {
      _result.meid = meid;
    }
    if (accountCookie != null) {
      _result.accountCookie.addAll(accountCookie);
    }
    if (timeZone != null) {
      _result.timeZone = timeZone;
    }
    if (securityToken != null) {
      _result.securityToken = securityToken;
    }
    if (version != null) {
      _result.version = version;
    }
    if (otaCert != null) {
      _result.otaCert.addAll(otaCert);
    }
    if (serialNumber != null) {
      _result.serialNumber = serialNumber;
    }
    if (esn != null) {
      _result.esn = esn;
    }
    if (macAddrType != null) {
      _result.macAddrType.addAll(macAddrType);
    }
    if (fragment != null) {
      _result.fragment = fragment;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userSerialNumber != null) {
      _result.userSerialNumber = userSerialNumber;
    }
    return _result;
  }
  factory AndroidCheckinRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AndroidCheckinRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AndroidCheckinRequest clone() =>
      AndroidCheckinRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AndroidCheckinRequest copyWith(
          void Function(AndroidCheckinRequest) updates) =>
      super.copyWith((message) => updates(message as AndroidCheckinRequest))
          as AndroidCheckinRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AndroidCheckinRequest create() => AndroidCheckinRequest._();
  AndroidCheckinRequest createEmptyInstance() => create();
  static $pb.PbList<AndroidCheckinRequest> createRepeated() =>
      $pb.PbList<AndroidCheckinRequest>();
  @$core.pragma('dart2js:noInline')
  static AndroidCheckinRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AndroidCheckinRequest>(create);
  static AndroidCheckinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imei => $_getSZ(0);
  @$pb.TagNumber(1)
  set imei($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImei() => $_has(0);
  @$pb.TagNumber(1)
  void clearImei() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get digest => $_getSZ(2);
  @$pb.TagNumber(3)
  set digest($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDigest() => $_has(2);
  @$pb.TagNumber(3)
  void clearDigest() => clearField(3);

  @$pb.TagNumber(4)
  $0.AndroidCheckinProto get checkin => $_getN(3);
  @$pb.TagNumber(4)
  set checkin($0.AndroidCheckinProto v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCheckin() => $_has(3);
  @$pb.TagNumber(4)
  void clearCheckin() => clearField(4);
  @$pb.TagNumber(4)
  $0.AndroidCheckinProto ensureCheckin() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get desiredBuild => $_getSZ(4);
  @$pb.TagNumber(5)
  set desiredBuild($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesiredBuild() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesiredBuild() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get locale => $_getSZ(5);
  @$pb.TagNumber(6)
  set locale($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLocale() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocale() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get loggingId => $_getI64(6);
  @$pb.TagNumber(7)
  set loggingId($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLoggingId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLoggingId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get marketCheckin => $_getSZ(7);
  @$pb.TagNumber(8)
  set marketCheckin($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMarketCheckin() => $_has(7);
  @$pb.TagNumber(8)
  void clearMarketCheckin() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get macAddr => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get meid => $_getSZ(9);
  @$pb.TagNumber(10)
  set meid($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMeid() => $_has(9);
  @$pb.TagNumber(10)
  void clearMeid() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.String> get accountCookie => $_getList(10);

  @$pb.TagNumber(12)
  $core.String get timeZone => $_getSZ(11);
  @$pb.TagNumber(12)
  set timeZone($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTimeZone() => $_has(11);
  @$pb.TagNumber(12)
  void clearTimeZone() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get securityToken => $_getI64(12);
  @$pb.TagNumber(13)
  set securityToken($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSecurityToken() => $_has(12);
  @$pb.TagNumber(13)
  void clearSecurityToken() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get version => $_getIZ(13);
  @$pb.TagNumber(14)
  set version($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasVersion() => $_has(13);
  @$pb.TagNumber(14)
  void clearVersion() => clearField(14);

  @$pb.TagNumber(15)
  $core.List<$core.String> get otaCert => $_getList(14);

  @$pb.TagNumber(16)
  $core.String get serialNumber => $_getSZ(15);
  @$pb.TagNumber(16)
  set serialNumber($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasSerialNumber() => $_has(15);
  @$pb.TagNumber(16)
  void clearSerialNumber() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get esn => $_getSZ(16);
  @$pb.TagNumber(17)
  set esn($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasEsn() => $_has(16);
  @$pb.TagNumber(17)
  void clearEsn() => clearField(17);

  @$pb.TagNumber(19)
  $core.List<$core.String> get macAddrType => $_getList(17);

  @$pb.TagNumber(20)
  $core.int get fragment => $_getIZ(18);
  @$pb.TagNumber(20)
  set fragment($core.int v) {
    $_setSignedInt32(18, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasFragment() => $_has(18);
  @$pb.TagNumber(20)
  void clearFragment() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get userName => $_getSZ(19);
  @$pb.TagNumber(21)
  set userName($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasUserName() => $_has(19);
  @$pb.TagNumber(21)
  void clearUserName() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get userSerialNumber => $_getIZ(20);
  @$pb.TagNumber(22)
  set userSerialNumber($core.int v) {
    $_setSignedInt32(20, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasUserSerialNumber() => $_has(20);
  @$pb.TagNumber(22)
  void clearUserSerialNumber() => clearField(22);
}

class AndroidCheckinResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AndroidCheckinResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'checkin_proto'),
      createEmptyInstance: create)
    ..a<$core.bool>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'statsOk',
        $pb.PbFieldType.QB)
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeMsec')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'digest')
    ..pc<GservicesSetting>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'setting',
        $pb.PbFieldType.PM,
        subBuilder: GservicesSetting.create)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marketOk')
    ..a<$fixnum.Int64>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'androidId',
        $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'securityToken',
        $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settingsDiff')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleteSetting')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'versionInfo');

  AndroidCheckinResponse._() : super();
  factory AndroidCheckinResponse({
    $core.bool? statsOk,
    $fixnum.Int64? timeMsec,
    $core.String? digest,
    $core.Iterable<GservicesSetting>? setting,
    $core.bool? marketOk,
    $fixnum.Int64? androidId,
    $fixnum.Int64? securityToken,
    $core.bool? settingsDiff,
    $core.Iterable<$core.String>? deleteSetting,
    $core.String? versionInfo,
  }) {
    final _result = create();
    if (statsOk != null) {
      _result.statsOk = statsOk;
    }
    if (timeMsec != null) {
      _result.timeMsec = timeMsec;
    }
    if (digest != null) {
      _result.digest = digest;
    }
    if (setting != null) {
      _result.setting.addAll(setting);
    }
    if (marketOk != null) {
      _result.marketOk = marketOk;
    }
    if (androidId != null) {
      _result.androidId = androidId;
    }
    if (securityToken != null) {
      _result.securityToken = securityToken;
    }
    if (settingsDiff != null) {
      _result.settingsDiff = settingsDiff;
    }
    if (deleteSetting != null) {
      _result.deleteSetting.addAll(deleteSetting);
    }
    if (versionInfo != null) {
      _result.versionInfo = versionInfo;
    }
    return _result;
  }
  factory AndroidCheckinResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AndroidCheckinResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AndroidCheckinResponse clone() =>
      AndroidCheckinResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AndroidCheckinResponse copyWith(
          void Function(AndroidCheckinResponse) updates) =>
      super.copyWith((message) => updates(message as AndroidCheckinResponse))
          as AndroidCheckinResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AndroidCheckinResponse create() => AndroidCheckinResponse._();
  AndroidCheckinResponse createEmptyInstance() => create();
  static $pb.PbList<AndroidCheckinResponse> createRepeated() =>
      $pb.PbList<AndroidCheckinResponse>();
  @$core.pragma('dart2js:noInline')
  static AndroidCheckinResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AndroidCheckinResponse>(create);
  static AndroidCheckinResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get statsOk => $_getBF(0);
  @$pb.TagNumber(1)
  set statsOk($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatsOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatsOk() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timeMsec => $_getI64(1);
  @$pb.TagNumber(3)
  set timeMsec($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimeMsec() => $_has(1);
  @$pb.TagNumber(3)
  void clearTimeMsec() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get digest => $_getSZ(2);
  @$pb.TagNumber(4)
  set digest($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDigest() => $_has(2);
  @$pb.TagNumber(4)
  void clearDigest() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<GservicesSetting> get setting => $_getList(3);

  @$pb.TagNumber(6)
  $core.bool get marketOk => $_getBF(4);
  @$pb.TagNumber(6)
  set marketOk($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMarketOk() => $_has(4);
  @$pb.TagNumber(6)
  void clearMarketOk() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get androidId => $_getI64(5);
  @$pb.TagNumber(7)
  set androidId($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAndroidId() => $_has(5);
  @$pb.TagNumber(7)
  void clearAndroidId() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get securityToken => $_getI64(6);
  @$pb.TagNumber(8)
  set securityToken($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSecurityToken() => $_has(6);
  @$pb.TagNumber(8)
  void clearSecurityToken() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get settingsDiff => $_getBF(7);
  @$pb.TagNumber(9)
  set settingsDiff($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSettingsDiff() => $_has(7);
  @$pb.TagNumber(9)
  void clearSettingsDiff() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get deleteSetting => $_getList(8);

  @$pb.TagNumber(11)
  $core.String get versionInfo => $_getSZ(9);
  @$pb.TagNumber(11)
  set versionInfo($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVersionInfo() => $_has(9);
  @$pb.TagNumber(11)
  void clearVersionInfo() => clearField(11);
}
