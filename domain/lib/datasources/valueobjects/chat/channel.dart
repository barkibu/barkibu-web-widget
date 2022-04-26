import 'package:common_barkibu_dart/models/channel.dart';
import 'package:common_barkibu_dart/models/active_channel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class ChannelResponse {
  final String accessToken;
  final String channelSid;

  ChannelResponse({
    this.accessToken,
    this.channelSid,
  });

  factory ChannelResponse.fromJson(Map<String, dynamic> json) => _$ChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelResponseToJson(this);

  Channel toChannel() => Channel(
        accessToken: accessToken,
        channelSid: channelSid,
        agentsAvailable: true,
      );
}

@JsonSerializable()
class ActiveChannelResponse {
  final String accessToken;
  final String channelSid;
  @JsonKey(name: 'aivetConsultationId')
  final String consultationId;
  final int petId;

  ActiveChannelResponse({
    this.accessToken,
    this.channelSid,
    this.consultationId,
    this.petId,
  });

  factory ActiveChannelResponse.fromJson(Map<String, dynamic> json) => _$ActiveChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveChannelResponseToJson(this);

  ActiveChannel toChannel() => ActiveChannel(
        accessToken: accessToken,
        channelSid: channelSid,
        consultationId: consultationId,
        petId: petId,
      );
}
