import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/services/twilio.dart';

part 'chat_with_vet_event.g.dart';

abstract class ChatWithVetEvent {}

abstract class ChatWithVetStarted implements Built<ChatWithVetStarted, ChatWithVetStartedBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetStarted> get serializer => _$chatWithVetStartedSerializer;

  @nullable
  String get consultationId;

  @nullable
  String get channelSid;

  @nullable
  TwilioChatService get chatService;

  ChatWithVetStarted._();
  factory ChatWithVetStarted([void Function(ChatWithVetStartedBuilder) updates]) = _$ChatWithVetStarted;
}

abstract class ChatWithVetTextMessageSent extends ChatWithVetEvent {
  String get messageBody;

  bool get showMessage;

  @nullable
  Map<String, dynamic> get attributes;
}

abstract class ChatWithVetMessageSent
    implements Built<ChatWithVetMessageSent, ChatWithVetMessageSentBuilder>, ChatWithVetTextMessageSent {
  static Serializer<ChatWithVetMessageSent> get serializer => _$chatWithVetMessageSentSerializer;

  static void _initializeBuilder(ChatWithVetMessageSentBuilder builder) => builder
    ..attributes = {}
    ..showMessage = true;

  ChatWithVetMessageSent._();
  factory ChatWithVetMessageSent([void Function(ChatWithVetMessageSentBuilder) updates]) = _$ChatWithVetMessageSent;
}

abstract class ChatWithVetBotMessageSent
    implements Built<ChatWithVetBotMessageSent, ChatWithVetBotMessageSentBuilder>, ChatWithVetTextMessageSent {
  static Serializer<ChatWithVetBotMessageSent> get serializer => _$chatWithVetBotMessageSentSerializer;

  static void _initializeBuilder(ChatWithVetBotMessageSentBuilder builder) => builder..attributes = {};
  static void _finalizeBuilder(ChatWithVetBotMessageSentBuilder builder) => builder
    ..attributes[messageTypeKey] = 'bot'
    ..showMessage = false;

  ChatWithVetBotMessageSent._();
  factory ChatWithVetBotMessageSent([void Function(ChatWithVetBotMessageSentBuilder) updates]) =
      _$ChatWithVetBotMessageSent;
}

abstract class ChatWithVetMediaMessageSent
    implements Built<ChatWithVetMediaMessageSent, ChatWithVetMediaMessageSentBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetMediaMessageSent> get serializer => _$chatWithVetMediaMessageSentSerializer;

  String get mediaPath;

  @nullable
  Object get formData;

  String get mimeType;

  @nullable
  Map<String, dynamic> get attributes;

  ChatWithVetMediaMessageSent._();
  factory ChatWithVetMediaMessageSent([void Function(ChatWithVetMediaMessageSentBuilder) updates]) =
      _$ChatWithVetMediaMessageSent;
}

abstract class ChatWithVetMessageReceived
    implements Built<ChatWithVetMessageReceived, ChatWithVetMessageReceivedBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetMessageReceived> get serializer => _$chatWithVetMessageReceivedSerializer;

  TwilioMessage get message;

  ChatWithVetMessageReceived._();
  factory ChatWithVetMessageReceived([void Function(ChatWithVetMessageReceivedBuilder) updates]) =
      _$ChatWithVetMessageReceived;
}

abstract class ChatWithVetMemberTyped
    implements Built<ChatWithVetMemberTyped, ChatWithVetMemberTypedBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetMemberTyped> get serializer => _$chatWithVetMemberTypedSerializer;

  bool get isTyping;
  TwilioMember get member;

  ChatWithVetMemberTyped._();
  factory ChatWithVetMemberTyped([void Function(ChatWithVetMemberTypedBuilder) updates]) = _$ChatWithVetMemberTyped;
}

abstract class ChatWithVetMemberJoined
    implements Built<ChatWithVetMemberJoined, ChatWithVetMemberJoinedBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetMemberJoined> get serializer => _$chatWithVetMemberJoinedSerializer;

  TwilioMember get member;

  ChatWithVetMemberJoined._();
  factory ChatWithVetMemberJoined([void Function(ChatWithVetMemberJoinedBuilder) updates]) = _$ChatWithVetMemberJoined;
}

abstract class ChatWithVetMemberLeft
    implements Built<ChatWithVetMemberLeft, ChatWithVetMemberLeftBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetMemberLeft> get serializer => _$chatWithVetMemberLeftSerializer;

  TwilioMember get member;

  ChatWithVetMemberLeft._();
  factory ChatWithVetMemberLeft([void Function(ChatWithVetMemberLeftBuilder) updates]) = _$ChatWithVetMemberLeft;
}

abstract class ChatWithVetFeedbackPressed
    implements Built<ChatWithVetFeedbackPressed, ChatWithVetFeedbackPressedBuilder>, ChatWithVetEvent {
  static Serializer<ChatWithVetFeedbackPressed> get serializer => _$chatWithVetFeedbackPressedSerializer;

  bool get answer;

  ChatWithVetFeedbackPressed._();
  factory ChatWithVetFeedbackPressed([void Function(ChatWithVetFeedbackPressedBuilder) updates]) =
      _$ChatWithVetFeedbackPressed;
}

class ChatWithVetClosed extends ChatWithVetEvent {}
