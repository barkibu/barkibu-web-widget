// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prevention_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreventionEvent _$PreventionEventFromJson(Map<String, dynamic> json) {
  return PreventionEvent(
    id: json['id'] as int,
    petId: json['petId'] as int,
    date: json['date'] as String,
    eventType:
        _$enumDecodeNullable(_$PreventionEventTypeEnumMap, json['eventType']),
    accurate: json['accurate'] as bool,
  );
}

Map<String, dynamic> _$PreventionEventToJson(PreventionEvent instance) =>
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
