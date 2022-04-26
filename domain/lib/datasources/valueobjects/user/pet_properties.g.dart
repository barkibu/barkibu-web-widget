// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetPropertiesResponse _$PetPropertiesResponseFromJson(
    Map<String, dynamic> json) {
  return PetPropertiesResponse(
    json['id'] as int,
    json['name'] as String,
    json['kbKey'] as String,
    json['species'] as String,
    json['currentPlan'] as String,
    json['currentPlanStarted'] as String,
    json['currentPlanEnds'] as String,
  );
}

Map<String, dynamic> _$PetPropertiesResponseToJson(
        PetPropertiesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kbKey': instance.kbKey,
      'name': instance.name,
      'species': instance.species,
      'currentPlan': instance.currentPlan,
      'currentPlanStarted': instance.currentPlanStarted,
      'currentPlanEnds': instance.currentPlanEnds,
    };
