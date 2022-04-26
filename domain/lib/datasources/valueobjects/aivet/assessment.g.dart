// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentResponse _$AssessmentResponseFromJson(Map<String, dynamic> json) {
  return AssessmentResponse(
    json['consultationId'] as String,
    json['finished'] as bool,
    _$enumDecodeNullable(_$UrgencyEnumMap, json['urgency']),
    (json['conditions'] as List)
        ?.map((e) => e == null
            ? null
            : ConditionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    (json['symptoms'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AssessmentResponseToJson(AssessmentResponse instance) =>
    <String, dynamic>{
      'consultationId': instance.consultationId,
      'finished': instance.finished,
      'urgency': _$UrgencyEnumMap[instance.urgency],
      'symptoms': instance.symptoms,
      'conditions': instance.conditions,
      'createdAt': instance.createdAt?.toIso8601String(),
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
