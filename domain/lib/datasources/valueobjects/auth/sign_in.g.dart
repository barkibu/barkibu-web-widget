// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return SignInRequest(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return SignInResponse(
    json['id'] as int,
    json['firstName'] as String,
    json['lastName'] as String,
    json['email'] as String,
    json['phoneNumber'] as String,
    json['phoneNumberPrefix'] as String,
    json['twilioIdentity'] as String,
  );
}

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberPrefix': instance.phoneNumberPrefix,
      'twilioIdentity': instance.twilioIdentity,
    };
