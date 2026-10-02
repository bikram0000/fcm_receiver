///
//  Generated code. Do not modify.
//  source: assets/proto/android_checkin.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deviceTypeDescriptor instead')
const DeviceType$json = const {
  '1': 'DeviceType',
  '2': const [
    const {'1': 'DEVICE_ANDROID_OS', '2': 1},
    const {'1': 'DEVICE_IOS_OS', '2': 2},
    const {'1': 'DEVICE_CHROME_BROWSER', '2': 3},
    const {'1': 'DEVICE_CHROME_OS', '2': 4},
  ],
};

/// Descriptor for `DeviceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceTypeDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VUeXBlEhUKEURFVklDRV9BTkRST0lEX09TEAESEQoNREVWSUNFX0lPU19PUxACEhkKFURFVklDRV9DSFJPTUVfQlJPV1NFUhADEhQKEERFVklDRV9DSFJPTUVfT1MQBA==');
@$core.Deprecated('Use chromeBuildProtoDescriptor instead')
const ChromeBuildProto$json = const {
  '1': 'ChromeBuildProto',
  '2': const [
    const {
      '1': 'platform',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.checkin_proto.ChromeBuildProto.Platform',
      '10': 'platform'
    },
    const {
      '1': 'chrome_version',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'chromeVersion'
    },
    const {
      '1': 'channel',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.checkin_proto.ChromeBuildProto.Channel',
      '10': 'channel'
    },
  ],
  '4': const [ChromeBuildProto_Platform$json, ChromeBuildProto_Channel$json],
};

@$core.Deprecated('Use chromeBuildProtoDescriptor instead')
const ChromeBuildProto_Platform$json = const {
  '1': 'Platform',
  '2': const [
    const {'1': 'PLATFORM_WIN', '2': 1},
    const {'1': 'PLATFORM_MAC', '2': 2},
    const {'1': 'PLATFORM_LINUX', '2': 3},
    const {'1': 'PLATFORM_CROS', '2': 4},
    const {'1': 'PLATFORM_IOS', '2': 5},
    const {'1': 'PLATFORM_ANDROID', '2': 6},
  ],
};

@$core.Deprecated('Use chromeBuildProtoDescriptor instead')
const ChromeBuildProto_Channel$json = const {
  '1': 'Channel',
  '2': const [
    const {'1': 'CHANNEL_STABLE', '2': 1},
    const {'1': 'CHANNEL_BETA', '2': 2},
    const {'1': 'CHANNEL_DEV', '2': 3},
    const {'1': 'CHANNEL_CANARY', '2': 4},
    const {'1': 'CHANNEL_UNKNOWN', '2': 5},
  ],
};

/// Descriptor for `ChromeBuildProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chromeBuildProtoDescriptor = $convert.base64Decode(
    'ChBDaHJvbWVCdWlsZFByb3RvEkQKCHBsYXRmb3JtGAEgASgOMiguY2hlY2tpbl9wcm90by5DaHJvbWVCdWlsZFByb3RvLlBsYXRmb3JtUghwbGF0Zm9ybRIlCg5jaHJvbWVfdmVyc2lvbhgCIAEoCVINY2hyb21lVmVyc2lvbhJBCgdjaGFubmVsGAMgASgOMicuY2hlY2tpbl9wcm90by5DaHJvbWVCdWlsZFByb3RvLkNoYW5uZWxSB2NoYW5uZWwifQoIUGxhdGZvcm0SEAoMUExBVEZPUk1fV0lOEAESEAoMUExBVEZPUk1fTUFDEAISEgoOUExBVEZPUk1fTElOVVgQAxIRCg1QTEFURk9STV9DUk9TEAQSEAoMUExBVEZPUk1fSU9TEAUSFAoQUExBVEZPUk1fQU5EUk9JRBAGImkKB0NoYW5uZWwSEgoOQ0hBTk5FTF9TVEFCTEUQARIQCgxDSEFOTkVMX0JFVEEQAhIPCgtDSEFOTkVMX0RFVhADEhIKDkNIQU5ORUxfQ0FOQVJZEAQSEwoPQ0hBTk5FTF9VTktOT1dOEAU=');
@$core.Deprecated('Use androidCheckinProtoDescriptor instead')
const AndroidCheckinProto$json = const {
  '1': 'AndroidCheckinProto',
  '2': const [
    const {
      '1': 'last_checkin_msec',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'lastCheckinMsec'
    },
    const {'1': 'cell_operator', '3': 6, '4': 1, '5': 9, '10': 'cellOperator'},
    const {'1': 'sim_operator', '3': 7, '4': 1, '5': 9, '10': 'simOperator'},
    const {'1': 'roaming', '3': 8, '4': 1, '5': 9, '10': 'roaming'},
    const {'1': 'user_number', '3': 9, '4': 1, '5': 5, '10': 'userNumber'},
    const {
      '1': 'type',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.checkin_proto.DeviceType',
      '7': 'DEVICE_ANDROID_OS',
      '10': 'type'
    },
    const {
      '1': 'chrome_build',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.checkin_proto.ChromeBuildProto',
      '10': 'chromeBuild'
    },
  ],
};

/// Descriptor for `AndroidCheckinProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List androidCheckinProtoDescriptor = $convert.base64Decode(
    'ChNBbmRyb2lkQ2hlY2tpblByb3RvEioKEWxhc3RfY2hlY2tpbl9tc2VjGAIgASgDUg9sYXN0Q2hlY2tpbk1zZWMSIwoNY2VsbF9vcGVyYXRvchgGIAEoCVIMY2VsbE9wZXJhdG9yEiEKDHNpbV9vcGVyYXRvchgHIAEoCVILc2ltT3BlcmF0b3ISGAoHcm9hbWluZxgIIAEoCVIHcm9hbWluZxIfCgt1c2VyX251bWJlchgJIAEoBVIKdXNlck51bWJlchJACgR0eXBlGAwgASgOMhkuY2hlY2tpbl9wcm90by5EZXZpY2VUeXBlOhFERVZJQ0VfQU5EUk9JRF9PU1IEdHlwZRJCCgxjaHJvbWVfYnVpbGQYDSABKAsyHy5jaGVja2luX3Byb3RvLkNocm9tZUJ1aWxkUHJvdG9SC2Nocm9tZUJ1aWxk');
