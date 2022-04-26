// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneVerificationRequest _$PhoneVerificationRequestFromJson(
    Map<String, dynamic> json) {
  return PhoneVerificationRequest(
    json['phoneNumber'] as String,
    json['phoneNumberPrefix'] as String,
  );
}

Map<String, dynamic> _$PhoneVerificationRequestToJson(
        PhoneVerificationRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneNumberPrefix': instance.phoneNumberPrefix,
    };

PhoneSignUpRequest _$PhoneSignUpRequestFromJson(Map<String, dynamic> json) {
  return PhoneSignUpRequest(
    json['phoneNumber'] as String,
    json['phoneNumberPrefix'] as String,
    json['name'] as String,
    json['code'] as String,
  );
}

Map<String, dynamic> _$PhoneSignUpRequestToJson(PhoneSignUpRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneNumberPrefix': instance.phoneNumberPrefix,
      'name': instance.name,
      'code': instance.code,
    };
