import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'twilio_message.g.dart';

const hideMessageKey = 'hide';
const tmpIdKey = 'tmp_id';
const messageTypeKey = 'type';
const botMessageTypeKey = 'botMessageType';

enum BotMessageType { vetJoined }

// Attribute keys related to Video Stream sharing
const videoSharingKey = 'isVideoRequest';
const videoSharingStatusKey = 'videoSharingStatus';
const videoSharingRoomSidKey = 'roomSid';

abstract class SimpleChatMessage extends ChatViewModel {
  final String body;

  final Map<String, dynamic> attributes;

  bool get me;

  @override
  ChatViewModelType get type;

  SimpleChatMessage(this.body, [this.attributes = const {}]);
}

class SendingChatMessage extends SimpleChatMessage {
  @override
  final String body;

  @override
  final Map<String, dynamic> attributes;

  @override
  ChatViewModelType get type => ChatViewModelType.loading;

  @override
  bool get me => true;

  SendingChatMessage(this.body, this.attributes) : super(body, attributes);
}

class SendingChatMediaMessage extends SimpleChatMessage {
  @override
  final Map<String, dynamic> attributes;

  @override
  bool get me => true;

  @override
  ChatViewModelType get type => ChatViewModelType.loading;

  SendingChatMediaMessage(this.attributes) : super('', attributes);
}

abstract class TwilioMessage implements Built<TwilioMessage, TwilioMessageBuilder>, SimpleChatMessage {
  static Serializer<TwilioMessage> get serializer => _$twilioMessageSerializer;

  String get sid;

  int get index;

  String get author;

  @override
  String get body;

  @override
  Map<String, dynamic> get attributes;

  @nullable
  String get mediaSid;

  @nullable
  String get mediaFilename;

  @nullable
  String get mediaType;

  @nullable
  String get mediaFileUrl;

  bool isVideoRequest() {
    return attributes[videoSharingKey] == true;
  }

  bool isBotMessage() {
    return attributes[messageTypeKey] == 'bot';
  }

  static void _initializeBuilder(TwilioMessageBuilder builder) => builder..me = false;
  static void _finalizeBuilder(TwilioMessageBuilder builder) => builder..type = ChatViewModelType.output;

  TwilioMessage._();
  factory TwilioMessage([void Function(TwilioMessageBuilder) updates]) = _$TwilioMessage;
}
