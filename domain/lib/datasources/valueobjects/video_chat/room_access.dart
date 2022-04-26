import 'package:common_barkibu_dart/models/room_access.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_access.g.dart';

@JsonSerializable()
class RoomAccessResponse {
  final String accessToken;
  final String roomSid;

  RoomAccessResponse({
    this.accessToken,
    this.roomSid,
  });

  factory RoomAccessResponse.fromJson(Map<String, dynamic> json) => _$RoomAccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomAccessResponseToJson(this);

  RoomAccess toRoomAccess() => RoomAccess(
        accessToken: accessToken,
        roomSid: roomSid,
      );
}
