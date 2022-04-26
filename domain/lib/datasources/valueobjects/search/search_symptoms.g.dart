// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_symptoms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSymptomResponse _$SearchSymptomResponseFromJson(
    Map<String, dynamic> json) {
  return SearchSymptomResponse(
    key: json['key'] as String,
    name: json['name'] as String,
    duration: json['duration'] as bool,
    frequency: json['frequency'] as bool,
  );
}

Map<String, dynamic> _$SearchSymptomResponseToJson(
        SearchSymptomResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'duration': instance.duration,
      'frequency': instance.frequency,
    };
