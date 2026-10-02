///
//  Generated code. Do not modify.
//  source: assets/proto/mcs.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ClientEvent_Type extends $pb.ProtobufEnum {
  static const ClientEvent_Type UNKNOWN = ClientEvent_Type._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UNKNOWN');
  static const ClientEvent_Type DISCARDED_EVENTS = ClientEvent_Type._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DISCARDED_EVENTS');
  static const ClientEvent_Type FAILED_CONNECTION = ClientEvent_Type._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'FAILED_CONNECTION');
  static const ClientEvent_Type SUCCESSFUL_CONNECTION = ClientEvent_Type._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SUCCESSFUL_CONNECTION');

  static const $core.List<ClientEvent_Type> values = <ClientEvent_Type>[
    UNKNOWN,
    DISCARDED_EVENTS,
    FAILED_CONNECTION,
    SUCCESSFUL_CONNECTION,
  ];

  static final $core.Map<$core.int, ClientEvent_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ClientEvent_Type? valueOf($core.int value) => _byValue[value];

  const ClientEvent_Type._($core.int v, $core.String n) : super(v, n);
}

class LoginRequest_AuthService extends $pb.ProtobufEnum {
  static const LoginRequest_AuthService ANDROID_ID = LoginRequest_AuthService._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ANDROID_ID');

  static const $core.List<LoginRequest_AuthService> values =
      <LoginRequest_AuthService>[
    ANDROID_ID,
  ];

  static final $core.Map<$core.int, LoginRequest_AuthService> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static LoginRequest_AuthService? valueOf($core.int value) => _byValue[value];

  const LoginRequest_AuthService._($core.int v, $core.String n) : super(v, n);
}

class IqStanza_IqType extends $pb.ProtobufEnum {
  static const IqStanza_IqType GET = IqStanza_IqType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'GET');
  static const IqStanza_IqType SET = IqStanza_IqType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SET');
  static const IqStanza_IqType RESULT = IqStanza_IqType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RESULT');
  static const IqStanza_IqType IQ_ERROR = IqStanza_IqType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'IQ_ERROR');

  static const $core.List<IqStanza_IqType> values = <IqStanza_IqType>[
    GET,
    SET,
    RESULT,
    IQ_ERROR,
  ];

  static final $core.Map<$core.int, IqStanza_IqType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IqStanza_IqType? valueOf($core.int value) => _byValue[value];

  const IqStanza_IqType._($core.int v, $core.String n) : super(v, n);
}
