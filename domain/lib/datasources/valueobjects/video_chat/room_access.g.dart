// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomAccessResponse _$RoomAccessResponseFromJson(Map<String, dynamic> json) {
  return RoomAccessResponse(
    accessToken: json['accessToken'] as String,
    roomSid: json['roomSid'] as String,
  );
}

Map<String, dynamic> _$RoomAccessResponseToJson(RoomAccessResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'roomSid': instance.roomSid,
    };
