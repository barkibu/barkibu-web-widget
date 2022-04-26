import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_flow.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/nutribot/nutribot_chat_message_type.dart';

part 'chat_viewmodel.g.dart';

enum ChatViewModelType {
  input,
  output,
  loading,
}

enum ChatViewModelAction {
  openReport,
  reOpenReport,
}

enum ChatButtonOptionType {
  askAnotherQuestion,
  talkWithAVet,
  openReport,
  schedulePhoneCall,
  sendEmail,
  personalRecommendations,
  backHome,
  goBack,
  noThanks,
}

abstract class ChatViewModel {
  ChatViewModel();

  ChatViewModelType get type;

  factory ChatViewModel.emptyViewModel() => EmptyChatViewModel();

  factory ChatViewModel.message(bool me, String message, {bool editable = false}) => MessageChatViewModel((b) => b
    ..me = me
    ..message = message
    ..editable = editable);

  factory ChatViewModel.image(bool me, String mediaUrl) => ImageChatViewModel((b) => b
    ..me = me
    ..mediaUrl = mediaUrl);

  factory ChatViewModel.messageWithHelp(
          {String message, String helpTitle, String helpContent, Map<String, String> data}) =>
      MessageWithHelpChatViewModel((b) => b
        ..me = false
        ..message = message
        ..helpTitle = helpTitle
        ..helpContent = helpContent);

  factory ChatViewModel.messageTypeWithHelp(
          {bool me, PetHealthChatMessageType messageType, Map<String, String> data}) =>
      MessageWithHelpTypeChatViewModel<PetHealthChatMessageType>((b) => b
        ..me = me
        ..messageType = messageType
        ..data = data);

  factory ChatViewModel.messageType(
      bool me, dynamic messageType, Map<String, String> data, dynamic Function() dataResolver) {
    final builder = (b) => b
      ..me = me
      ..messageType = messageType
      ..data = data
      ..dataResolver = dataResolver;

    if (messageType is PetHealthChatMessageType) {
      return MessageTypeChatViewModel<PetHealthChatMessageType>(builder);
    } else if (messageType is NutribotChatMessageType) {
      return MessageTypeChatViewModel<NutribotChatMessageType>(builder);
    } else if (messageType is ContactVetMessageType) {
      return MessageTypeChatViewModel<ContactVetMessageType>(builder);
    } else if (messageType is ChatWithVetMessageType) {
      return MessageTypeChatViewModel<ChatWithVetMessageType>(builder);
    }
    throw Error();
  }

  factory ChatViewModel.durationMessageType(bool me, MessageChatViewModel messageType, Map<String, String> data) =>
      MessageTypeChatViewModel<MessageChatViewModel>((b) => b
        ..me = me
        ..messageType = messageType
        ..data = data);

  factory ChatViewModel.cards(List<CardViewModel> items, String petName) => CardsListChatViewModel((b) => b
    ..items = items
    ..petName = petName);

  factory ChatViewModel.nutribotRecommendation(dynamic titleType, dynamic descriptionType, dynamic subDescriptionType,
          dynamic data, String recipe, String treats, String petName) =>
      NutribotRecommendationViewModel((b) => b
        ..titleType = titleType
        ..descriptionType = descriptionType
        ..subDescriptionType = subDescriptionType
        ..data = data
        ..recipe = recipe
        ..petName = petName
        ..treats = treats);

  factory ChatViewModel.textInputSimple(ChatFlow chatFlow) {
    return TextInputSimpleChatViewModel((b) => b..chatFlow = chatFlow);
  }

  factory ChatViewModel.textInputCompound(ChatFlow chatFlow) =>
      TextInputCompoundChatViewModel((b) => b..chatFlow = chatFlow);

  factory ChatViewModel.phoneNumberInput(ChatFlow chatFlow) =>
      PhoneNumberInputChatViewModel((b) => b..chatFlow = chatFlow);

  factory ChatViewModel.singleOptions(ChatFlow chatFlow, List<OptionViewModel> items) =>
      SingleOptionsSelectorViewModel((b) => b
        ..chatFlow = chatFlow
        ..items = items);

  factory ChatViewModel.textInputAndSingleOptions(ChatFlow chatFlow, List<OptionViewModel> items) =>
      TextInputAndSingleOptionsSelectorViewModel((b) => b
        ..chatFlow = chatFlow
        ..items = items);

  factory ChatViewModel.multiOptions(ChatFlow chatFlow, List<OptionViewModel> items, int clearAllItemIndex) =>
      MultipleOptionsSelectorViewModel((b) => b
        ..chatFlow = chatFlow
        ..items = items
        ..clearAllItemIndex = clearAllItemIndex);

  factory ChatViewModel.yesNo(ChatFlow chatFlow) => YesNoViewModel((b) => b..chatFlow = chatFlow);

  factory ChatViewModel.ageSelector(ChatFlow chatFlow) => AgeSelectorViewModel((b) => b..chatFlow = chatFlow);

  factory ChatViewModel.breedInput(ChatFlow chatFlow, Map<String, String> data) => BreedSelectorViewModel((b) => b
    ..chatFlow = chatFlow
    ..data = data);

  factory ChatViewModel.yesNoUnknown(ChatFlow chatFlow) => YesNoUnknownViewModel((b) => b..chatFlow = chatFlow);

  factory ChatViewModel.buttonInput(ChatViewModelAction actionType, dynamic Function() dataResolver) =>
      ButtonInputChatViewModel((b) => b
        ..dataResolver = dataResolver
        ..action = actionType);

  factory ChatViewModel.buttonsInput(List<ChatButtonOptionType> items, Map<String, String> data) =>
      ButtonsInputChatViewModel<ChatButtonOptionType>((b) => b
        ..items = items
        ..data = data);
}

abstract class MessageChatViewModel implements ChatViewModel, Built<MessageChatViewModel, MessageChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  bool get me;

  String get message;

  bool get editable;

  MessageChatViewModel._();
  static void _initializeBuilder(MessageChatViewModelBuilder builder) => builder..editable = false;
  factory MessageChatViewModel([void Function(MessageChatViewModelBuilder) updates]) = _$MessageChatViewModel;
}

abstract class ImageChatViewModel implements ChatViewModel, Built<ImageChatViewModel, ImageChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  bool get me;

  String get mediaUrl;

  ImageChatViewModel._();
  factory ImageChatViewModel([void Function(ImageChatViewModelBuilder) updates]) = _$ImageChatViewModel;
}

abstract class MessageWithHelpChatViewModel
    implements ChatViewModel, Built<MessageWithHelpChatViewModel, MessageWithHelpChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  bool get me;

  @nullable
  String get message;

  @nullable
  String get helpTitle;

  @nullable
  String get helpContent;

  MessageWithHelpChatViewModel._();

  factory MessageWithHelpChatViewModel([void Function(MessageWithHelpChatViewModelBuilder) updates]) =
      _$MessageWithHelpChatViewModel;
}

abstract class MessageWithHelpTypeChatViewModel<T>
    implements ChatViewModel, Built<MessageWithHelpTypeChatViewModel<T>, MessageWithHelpTypeChatViewModelBuilder<T>> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  bool get me;

  @nullable
  T get messageType;

  @nullable
  Map<String, String> get data;

  MessageWithHelpTypeChatViewModel._();

  factory MessageWithHelpTypeChatViewModel([void Function(MessageWithHelpTypeChatViewModelBuilder<T>) updates]) =
      _$MessageWithHelpTypeChatViewModel<T>;
}

abstract class MessageTypeChatViewModel<T>
    implements ChatViewModel, Built<MessageTypeChatViewModel<T>, MessageTypeChatViewModelBuilder<T>> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  bool get me;

  T get messageType;

  @nullable
  Map<String, String> get data;

  @nullable
  dynamic Function() get dataResolver;

  MessageTypeChatViewModel._();

  factory MessageTypeChatViewModel([void Function(MessageTypeChatViewModelBuilder<T>) updates]) =
      _$MessageTypeChatViewModel<T>;
}

abstract class CardViewModel implements ChatViewModel, Built<CardViewModel, CardViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  String get title;

  String get description;

  bool get urgent;

  CardViewModel._();

  factory CardViewModel([void Function(CardViewModelBuilder) updates]) = _$CardViewModel;
}

abstract class NutribotRecommendationViewModel
    implements ChatViewModel, Built<NutribotRecommendationViewModel, NutribotRecommendationViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  NutribotChatMessageType get titleType;

  NutribotChatMessageType get descriptionType;

  NutribotChatMessageType get subDescriptionType;

  FoodRecommended get data;

  String get petName;

  String get recipe;

  String get treats;

  NutribotRecommendationViewModel._();

  factory NutribotRecommendationViewModel([void Function(NutribotRecommendationViewModelBuilder) updates]) =
      _$NutribotRecommendationViewModel;
}

abstract class OptionViewModel<T> implements ChatViewModel, Built<OptionViewModel<T>, OptionViewModelBuilder<T>> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  @nullable
  T get key;

  @nullable
  String get description;

  OptionViewModel._();

  factory OptionViewModel([void Function(OptionViewModelBuilder<T>) updates]) = _$OptionViewModel<T>;
}

abstract class CardsListChatViewModel
    implements ChatViewModel, Built<CardsListChatViewModel, CardsListChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  List<CardViewModel> get items;

  String get petName;

  CardsListChatViewModel._();

  factory CardsListChatViewModel([void Function(CardsListChatViewModelBuilder) updates]) = _$CardsListChatViewModel;
}

abstract class TextInputSimpleChatViewModel
    implements ChatViewModel, Built<TextInputSimpleChatViewModel, TextInputSimpleChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  TextInputSimpleChatViewModel._();

  factory TextInputSimpleChatViewModel([void Function(TextInputSimpleChatViewModelBuilder) updates]) =
      _$TextInputSimpleChatViewModel;
}

abstract class TextInputCompoundChatViewModel
    implements ChatViewModel, Built<TextInputCompoundChatViewModel, TextInputCompoundChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  TextInputCompoundChatViewModel._();

  factory TextInputCompoundChatViewModel([void Function(TextInputCompoundChatViewModelBuilder) updates]) =
      _$TextInputCompoundChatViewModel;
}

abstract class PhoneNumberInputChatViewModel
    implements ChatViewModel, Built<PhoneNumberInputChatViewModel, PhoneNumberInputChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  PhoneNumberInputChatViewModel._();

  factory PhoneNumberInputChatViewModel([void Function(PhoneNumberInputChatViewModelBuilder) updates]) =
      _$PhoneNumberInputChatViewModel;
}

abstract class TextInputAndSingleOptionsSelectorViewModel
    implements
        ChatViewModel,
        Built<TextInputAndSingleOptionsSelectorViewModel, TextInputAndSingleOptionsSelectorViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  List<OptionViewModel> get items;

  ChatFlow get chatFlow;

  TextInputAndSingleOptionsSelectorViewModel._();

  factory TextInputAndSingleOptionsSelectorViewModel(
          [void Function(TextInputAndSingleOptionsSelectorViewModelBuilder) updates]) =
      _$TextInputAndSingleOptionsSelectorViewModel;
}

abstract class ButtonChatViewModel extends ChatViewModel {
  ChatViewModelAction get action;

  dynamic Function() get dataResolver;
}

abstract class ButtonInputChatViewModel
    implements Built<ButtonInputChatViewModel, ButtonInputChatViewModelBuilder>, ButtonChatViewModel {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ButtonInputChatViewModel._();

  factory ButtonInputChatViewModel([void Function(ButtonInputChatViewModelBuilder) updates]) =
      _$ButtonInputChatViewModel;
}

abstract class ButtonOutputChatViewModel
    implements Built<ButtonOutputChatViewModel, ButtonOutputChatViewModelBuilder>, ButtonChatViewModel {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  bool get me;

  ButtonOutputChatViewModel._();

  factory ButtonOutputChatViewModel([void Function(ButtonOutputChatViewModelBuilder) updates]) =
      _$ButtonOutputChatViewModel;
}

abstract class ButtonsInputChatViewModel<T>
    implements ChatViewModel, Built<ButtonsInputChatViewModel<T>, ButtonsInputChatViewModelBuilder<T>> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  List<T> get items;

  Map<String, String> get data;

  ButtonsInputChatViewModel._();

  factory ButtonsInputChatViewModel([void Function(ButtonsInputChatViewModelBuilder) updates]) =
      _$ButtonsInputChatViewModel<T>;
}

abstract class SingleOptionsSelectorViewModel
    implements ChatViewModel, Built<SingleOptionsSelectorViewModel, SingleOptionsSelectorViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  List<OptionViewModel> get items;

  ChatFlow get chatFlow;

  SingleOptionsSelectorViewModel._();

  factory SingleOptionsSelectorViewModel([void Function(SingleOptionsSelectorViewModelBuilder) updates]) =
      _$SingleOptionsSelectorViewModel;
}

abstract class MultipleOptionsSelectorViewModel
    implements ChatViewModel, Built<MultipleOptionsSelectorViewModel, MultipleOptionsSelectorViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  List<OptionViewModel> get items;

  @nullable
  int get clearAllItemIndex;

  ChatFlow get chatFlow;

  MultipleOptionsSelectorViewModel._();

  factory MultipleOptionsSelectorViewModel([void Function(MultipleOptionsSelectorViewModelBuilder) updates]) =
      _$MultipleOptionsSelectorViewModel;
}

abstract class YesNoViewModel implements ChatViewModel, Built<YesNoViewModel, YesNoViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  YesNoViewModel._();

  factory YesNoViewModel([void Function(YesNoViewModelBuilder) updates]) = _$YesNoViewModel;
}

abstract class AgeSelectorViewModel implements ChatViewModel, Built<AgeSelectorViewModel, AgeSelectorViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  AgeSelectorViewModel._();

  factory AgeSelectorViewModel([void Function(AgeSelectorViewModelBuilder) updates]) = _$AgeSelectorViewModel;
}

abstract class BreedSelectorViewModel
    implements ChatViewModel, Built<BreedSelectorViewModel, BreedSelectorViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  @nullable
  Map<String, String> get data;

  BreedSelectorViewModel._();

  factory BreedSelectorViewModel([void Function(BreedSelectorViewModelBuilder) updates]) = _$BreedSelectorViewModel;
}

abstract class YesNoUnknownViewModel
    implements ChatViewModel, Built<YesNoUnknownViewModel, YesNoUnknownViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.input;

  ChatFlow get chatFlow;

  YesNoUnknownViewModel._();

  factory YesNoUnknownViewModel([void Function(YesNoUnknownViewModelBuilder) updates]) = _$YesNoUnknownViewModel;
}

/// Empty Chat View Model whose aim is to allow updating the state of the BLoC without actually pushing any new message to the chat
abstract class EmptyChatViewModel implements ChatViewModel, Built<EmptyChatViewModel, EmptyChatViewModelBuilder> {
  @override
  ChatViewModelType get type => ChatViewModelType.output;

  EmptyChatViewModel._();
  factory EmptyChatViewModel([void Function(EmptyChatViewModelBuilder) updates]) = _$EmptyChatViewModel;
}
