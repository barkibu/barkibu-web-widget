import 'dart:convert';

import 'package:common_barkibu_dart/datasources/valueobjects/concierge/concierge_button_details.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'concierge_message.g.dart';

enum ConciergeMessageType {
  @JsonValue('event')
  HANDOVER,
  @JsonValue('button')
  BUTTON,
  @JsonValue('image')
  IMAGE,
  @JsonValue('text')
  TEXT,
}

enum HandoverType {
  @JsonValue('virtual_vet')
  virtualVet,
  @JsonValue('pet_definition')
  petDefinition,
  @JsonValue('triage')
  triage,
  @JsonValue('pet_parent_identification')
  petParentIdentification,
}

abstract class ViewModelable {
  ChatViewModel get messageViewModel;
}

@JsonSerializable()
class ConciergeMessage {
  @JsonKey(nullable: true, defaultValue: ConciergeMessageType.TEXT)
  final ConciergeMessageType type;

  ConciergeMessage({this.type});

  Map<String, dynamic> toJson() => _$ConciergeMessageToJson(this);

  factory ConciergeMessage.fromJsonString(String json) => ConciergeMessage.fromJson(jsonDecode(json));

  factory ConciergeMessage.fromJson(Map<String, dynamic> json) {
    switch (_$ConciergeMessageFromJson(json).type) {
      case ConciergeMessageType.HANDOVER:
        return ConciergeHandoverMessage.fromJson(json);
      case ConciergeMessageType.BUTTON:
        return ConciergeButtonsMessage.fromJson(json);
      case ConciergeMessageType.IMAGE:
        return ConciergeImageMessage.fromJson(json);
      case ConciergeMessageType.TEXT:
      default:
        return ConciergeTextMessage.fromJson(json);
    }
  }
}

@JsonSerializable()
class ConciergeHandoverMessage extends ConciergeMessage {
  @override
  final ConciergeMessageType type = ConciergeMessageType.HANDOVER;
  @JsonKey(name: 'name')
  final HandoverType handoverType;
  @JsonKey(nullable: true, fromJson: safeDecode)
  final Map<String, dynamic> payload;

  String get handoverPayload {
    if (handoverType == HandoverType.virtualVet) {
      return payload != null ? payload['userQuestion'] : null;
    }
    return null;
  }

  ConciergeHandoverMessage({this.handoverType, this.payload});

  factory ConciergeHandoverMessage.fromJson(Map<String, dynamic> json) => _$ConciergeHandoverMessageFromJson(json);
}

@JsonSerializable()
class ConciergeImageMessage extends ConciergeMessage implements ViewModelable {
  @override
  final ConciergeMessageType type = ConciergeMessageType.IMAGE;
  @JsonKey(name: 'media_url')
  final String mediaUrl;

  @override
  ChatViewModel get messageViewModel => ChatViewModel.image(false, mediaUrl);

  ConciergeImageMessage({this.mediaUrl});

  factory ConciergeImageMessage.fromJson(Map<String, dynamic> json) => _$ConciergeImageMessageFromJson(json);
}

@JsonSerializable()
class ConciergeTextMessage extends ConciergeMessage implements ViewModelable {
  @override
  final ConciergeMessageType type = ConciergeMessageType.TEXT;
  final String body;

  @override
  ChatViewModel get messageViewModel => ChatViewModel.message(false, body);

  ConciergeTextMessage({this.body});

  factory ConciergeTextMessage.fromJson(Map<String, dynamic> json) => _$ConciergeTextMessageFromJson(json);
}

@JsonSerializable()
class ConciergeButtonsMessage extends ConciergeTextMessage {
  @override
  final ConciergeMessageType type = ConciergeMessageType.BUTTON;
  @override
  final String body;
  final List<MessageButtonDefinition> buttons;

  List<OptionViewModel<MessageButtonDefinition>> get options {
    return buttons
        .map((button) => OptionViewModel<MessageButtonDefinition>((b) => b
          ..key = button
          ..description = button.text))
        .toList();
  }

  ConciergeButtonsMessage(this.body, this.buttons);

  factory ConciergeButtonsMessage.fromJson(Map<String, dynamic> json) => _$ConciergeButtonsMessageFromJson(json);
}

Map<String, dynamic> safeDecode(String string) {
  try {
    return jsonDecode(string);
  } catch (_) {
    return {};
  }
}
