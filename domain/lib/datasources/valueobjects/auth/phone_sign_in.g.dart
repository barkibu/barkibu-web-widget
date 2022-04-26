// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sign_in.dart';

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

PhoneSignInRequest _$PhoneSignInRequestFromJson(Map<String, dynamic> json) {
  return PhoneSignInRequest(
    json['phoneNumber'] as String,
    json['phoneNumberPrefix'] as String,
    json['code'] as String,
  );
}

Map<String, dynamic> _$PhoneSignInRequestToJson(PhoneSignInRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneNumberPrefix': instance.phoneNumberPrefix,
      'code': instance.code,
    };
