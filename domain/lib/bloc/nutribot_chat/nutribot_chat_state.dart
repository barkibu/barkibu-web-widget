import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'nutribot_chat_state.g.dart';

abstract class NutribotChatState {
  List<ChatViewModel> get chatViewModels;
  ChatViewModel get input;

  User get user;
  NutribotModel get model;

  Builder toBuilder();
  NutribotChatState rebuild(void Function(dynamic) updates);
}

abstract class NutribotChatInitial
    implements Built<NutribotChatInitial, NutribotChatInitialBuilder>, NutribotChatState {
  static Serializer<NutribotChatInitial> get serializer => _$nutribotChatInitialSerializer;

  @override
  List<ChatViewModel> get chatViewModels;

  @override
  @nullable
  ChatViewModel get input;

  @override
  @nullable
  User get user;

  @override
  NutribotModel get model;

  static void _initializeBuilder(NutribotChatInitialBuilder builder) => builder
    ..chatViewModels = const <ChatViewModel>[]
    ..model = NutribotModel();

  NutribotChatInitial._();
  factory NutribotChatInitial([Function(NutribotChatInitialBuilder builder) updates]) = _$NutribotChatInitial;
}

abstract class NutribotChatFlowUpdated
    implements Built<NutribotChatFlowUpdated, NutribotChatFlowUpdatedBuilder>, NutribotChatState {
  static Serializer<NutribotChatFlowUpdated> get serializer => _$nutribotChatFlowUpdatedSerializer;

  @override
  List<ChatViewModel> get chatViewModels;

  @override
  @nullable
  ChatViewModel get input;

  @override
  @nullable
  User get user;

  @override
  NutribotModel get model;

  NutribotChatFlowUpdated._();
  factory NutribotChatFlowUpdated([Function(NutribotChatFlowUpdatedBuilder builder) updates]) =
      _$NutribotChatFlowUpdated;
}

abstract class NutribotChatInputRequested
    implements Built<NutribotChatInputRequested, NutribotChatInputRequestedBuilder>, NutribotChatState {
  static Serializer<NutribotChatInputRequested> get serializer => _$nutribotChatInputRequestedSerializer;

  @override
  List<ChatViewModel> get chatViewModels;

  @override
  @nullable
  ChatViewModel get input;

  @override
  @nullable
  User get user;

  @override
  NutribotModel get model;

  NutribotChatInputRequested._();
  factory NutribotChatInputRequested([Function(NutribotChatInputRequestedBuilder builder) updates]) =
      _$NutribotChatInputRequested;
}
