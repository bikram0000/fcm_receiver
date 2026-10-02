///
//  Generated code. Do not modify.
//  source: assets/proto/checkin.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use gservicesSettingDescriptor instead')
const GservicesSetting$json = const {
  '1': 'GservicesSetting',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 12, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 2, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `GservicesSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gservicesSettingDescriptor = $convert.base64Decode('ChBHc2VydmljZXNTZXR0aW5nEhIKBG5hbWUYASACKAxSBG5hbWUSFAoFdmFsdWUYAiACKAxSBXZhbHVl');
@$core.Deprecated('Use androidCheckinRequestDescriptor instead')
const AndroidCheckinRequest$json = const {
  '1': 'AndroidCheckinRequest',
  '2': const [
    const {'1': 'imei', '3': 1, '4': 1, '5': 9, '10': 'imei'},
    const {'1': 'meid', '3': 10, '4': 1, '5': 9, '10': 'meid'},
    const {'1': 'mac_addr', '3': 9, '4': 3, '5': 9, '10': 'macAddr'},
    const {'1': 'mac_addr_type', '3': 19, '4': 3, '5': 9, '10': 'macAddrType'},
    const {'1': 'serial_number', '3': 16, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'esn', '3': 17, '4': 1, '5': 9, '10': 'esn'},
    const {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'logging_id', '3': 7, '4': 1, '5': 3, '10': 'loggingId'},
    const {'1': 'digest', '3': 3, '4': 1, '5': 9, '10': 'digest'},
    const {'1': 'locale', '3': 6, '4': 1, '5': 9, '10': 'locale'},
    const {'1': 'checkin', '3': 4, '4': 2, '5': 11, '6': '.checkin_proto.AndroidCheckinProto', '10': 'checkin'},
    const {'1': 'desired_build', '3': 5, '4': 1, '5': 9, '10': 'desiredBuild'},
    const {'1': 'market_checkin', '3': 8, '4': 1, '5': 9, '10': 'marketCheckin'},
    const {'1': 'account_cookie', '3': 11, '4': 3, '5': 9, '10': 'accountCookie'},
    const {'1': 'time_zone', '3': 12, '4': 1, '5': 9, '10': 'timeZone'},
    const {'1': 'security_token', '3': 13, '4': 1, '5': 6, '10': 'securityToken'},
    const {'1': 'version', '3': 14, '4': 1, '5': 5, '10': 'version'},
    const {'1': 'ota_cert', '3': 15, '4': 3, '5': 9, '10': 'otaCert'},
    const {'1': 'fragment', '3': 20, '4': 1, '5': 5, '10': 'fragment'},
    const {'1': 'user_name', '3': 21, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'user_serial_number', '3': 22, '4': 1, '5': 5, '10': 'userSerialNumber'},
  ],
};

/// Descriptor for `AndroidCheckinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List androidCheckinRequestDescriptor = $convert.base64Decode('ChVBbmRyb2lkQ2hlY2tpblJlcXVlc3QSEgoEaW1laRgBIAEoCVIEaW1laRISCgRtZWlkGAogASgJUgRtZWlkEhkKCG1hY19hZGRyGAkgAygJUgdtYWNBZGRyEiIKDW1hY19hZGRyX3R5cGUYEyADKAlSC21hY0FkZHJUeXBlEiMKDXNlcmlhbF9udW1iZXIYECABKAlSDHNlcmlhbE51bWJlchIQCgNlc24YESABKAlSA2VzbhIOCgJpZBgCIAEoA1ICaWQSHQoKbG9nZ2luZ19pZBgHIAEoA1IJbG9nZ2luZ0lkEhYKBmRpZ2VzdBgDIAEoCVIGZGlnZXN0EhYKBmxvY2FsZRgGIAEoCVIGbG9jYWxlEjwKB2NoZWNraW4YBCACKAsyIi5jaGVja2luX3Byb3RvLkFuZHJvaWRDaGVja2luUHJvdG9SB2NoZWNraW4SIwoNZGVzaXJlZF9idWlsZBgFIAEoCVIMZGVzaXJlZEJ1aWxkEiUKDm1hcmtldF9jaGVja2luGAggASgJUg1tYXJrZXRDaGVja2luEiUKDmFjY291bnRfY29va2llGAsgAygJUg1hY2NvdW50Q29va2llEhsKCXRpbWVfem9uZRgMIAEoCVIIdGltZVpvbmUSJQoOc2VjdXJpdHlfdG9rZW4YDSABKAZSDXNlY3VyaXR5VG9rZW4SGAoHdmVyc2lvbhgOIAEoBVIHdmVyc2lvbhIZCghvdGFfY2VydBgPIAMoCVIHb3RhQ2VydBIaCghmcmFnbWVudBgUIAEoBVIIZnJhZ21lbnQSGwoJdXNlcl9uYW1lGBUgASgJUgh1c2VyTmFtZRIsChJ1c2VyX3NlcmlhbF9udW1iZXIYFiABKAVSEHVzZXJTZXJpYWxOdW1iZXI=');
@$core.Deprecated('Use androidCheckinResponseDescriptor instead')
const AndroidCheckinResponse$json = const {
  '1': 'AndroidCheckinResponse',
  '2': const [
    const {'1': 'stats_ok', '3': 1, '4': 2, '5': 8, '10': 'statsOk'},
    const {'1': 'time_msec', '3': 3, '4': 1, '5': 3, '10': 'timeMsec'},
    const {'1': 'digest', '3': 4, '4': 1, '5': 9, '10': 'digest'},
    const {'1': 'settings_diff', '3': 9, '4': 1, '5': 8, '10': 'settingsDiff'},
    const {'1': 'delete_setting', '3': 10, '4': 3, '5': 9, '10': 'deleteSetting'},
    const {'1': 'setting', '3': 5, '4': 3, '5': 11, '6': '.checkin_proto.GservicesSetting', '10': 'setting'},
    const {'1': 'market_ok', '3': 6, '4': 1, '5': 8, '10': 'marketOk'},
    const {'1': 'android_id', '3': 7, '4': 1, '5': 6, '10': 'androidId'},
    const {'1': 'security_token', '3': 8, '4': 1, '5': 6, '10': 'securityToken'},
    const {'1': 'version_info', '3': 11, '4': 1, '5': 9, '10': 'versionInfo'},
  ],
};

/// Descriptor for `AndroidCheckinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List androidCheckinResponseDescriptor = $convert.base64Decode('ChZBbmRyb2lkQ2hlY2tpblJlc3BvbnNlEhkKCHN0YXRzX29rGAEgAigIUgdzdGF0c09rEhsKCXRpbWVfbXNlYxgDIAEoA1IIdGltZU1zZWMSFgoGZGlnZXN0GAQgASgJUgZkaWdlc3QSIwoNc2V0dGluZ3NfZGlmZhgJIAEoCFIMc2V0dGluZ3NEaWZmEiUKDmRlbGV0ZV9zZXR0aW5nGAogAygJUg1kZWxldGVTZXR0aW5nEjkKB3NldHRpbmcYBSADKAsyHy5jaGVja2luX3Byb3RvLkdzZXJ2aWNlc1NldHRpbmdSB3NldHRpbmcSGwoJbWFya2V0X29rGAYgASgIUghtYXJrZXRPaxIdCgphbmRyb2lkX2lkGAcgASgGUglhbmRyb2lkSWQSJQoOc2VjdXJpdHlfdG9rZW4YCCABKAZSDXNlY3VyaXR5VG9rZW4SIQoMdmVyc2lvbl9pbmZvGAsgASgJUgt2ZXJzaW9uSW5mbw==');
