// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return UserRequest(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    phoneNumber: json['phoneNumber'] as String,
    phoneNumberPrefix: json['phoneNumberPrefix'] as String,
    avatarUrl: json['avatarUrl'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberPrefix': instance.phoneNumberPrefix,
      'password': instance.password,
      'avatarUrl': instance.avatarUrl,
      'country': instance.country,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    json['id'] as int,
    json['firstName'] as String,
    json['lastName'] as String,
    json['email'] as String,
    json['twilioIdentity'] as String,
    json['phoneNumber'] as String,
    json['phoneNumberPrefix'] as String,
    json['avatarUrl'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberPrefix': instance.phoneNumberPrefix,
      'country': instance.country,
      'avatarUrl': instance.avatarUrl,
      'twilioIdentity': instance.twilioIdentity,
    };
