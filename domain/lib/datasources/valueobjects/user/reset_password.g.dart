// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailRequest _$SendEmailRequestFromJson(Map<String, dynamic> json) {
  return SendEmailRequest(
    json['email'] as String,
  );
}

Map<String, dynamic> _$SendEmailRequestToJson(SendEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

ResetPasswordRequest _$ResetPasswordRequestFromJson(Map<String, dynamic> json) {
  return ResetPasswordRequest(
    json['email'] as String,
    json['passwordResetCode'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'passwordResetCode': instance.passwordResetCode,
      'password': instance.password,
    };
