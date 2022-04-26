// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return Features(
    telehealth: json['telehealth'] as bool,
    insurance: json['insurance'] as bool,
  );
}

Map<String, dynamic> _$FeaturesToJson(Features instance) => <String, dynamic>{
      'telehealth': instance.telehealth,
      'insurance': instance.insurance,
    };
