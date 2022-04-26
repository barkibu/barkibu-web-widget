import 'package:json_annotation/json_annotation.dart';

part 'concierge_button_details.g.dart';

enum ConciergeMessageButtonType {
  @JsonValue('payload')
  PAYLOAD,
  @JsonValue('url')
  URL,
}

@JsonSerializable()
class ConciergePayloadButtonDetails {
  final String id;
  final String type;

  ConciergePayloadButtonDetails(this.id, this.type);

  factory ConciergePayloadButtonDetails.fromJson(Map<String, dynamic> json) =>
      _$ConciergePayloadButtonDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ConciergePayloadButtonDetailsToJson(this);
}

@JsonSerializable()
class MessageButtonDefinition {
  final ConciergeMessageButtonType type;
  final String text;

  MessageButtonDefinition(this.type, this.text);

  factory MessageButtonDefinition.fromJson(Map<String, dynamic> json) {
    switch (_$MessageButtonDefinitionFromJson(json).type) {
      case ConciergeMessageButtonType.URL:
        return MessageUrlButtonDefinition.fromJson(json);
      case ConciergeMessageButtonType.PAYLOAD:
      default:
        return MessagePayloadButtonDefinition.fromJson(json);
    }
  }
}

@JsonSerializable()
class MessagePayloadButtonDefinition extends MessageButtonDefinition {
  @override
  final ConciergeMessageButtonType type = ConciergeMessageButtonType.PAYLOAD;

  final ConciergePayloadButtonDetails payload;

  MessagePayloadButtonDefinition(ConciergeMessageButtonType type, String text, this.payload) : super(type, text);
  factory MessagePayloadButtonDefinition.fromJson(Map<String, dynamic> json) =>
      _$MessagePayloadButtonDefinitionFromJson(json);
}

@JsonSerializable()
class MessageUrlButtonDefinition extends MessageButtonDefinition {
  @override
  final ConciergeMessageButtonType type = ConciergeMessageButtonType.URL;

  final String url;
  final String name;

  MessageUrlButtonDefinition(ConciergeMessageButtonType type, String text, this.url, this.name) : super(type, text);
  factory MessageUrlButtonDefinition.fromJson(Map<String, dynamic> json) => _$MessageUrlButtonDefinitionFromJson(json);
}
