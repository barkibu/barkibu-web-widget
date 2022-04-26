// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomResponse _$SymptomResponseFromJson(Map<String, dynamic> json) {
  return SymptomResponse(
    json['key'] as String,
    json['name'] as String,
    json['presence'] as String,
    _$enumDecodeNullable(_$UrgencyEnumMap, json['urgency']),
    json['article'] as String,
  );
}

Map<String, dynamic> _$SymptomResponseToJson(SymptomResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'presence': instance.presence,
      'urgency': _$UrgencyEnumMap[instance.urgency],
      'article': instance.article,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$UrgencyEnumMap = {
  Urgency.low: 'low',
  Urgency.medium: 'medium',
  Urgency.high: 'high',
  Urgency.unknown: 'unknown',
};
