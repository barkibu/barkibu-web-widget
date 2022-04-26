// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelResponse _$ChannelResponseFromJson(Map<String, dynamic> json) {
  return ChannelResponse(
    accessToken: json['accessToken'] as String,
    channelSid: json['channelSid'] as String,
  );
}

Map<String, dynamic> _$ChannelResponseToJson(ChannelResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'channelSid': instance.channelSid,
    };

ActiveChannelResponse _$ActiveChannelResponseFromJson(
    Map<String, dynamic> json) {
  return ActiveChannelResponse(
    accessToken: json['accessToken'] as String,
    channelSid: json['channelSid'] as String,
    consultationId: json['aivetConsultationId'] as String,
    petId: json['petId'] as int,
  );
}

Map<String, dynamic> _$ActiveChannelResponseToJson(
        ActiveChannelResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'channelSid': instance.channelSid,
      'aivetConsultationId': instance.consultationId,
      'petId': instance.petId,
    };
