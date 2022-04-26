// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionResponse _$ConditionResponseFromJson(Map<String, dynamic> json) {
  return ConditionResponse(
    json['key'] as String,
    json['name'] as String,
    _$enumDecodeNullable(_$UrgencyEnumMap, json['urgency']),
    json['article'] as String,
    json['shortDescription'] as String,
    json['diagnosis'] as String,
    json['treatment'] as String,
    json['prevention'] as String,
    json['firstAid'] as String,
    json['predispositionFactors'] as String,
    (json['score'] as num)?.toDouble(),
    json['usualness'] as int,
  );
}

Map<String, dynamic> _$ConditionResponseToJson(ConditionResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'urgency': _$UrgencyEnumMap[instance.urgency],
      'article': instance.article,
      'shortDescription': instance.shortDescription,
      'diagnosis': instance.diagnosis,
      'treatment': instance.treatment,
      'prevention': instance.prevention,
      'firstAid': instance.firstAid,
      'predispositionFactors': instance.predispositionFactors,
      'score': instance.score,
      'usualness': instance.usualness,
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
