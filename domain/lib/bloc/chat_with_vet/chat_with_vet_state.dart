import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/services/services.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'chat_with_vet_state.g.dart';

enum ChatWithVetFailureStatus {
  channelUnavailable,
}

abstract class ChatWithVetState {}

class ChatWithVetInitial extends ChatWithVetState {}

abstract class ChatWithVetAvailabilityCheckInProgress
    implements
        Built<ChatWithVetAvailabilityCheckInProgress, ChatWithVetAvailabilityCheckInProgressBuilder>,
        ChatWithVetState {
  static Serializer<ChatWithVetAvailabilityCheckInProgress> get serializer =>
      _$chatWithVetAvailabilityCheckInProgressSerializer;

  ChatWithVetAvailabilityCheckInProgress._();
  factory ChatWithVetAvailabilityCheckInProgress(
          [void Function(ChatWithVetAvailabilityCheckInProgressBuilder) updates]) =
      _$ChatWithVetAvailabilityCheckInProgress;
}

abstract class ChatWithVetAvailabilityCheckFailure
    implements
        Built<ChatWithVetAvailabilityCheckFailure, ChatWithVetAvailabilityCheckFailureBuilder>,
        ChatWithVetState {
  static Serializer<ChatWithVetAvailabilityCheckFailure> get serializer =>
      _$chatWithVetAvailabilityCheckFailureSerializer;

  TwilioConnectionStatus get connectionStatus;

  ChatWithVetAvailabilityCheckFailure._();
  factory ChatWithVetAvailabilityCheckFailure([void Function(ChatWithVetAvailabilityCheckFailureBuilder) updates]) =
      _$ChatWithVetAvailabilityCheckFailure;
}

abstract class ChatWithVetAvailabilityCheckSuccess
    implements
        Built<ChatWithVetAvailabilityCheckSuccess, ChatWithVetAvailabilityCheckSuccessBuilder>,
        ChatWithVetState {
  static Serializer<ChatWithVetAvailabilityCheckSuccess> get serializer =>
      _$chatWithVetAvailabilityCheckSuccessSerializer;

  String get channelSid;

  ChatWithVetAvailabilityCheckSuccess._();
  factory ChatWithVetAvailabilityCheckSuccess([void Function(ChatWithVetAvailabilityCheckSuccessBuilder) updates]) =
      _$ChatWithVetAvailabilityCheckSuccess;
}

abstract class ChatWithVetListenerBindInProgress
    implements Built<ChatWithVetListenerBindInProgress, ChatWithVetListenerBindInProgressBuilder>, ChatWithVetState {
  static Serializer<ChatWithVetListenerBindInProgress> get serializer => _$chatWithVetListenerBindInProgressSerializer;

  String get channelSid;
  TwilioChatService get chatService;

  ChatWithVetListenerBindInProgress._();
  factory ChatWithVetListenerBindInProgress([void Function(ChatWithVetListenerBindInProgressBuilder) updates]) =
      _$ChatWithVetListenerBindInProgress;
}

abstract class ChatWithVetListenerBindFailure
    implements Built<ChatWithVetListenerBindFailure, ChatWithVetListenerBindFailureBuilder>, ChatWithVetState {
  static Serializer<ChatWithVetListenerBindFailure> get serializer => _$chatWithVetListenerBindFailureSerializer;

  ChatWithVetFailureStatus get status;

  @nullable
  String get details;

  ChatWithVetListenerBindFailure._();
  factory ChatWithVetListenerBindFailure([void Function(ChatWithVetListenerBindFailureBuilder) updates]) =
      _$ChatWithVetListenerBindFailure;
}

abstract class ChatWithVetConnectSuccess
    implements Built<ChatWithVetConnectSuccess, ChatWithVetConnectSuccessBuilder>, ChatWithVetState {
  static Serializer<ChatWithVetConnectSuccess> get serializer => _$chatWithVetConnectSuccessSerializer;

  String get channelSid;
  TwilioChatService get chatService;
  List<TwilioMember> get members;
  List<TwilioMessage> get messages;
  List<SimpleChatMessage> get pendingMessages;
  List<TwilioMember> get typingMembers;

  static void _initializeBuilder(ChatWithVetConnectSuccessBuilder builder) => builder
    ..typingMembers = []
    ..messages = []
    ..pendingMessages = []
    ..members = [];

  ChatWithVetConnectSuccess._();
  factory ChatWithVetConnectSuccess([void Function(ChatWithVetConnectSuccessBuilder) updates]) =
      _$ChatWithVetConnectSuccess;
}

abstract class ChatWithVetTerminateSuccess
    implements Built<ChatWithVetTerminateSuccess, ChatWithVetTerminateSuccessBuilder>, ChatWithVetState {
  static Serializer<ChatWithVetTerminateSuccess> get serializer => _$chatWithVetTerminateSuccessSerializer;

  @nullable
  String get channelSid;
  List<TwilioMessage> get messages;

  List<ChatViewModel> get afterTerminateMessages;

  @nullable
  ChatViewModel get afterTerminateInput;

  static void _initializeBuilder(ChatWithVetTerminateSuccessBuilder builder) => builder
    ..messages = []
    ..afterTerminateMessages = [];

  ChatWithVetTerminateSuccess._();
  factory ChatWithVetTerminateSuccess([void Function(ChatWithVetTerminateSuccessBuilder) updates]) =
      _$ChatWithVetTerminateSuccess;
}
