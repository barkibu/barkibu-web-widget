// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anamnesis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnamnesisRequest _$AnamnesisRequestFromJson(Map<String, dynamic> json) {
  return AnamnesisRequest(
    json['consultationId'] as String,
    (json['symptoms'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AnamnesisRequestToJson(AnamnesisRequest instance) =>
    <String, dynamic>{
      'symptoms': instance.symptoms,
      'consultationId': instance.consultationId,
    };

SymptomRequest _$SymptomRequestFromJson(Map<String, dynamic> json) {
  return SymptomRequest(
    json['key'] as String,
    json['presence'] as String,
    json['duration'] as String,
    json['frequency'] as String,
  );
}

Map<String, dynamic> _$SymptomRequestToJson(SymptomRequest instance) =>
    <String, dynamic>{
      'key': instance.key,
      'presence': instance.presence,
      'duration': instance.duration,
      'frequency': instance.frequency,
    };

AnamnesisResponse _$AnamnesisResponseFromJson(Map<String, dynamic> json) {
  return AnamnesisResponse(
    json['consultationId'] as String,
    json['shouldStop'] as bool,
    _$enumDecodeNullable(_$UrgencyEnumMap, json['urgency']),
    (json['conditions'] as List)
        ?.map((e) => e == null
            ? null
            : ConditionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['nextQuestion'] == null
        ? null
        : NextQuestionResponse.fromJson(
            json['nextQuestion'] as Map<String, dynamic>),
    json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    (json['invalidSymptoms'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['symptoms'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AnamnesisResponseToJson(AnamnesisResponse instance) =>
    <String, dynamic>{
      'consultationId': instance.consultationId,
      'shouldStop': instance.shouldStop,
      'urgency': _$UrgencyEnumMap[instance.urgency],
      'invalidSymptoms': instance.invalidSymptoms,
      'symptoms': instance.symptoms,
      'conditions': instance.conditions,
      'nextQuestion': instance.nextQuestion,
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

NextQuestionResponse _$NextQuestionResponseFromJson(Map<String, dynamic> json) {
  return NextQuestionResponse(
    json['symptomKey'] as String,
    json['symptomName'] as String,
    json['question'] as String,
    json['hint'] as String,
    json['answersType'] as String,
    json['duration'] as bool,
    json['frequency'] as bool,
    json['urgency'] as bool,
  );
}

Map<String, dynamic> _$NextQuestionResponseToJson(
        NextQuestionResponse instance) =>
    <String, dynamic>{
      'symptomKey': instance.symptomKey,
      'symptomName': instance.symptomName,
      'question': instance.question,
      'hint': instance.hint,
      'answersType': instance.answersType,
      'duration': instance.duration,
      'frequency': instance.frequency,
      'urgency': instance.urgency,
    };
