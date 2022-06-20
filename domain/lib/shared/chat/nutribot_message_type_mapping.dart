import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/viewmodels/nutribot/nutribot_chat_message_type.dart';

class NutribotMessageTypeMapping {
  static String getMessageByType(
    NutribotChatMessageType type,
    MessagesModel _messagesModel, {
    Map<String, String> data,
  }) {
    switch (type) {
      case NutribotChatMessageType.init:
        return _messagesModel.nutribotMessages.botMessages.init(data['userName']);
      case NutribotChatMessageType.askQuestionsProbeStart:
        return _messagesModel.nutribotMessages.botMessages.askQuestionsProbeStart(data['petName']);
      case NutribotChatMessageType.askWeightManagement:
        return _messagesModel.nutribotMessages.botMessages.isForWeightManagement(data['petName']);
      case NutribotChatMessageType.askIsOutdoor:
        return _messagesModel.nutribotMessages.botMessages.isOutdoor(data['petName']);
      case NutribotChatMessageType.askDullCoatOrDrySkin:
        return _messagesModel.nutribotMessages.botMessages.askDullCoatOrDrySkin(data['petName']);
      case NutribotChatMessageType.askHipJointsIssues:
        return _messagesModel.nutribotMessages.botMessages.askHipJointsIssues(data['petName']);
      case NutribotChatMessageType.askFoodSensitivity:
        return _messagesModel.nutribotMessages.botMessages.askFoodSensitivity(data['petName']);
      case NutribotChatMessageType.askPreferedFoodType:
        return _messagesModel.nutribotMessages.botMessages.askPreferedFoodType(data['petName']);
      case NutribotChatMessageType.askFeedback:
        return _messagesModel.nutribotMessages.botMessages.askFeedback;
      case NutribotChatMessageType.unexpectedError:
        return _messagesModel.nutribotMessages.botMessages.unexpectedError;
      case NutribotChatMessageType.responseNoFoodSensitivity:
        return _messagesModel.nutribotMessages.botMessages.responseNoFoodSensitivity(data['petName']);
      case NutribotChatMessageType.responseFoodSensitivity:
        return _messagesModel.nutribotMessages.botMessages
            .responseFoodSensitivity(data['petName'], data['foodSensitivity']);
      case NutribotChatMessageType.responseFoodSensitivities:
        return _messagesModel.nutribotMessages.botMessages
            .responseFoodSensitivities(data['petName'], data['foodSensitivities'], data['lastFood']);
      case NutribotChatMessageType.noFoodRecommended:
        return _messagesModel.nutribotMessages.botMessages.noFoodRecommended(data['petName']);
      case NutribotChatMessageType.resultsSummary:
        return _messagesModel.nutribotMessages.botMessages.resultsSummary(data['petName']);
      case NutribotChatMessageType.resultsWarning:
        return _messagesModel.nutribotMessages.botMessages.resultsWarning;
      case NutribotChatMessageType.foodTopRecommended:
        return _messagesModel.nutribotMessages.botMessages.foodTopRecommended;
      case NutribotChatMessageType.foodOtherOptions:
        return _messagesModel.nutribotMessages.botMessages.foodOtherOptions;
      case NutribotChatMessageType.foodTopRecommendedDescription:
        return _messagesModel.nutribotMessages.botMessages.foodTopRecommendedDescription(data['productName']);
      case NutribotChatMessageType.foodOtherOptionDescription:
        return _messagesModel.nutribotMessages.botMessages.foodOtherOptionDescription(data['productName']);
      case NutribotChatMessageType.foodTreatsDescription:
        return _messagesModel.nutribotMessages.botMessages.foodTreatsDescription;
      case NutribotChatMessageType.feedbackPositive:
        return _messagesModel.nutribotMessages.botMessages.feedbackPositive;
      case NutribotChatMessageType.feedbackNegative:
        return _messagesModel.nutribotMessages.botMessages.feedbackNegative;
      case NutribotChatMessageType.helpNext:
        return _messagesModel.nutribotMessages.botMessages.helpNext;
      case NutribotChatMessageType.yes:
        return _messagesModel.sharedMessages.yes;
      case NutribotChatMessageType.no:
        return _messagesModel.sharedMessages.no;
      case NutribotChatMessageType.chat:
        return _messagesModel.sharedMessages.chat;
      case NutribotChatMessageType.noThanks:
        return _messagesModel.sharedMessages.noThanks;
      case NutribotChatMessageType.channelChoice:
        return _messagesModel.nutribotMessages.botMessages.channelChoice;
      case NutribotChatMessageType.buyTreat:
        return _messagesModel.nutribotMessages.buyTreat(data['productVendor']);
      default:
        return '';
    }
  }
}
