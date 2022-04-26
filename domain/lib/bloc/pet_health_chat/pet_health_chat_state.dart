import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/shared/chat/aivet_chat_title.dart';

part 'pet_health_chat_state.g.dart';

abstract class PetHealthChatState {
  List<ChatViewModel> get chatViewModels;
  ChatViewModel get input;
  PetHealthChatType get type;
  ChannelType get channelType;
  User get user;
  String get userQuestion;
  bool get isAskAVetComplete;
  bool get isVirtualVetComplete;
  bool get isVideoCallAvailable;
  int get notHappyWithAnswerCount;
  Anamnesis get anamnesisResults;
  AiVetModel get aiVetModel;
  @nullable
  String get lastAssessmentKey;
  @nullable
  int get conditionsShown;
  @nullable
  int get symptomArticlesShown;
  Builder toBuilder();
  PetHealthChatState rebuild(void Function(dynamic) updates);
}

abstract class PetHealthChatInitial
    implements Built<PetHealthChatInitial, PetHealthChatInitialBuilder>, PetHealthChatState {
  static Serializer<PetHealthChatInitial> get serializer => _$petHealthChatInitialSerializer;

  @override
  List<ChatViewModel> get chatViewModels;
  @override
  @nullable
  ChatViewModel get input;
  @override
  PetHealthChatType get type;
  @override
  @nullable
  ChannelType get channelType;
  @override
  @nullable
  User get user;
  @override
  String get userQuestion;

  @override
  bool get isAskAVetComplete;
  @override
  bool get isVirtualVetComplete;
  @override
  bool get isVideoCallAvailable;

  @override
  int get notHappyWithAnswerCount;
  @override
  Anamnesis get anamnesisResults;
  @override
  AiVetModel get aiVetModel;

  static void _initializeBuilder(PetHealthChatInitialBuilder builder) => builder
    ..type = PetHealthChatType.virtualVet
    ..input = null
    ..isAskAVetComplete = false
    ..aiVetModel = AiVetModel()
    ..chatViewModels = const <ChatViewModel>[]
    ..userQuestion = ''
    ..isVideoCallAvailable = false
    ..isVirtualVetComplete = false
    ..anamnesisResults = Anamnesis()
    ..notHappyWithAnswerCount = 0;

  PetHealthChatInitial._();
  factory PetHealthChatInitial([Function(PetHealthChatInitialBuilder builder) updates]) = _$PetHealthChatInitial;
}

abstract class PetHealthChatFlowUpdated
    implements Built<PetHealthChatFlowUpdated, PetHealthChatFlowUpdatedBuilder>, PetHealthChatState {
  static Serializer<PetHealthChatFlowUpdated> get serializer => _$petHealthChatFlowUpdatedSerializer;

  @override
  List<ChatViewModel> get chatViewModels;
  @override
  @nullable
  ChatViewModel get input;
  @override
  PetHealthChatType get type;
  @override
  @nullable
  ChannelType get channelType;
  @override
  @nullable
  User get user;
  @override
  String get userQuestion;

  @override
  bool get isAskAVetComplete;
  @override
  bool get isVirtualVetComplete;
  @override
  bool get isVideoCallAvailable;
  @override
  int get notHappyWithAnswerCount;
  @override
  Anamnesis get anamnesisResults;
  @override
  AiVetModel get aiVetModel;

  PetHealthChatFlowUpdated._();
  factory PetHealthChatFlowUpdated([Function(PetHealthChatFlowUpdatedBuilder builder) updates]) =
      _$PetHealthChatFlowUpdated;

  static void _initializeBuilder(PetHealthChatFlowUpdatedBuilder builder) => builder
    ..type = PetHealthChatType.virtualVet
    ..input = null
    ..isAskAVetComplete = false
    ..aiVetModel = AiVetModel()
    ..chatViewModels = const <ChatViewModel>[]
    ..userQuestion = ''
    ..isVideoCallAvailable = false
    ..isVirtualVetComplete = false
    ..anamnesisResults = Anamnesis()
    ..notHappyWithAnswerCount = 0;
}

abstract class PetHealthChatInputRequested
    implements Built<PetHealthChatInputRequested, PetHealthChatInputRequestedBuilder>, PetHealthChatState {
  static Serializer<PetHealthChatInputRequested> get serializer => _$petHealthChatInputRequestedSerializer;

  @override
  List<ChatViewModel> get chatViewModels;
  @override
  @nullable
  ChatViewModel get input;
  @override
  PetHealthChatType get type;
  @override
  @nullable
  ChannelType get channelType;
  @override
  @nullable
  User get user;
  @override
  String get userQuestion;
  @override
  bool get isAskAVetComplete;
  @override
  bool get isVirtualVetComplete;
  @override
  bool get isVideoCallAvailable;
  @override
  int get notHappyWithAnswerCount;
  @override
  Anamnesis get anamnesisResults;
  @override
  AiVetModel get aiVetModel;

  PetHealthChatInputRequested._();
  factory PetHealthChatInputRequested([Function(PetHealthChatInputRequestedBuilder builder) updates]) =
      _$PetHealthChatInputRequested;

  static void _initializeBuilder(PetHealthChatInputRequestedBuilder builder) => builder
    ..type = PetHealthChatType.virtualVet
    ..isAskAVetComplete = false
    ..aiVetModel = AiVetModel()
    ..chatViewModels = const <ChatViewModel>[]
    ..userQuestion = ''
    ..isVideoCallAvailable = false
    ..isVirtualVetComplete = false
    ..anamnesisResults = Anamnesis()
    ..notHappyWithAnswerCount = 0;
}
