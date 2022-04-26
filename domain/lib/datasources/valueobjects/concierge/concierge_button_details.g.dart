// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_button_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConciergePayloadButtonDetails _$ConciergePayloadButtonDetailsFromJson(
    Map<String, dynamic> json) {
  return ConciergePayloadButtonDetails(
    json['id'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$ConciergePayloadButtonDetailsToJson(
        ConciergePayloadButtonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

MessageButtonDefinition _$MessageButtonDefinitionFromJson(
    Map<String, dynamic> json) {
  return MessageButtonDefinition(
    _$enumDecodeNullable(_$ConciergeMessageButtonTypeEnumMap, json['type']),
    json['text'] as String,
  );
}

Map<String, dynamic> _$MessageButtonDefinitionToJson(
        MessageButtonDefinition instance) =>
    <String, dynamic>{
      'type': _$ConciergeMessageButtonTypeEnumMap[instance.type],
      'text': instance.text,
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

const _$ConciergeMessageButtonTypeEnumMap = {
  ConciergeMessageButtonType.PAYLOAD: 'payload',
  ConciergeMessageButtonType.URL: 'url',
};

MessagePayloadButtonDefinition _$MessagePayloadButtonDefinitionFromJson(
    Map<String, dynamic> json) {
  return MessagePayloadButtonDefinition(
    _$enumDecodeNullable(_$ConciergeMessageButtonTypeEnumMap, json['type']),
    json['text'] as String,
    json['payload'] == null
        ? null
        : ConciergePayloadButtonDetails.fromJson(
            json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessagePayloadButtonDefinitionToJson(
        MessagePayloadButtonDefinition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$ConciergeMessageButtonTypeEnumMap[instance.type],
      'payload': instance.payload,
    };

MessageUrlButtonDefinition _$MessageUrlButtonDefinitionFromJson(
    Map<String, dynamic> json) {
  return MessageUrlButtonDefinition(
    _$enumDecodeNullable(_$ConciergeMessageButtonTypeEnumMap, json['type']),
    json['text'] as String,
    json['url'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$MessageUrlButtonDefinitionToJson(
        MessageUrlButtonDefinition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$ConciergeMessageButtonTypeEnumMap[instance.type],
      'url': instance.url,
      'name': instance.name,
    };
