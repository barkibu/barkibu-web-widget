// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prevention_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreventionEventRequest _$PreventionEventRequestFromJson(
    Map<String, dynamic> json) {
  return PreventionEventRequest(
    json['eventType'] as String,
    json['date'] as String,
    json['accurate'] as bool,
  );
}

Map<String, dynamic> _$PreventionEventRequestToJson(
        PreventionEventRequest instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'date': instance.date,
      'accurate': instance.accurate,
    };

PreventionEventBatchRequest _$PreventionEventBatchRequestFromJson(
    Map<String, dynamic> json) {
  return PreventionEventBatchRequest(
    (json['preventionEvents'] as List)
        ?.map((e) => e == null
            ? null
            : PreventionEventRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PreventionEventBatchRequestToJson(
        PreventionEventBatchRequest instance) =>
    <String, dynamic>{
      'preventionEvents': instance.preventionEvents,
    };

PreventionEventResponse _$PreventionEventResponseFromJson(
    Map<String, dynamic> json) {
  return PreventionEventResponse(
    json['id'] as int,
    json['petId'] as int,
    json['date'] as String,
    _$enumDecodeNullable(_$PreventionEventTypeEnumMap, json['eventType']),
    json['accurate'] as bool,
  );
}

Map<String, dynamic> _$PreventionEventResponseToJson(
        PreventionEventResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'date': instance.date,
      'eventType': _$PreventionEventTypeEnumMap[instance.eventType],
      'accurate': instance.accurate,
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

const _$PreventionEventTypeEnumMap = {
  PreventionEventType.RABIES: 'rabies',
  PreventionEventType.DE_WORMING: 'de_worming',
  PreventionEventType.MULTIVALENT: 'multivalent',
};
