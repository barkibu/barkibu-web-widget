import 'package:json_annotation/json_annotation.dart';

enum InteractionType {
  @JsonValue('VoiceInteraction')
  VOICE_INTERACTION,
  @JsonValue('ChatInteraction')
  CHAT_INTERACTION,
  @JsonValue('EmailInteraction')
  EMAIL_INTERACTION,
}

class Interaction {
  final int id;
  final InteractionType type;
  final DateTime createdAt;

  Interaction({
    this.id,
    this.createdAt,
    this.type,
  });
}
