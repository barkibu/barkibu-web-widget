// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_breeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBreedResponse _$SearchBreedResponseFromJson(Map<String, dynamic> json) {
  return SearchBreedResponse(
    json['key'] as String,
    json['breedUuid'] as String,
    json['name'] as String,
    json['size'] as String,
  );
}

Map<String, dynamic> _$SearchBreedResponseToJson(
        SearchBreedResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'breedUuid': instance.breedUuid,
      'name': instance.name,
      'size': instance.size,
    };
