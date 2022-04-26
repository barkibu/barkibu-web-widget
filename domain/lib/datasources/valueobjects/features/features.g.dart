// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturesResponse _$FeaturesResponseFromJson(Map<String, dynamic> json) {
  return FeaturesResponse(
    json['telehealth'] as bool,
    json['insurance'] as bool,
  );
}

Map<String, dynamic> _$FeaturesResponseToJson(FeaturesResponse instance) =>
    <String, dynamic>{
      'telehealth': instance.telehealth,
      'insurance': instance.insurance,
    };
