// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConciergeMessage _$ConciergeMessageFromJson(Map<String, dynamic> json) {
  return ConciergeMessage(
    type: _$enumDecodeNullable(_$ConciergeMessageTypeEnumMap, json['type']) ??
        ConciergeMessageType.TEXT,
  );
}

Map<String, dynamic> _$ConciergeMessageToJson(ConciergeMessage instance) =>
    <String, dynamic>{
      'type': _$ConciergeMessageTypeEnumMap[instance.type],
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

const _$ConciergeMessageTypeEnumMap = {
  ConciergeMessageType.HANDOVER: 'event',
  ConciergeMessageType.BUTTON: 'button',
  ConciergeMessageType.IMAGE: 'image',
  ConciergeMessageType.TEXT: 'text',
};

ConciergeHandoverMessage _$ConciergeHandoverMessageFromJson(
    Map<String, dynamic> json) {
  return ConciergeHandoverMessage(
    handoverType: _$enumDecodeNullable(_$HandoverTypeEnumMap, json['name']),
    payload: safeDecode(json['payload'] as String),
  );
}

Map<String, dynamic> _$ConciergeHandoverMessageToJson(
        ConciergeHandoverMessage instance) =>
    <String, dynamic>{
      'name': _$HandoverTypeEnumMap[instance.handoverType],
      'payload': instance.payload,
    };

const _$HandoverTypeEnumMap = {
  HandoverType.virtualVet: 'virtual_vet',
  HandoverType.petDefinition: 'pet_definition',
  HandoverType.triage: 'triage',
  HandoverType.petParentIdentification: 'pet_parent_identification',
};

ConciergeImageMessage _$ConciergeImageMessageFromJson(
    Map<String, dynamic> json) {
  return ConciergeImageMessage(
    mediaUrl: json['media_url'] as String,
  );
}

Map<String, dynamic> _$ConciergeImageMessageToJson(
        ConciergeImageMessage instance) =>
    <String, dynamic>{
      'media_url': instance.mediaUrl,
    };

ConciergeTextMessage _$ConciergeTextMessageFromJson(Map<String, dynamic> json) {
  return ConciergeTextMessage(
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$ConciergeTextMessageToJson(
        ConciergeTextMessage instance) =>
    <String, dynamic>{
      'body': instance.body,
    };

ConciergeButtonsMessage _$ConciergeButtonsMessageFromJson(
    Map<String, dynamic> json) {
  return ConciergeButtonsMessage(
    json['body'] as String,
    (json['buttons'] as List)
        ?.map((e) => e == null
            ? null
            : MessageButtonDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConciergeButtonsMessageToJson(
        ConciergeButtonsMessage instance) =>
    <String, dynamic>{
      'body': instance.body,
      'buttons': instance.buttons,
    };
