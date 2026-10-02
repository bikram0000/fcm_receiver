///
//  Generated code. Do not modify.
//  source: assets/proto/android_checkin.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DeviceType extends $pb.ProtobufEnum {
  static const DeviceType DEVICE_ANDROID_OS = DeviceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEVICE_ANDROID_OS');
  static const DeviceType DEVICE_IOS_OS = DeviceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEVICE_IOS_OS');
  static const DeviceType DEVICE_CHROME_BROWSER = DeviceType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEVICE_CHROME_BROWSER');
  static const DeviceType DEVICE_CHROME_OS = DeviceType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEVICE_CHROME_OS');

  static const $core.List<DeviceType> values = <DeviceType> [
    DEVICE_ANDROID_OS,
    DEVICE_IOS_OS,
    DEVICE_CHROME_BROWSER,
    DEVICE_CHROME_OS,
  ];

  static final $core.Map<$core.int, DeviceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DeviceType? valueOf($core.int value) => _byValue[value];

  const DeviceType._($core.int v, $core.String n) : super(v, n);
}

class ChromeBuildProto_Platform extends $pb.ProtobufEnum {
  static const ChromeBuildProto_Platform PLATFORM_WIN = ChromeBuildProto_Platform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_WIN');
  static const ChromeBuildProto_Platform PLATFORM_MAC = ChromeBuildProto_Platform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_MAC');
  static const ChromeBuildProto_Platform PLATFORM_LINUX = ChromeBuildProto_Platform._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_LINUX');
  static const ChromeBuildProto_Platform PLATFORM_CROS = ChromeBuildProto_Platform._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_CROS');
  static const ChromeBuildProto_Platform PLATFORM_IOS = ChromeBuildProto_Platform._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_IOS');
  static const ChromeBuildProto_Platform PLATFORM_ANDROID = ChromeBuildProto_Platform._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_ANDROID');

  static const $core.List<ChromeBuildProto_Platform> values = <ChromeBuildProto_Platform> [
    PLATFORM_WIN,
    PLATFORM_MAC,
    PLATFORM_LINUX,
    PLATFORM_CROS,
    PLATFORM_IOS,
    PLATFORM_ANDROID,
  ];

  static final $core.Map<$core.int, ChromeBuildProto_Platform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChromeBuildProto_Platform? valueOf($core.int value) => _byValue[value];

  const ChromeBuildProto_Platform._($core.int v, $core.String n) : super(v, n);
}

class ChromeBuildProto_Channel extends $pb.ProtobufEnum {
  static const ChromeBuildProto_Channel CHANNEL_STABLE = ChromeBuildProto_Channel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNEL_STABLE');
  static const ChromeBuildProto_Channel CHANNEL_BETA = ChromeBuildProto_Channel._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNEL_BETA');
  static const ChromeBuildProto_Channel CHANNEL_DEV = ChromeBuildProto_Channel._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNEL_DEV');
  static const ChromeBuildProto_Channel CHANNEL_CANARY = ChromeBuildProto_Channel._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNEL_CANARY');
  static const ChromeBuildProto_Channel CHANNEL_UNKNOWN = ChromeBuildProto_Channel._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNEL_UNKNOWN');

  static const $core.List<ChromeBuildProto_Channel> values = <ChromeBuildProto_Channel> [
    CHANNEL_STABLE,
    CHANNEL_BETA,
    CHANNEL_DEV,
    CHANNEL_CANARY,
    CHANNEL_UNKNOWN,
  ];

  static final $core.Map<$core.int, ChromeBuildProto_Channel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChromeBuildProto_Channel? valueOf($core.int value) => _byValue[value];

  const ChromeBuildProto_Channel._($core.int v, $core.String n) : super(v, n);
}

