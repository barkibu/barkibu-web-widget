import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/food_recommended.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_flow.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:common_barkibu_dart/viewmodels/nutribot/nutribot_chat_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/pet_health/pet_health_chat_message_type.dart';
import 'package:meta/meta.dart';

class ActionsChat<F extends ChatFlow> {
  final config = ServiceLocator.container<Configuration>();

  Stream<ChatViewModel> botMessageType(dynamic type,
      {Map<String, String> data, dynamic Function() dataResolver}) async* {
    await Future.delayed(Duration(milliseconds: config.botPreMessageDelay));
    yield ChatViewModel.messageType(false, type, data, dataResolver);
    await Future.delayed(Duration(milliseconds: config.botPostMessageDelay));
  }

  Stream<ChatViewModel> botMessage(String text) async* {
    await Future.delayed(Duration(milliseconds: config.botPreMessageDelay));
    yield ChatViewModel.message(false, text);
    await Future.delayed(Duration(milliseconds: config.botPostMessageDelay));
  }

  Stream<ChatViewModel> botMessageWithHelp({
    @required String text,
    @required String helpTitle,
    @required String helpContent,
  }) async* {
    await Future.delayed(Duration(milliseconds: config.botPreMessageDelay));
    yield ChatViewModel.messageWithHelp(message: text, helpTitle: helpTitle, helpContent: helpContent);
    await Future.delayed(Duration(milliseconds: config.botPostMessageDelay));
  }

  Stream<ChatViewModel> botMessageTypeWithHelp({
    @required PetHealthChatMessageType type,
    @required Map<String, String> data,
  }) async* {
    await Future.delayed(Duration(milliseconds: config.botPreMessageDelay));
    yield ChatViewModel.messageTypeWithHelp(me: false, messageType: type, data: data);
    await Future.delayed(Duration(milliseconds: config.botPostMessageDelay));
  }

  ChatViewModel answersTypeInput(F flow, AnswersType type) {
    switch (type) {
      case AnswersType.YesNoUnknown:
      default:
        return yesNoUnknown(flow);
        break;
    }
  }

  ChatViewModel vetMessage(String text) => ChatViewModel.message(false, text);

  ChatViewModel ownMessage(String text) => ChatViewModel.message(true, text);

  ChatViewModel ownMessageType(dynamic type, {Map<String, String> data, dynamic Function() dataResolver}) =>
      ChatViewModel.messageType(true, type, data, dataResolver);

  ChatViewModel ownMessageDurationType(dynamic type, {Map<String, String> data}) =>
      ChatViewModel.durationMessageType(true, type, data);

  ChatViewModel textInputSimple(F flow) => ChatViewModel.textInputSimple(flow);

  ChatViewModel textInputCompound(F flow) => ChatViewModel.textInputCompound(flow);

  ChatViewModel textInputAndSingleOptions(F flow, List<OptionViewModel> items) =>
      ChatViewModel.textInputAndSingleOptions(flow, items);

  ChatViewModel phoneNumberInput(F flow) => ChatViewModel.phoneNumberInput(flow);

  ChatViewModel menuOptions(dynamic values, Map<String, String> data) => buttonsInput(values, data: data);

  ChatViewModel buttonsInput(List<ChatButtonOptionType> options, {Map<String, String> data}) =>
      ChatViewModel.buttonsInput(options, data);

  ChatViewModel buttonInput({ChatViewModelAction action, dynamic Function() dataResolver}) =>
      ChatViewModel.buttonInput(action, dataResolver);

  ChatViewModel singleOptions(F flow, List<OptionViewModel> items) => ChatViewModel.singleOptions(flow, items);

  ChatViewModel multipleOptions(F flow, List<OptionViewModel> items, [int clearAllItemIndex]) =>
      ChatViewModel.multiOptions(flow, items, clearAllItemIndex);

  ChatViewModel yesNo(F flow) => ChatViewModel.yesNo(flow);

  ChatViewModel ageSelector(F flow) => ChatViewModel.ageSelector(flow);

  ChatViewModel breedInput(F flow, {Map<String, String> data}) => ChatViewModel.breedInput(flow, data);

  ChatViewModel yesNoUnknown(F flow) => ChatViewModel.yesNoUnknown(flow);

  ChatViewModel okNoThanks(F flow, List<OptionViewModel> items) => ChatViewModel.singleOptions(flow, items);

  ChatViewModel cards(List<CardViewModel> cards, String petName) => ChatViewModel.cards(cards, petName);

  ChatViewModel nutribotRecommendation(dynamic title, dynamic description, dynamic subDescription, dynamic data,
          String recipe, String treats, String petName) =>
      ChatViewModel.nutribotRecommendation(title, description, subDescription, data, recipe, treats, petName);

  List<NutribotRecommendationViewModel> nutribotRecommendations(List<FoodRecommended> foodRecommendations, Pet pet) {
    return foodRecommendations.asMap().entries.map((foodRecommendationEntry) {
      final food = foodRecommendationEntry.value;
      final isFirst = foodRecommendationEntry.key == 0;
      return nutribotRecommendation(
        isFirst ? NutribotChatMessageType.foodTopRecommended : NutribotChatMessageType.foodOtherOptions,
        isFirst
            ? NutribotChatMessageType.foodTopRecommendedDescription
            : NutribotChatMessageType.foodOtherOptionDescription,
        NutribotChatMessageType.foodTreatsDescription,
        food,
        food.recipe.productName,
        food.treats.map((treat) => '- ${treat.productName} \n').join(),
        pet.name,
      ) as NutribotRecommendationViewModel;
    }).toList();
  }
}
