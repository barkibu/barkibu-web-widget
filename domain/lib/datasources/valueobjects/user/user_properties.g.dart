// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPropertiesResponse _$UserPropertiesResponseFromJson(
    Map<String, dynamic> json) {
  return UserPropertiesResponse(
    json['userId'] as int,
    json['userKBKey'] as String,
    json['catsCount'] as int,
    json['dogsCount'] as int,
    json['consultationsCount'] as int,
    json['createdAt'] as String,
    json['phone'] as String,
    json['email'] as String,
    (json['pets'] as List)
        ?.map((e) => e == null
            ? null
            : PetPropertiesResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserPropertiesResponseToJson(
        UserPropertiesResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userKBKey': instance.userKBKey,
      'catsCount': instance.catsCount,
      'dogsCount': instance.dogsCount,
      'consultationsCount': instance.consultationsCount,
      'createdAt': instance.createdAt,
      'phone': instance.phone,
      'email': instance.email,
      'pets': instance.pets,
    };
