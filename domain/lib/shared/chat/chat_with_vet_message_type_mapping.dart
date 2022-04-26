import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_message_type.dart';

class ChatWithVetMessageTypeMapping {
  static String getMessageByType(
    ChatWithVetMessageType type,
    MessagesModel _messagesModel, {
    Map<String, String> data,
  }) {
    switch (type) {
      case ChatWithVetMessageType.askFeedback:
        return _messagesModel.chatMessages.chatWithVet.askFeedback;
      case ChatWithVetMessageType.positiveFeedbackAnswer:
        return _messagesModel.chatMessages.chatWithVet.positiveFeedback;
      case ChatWithVetMessageType.negativeFeedbackAnswer:
        return _messagesModel.chatMessages.chatWithVet.negativeFeedback;
      case ChatWithVetMessageType.helpNext:
        return _messagesModel.chatMessages.botMessages.nextHelpQuestion;
      case ChatWithVetMessageType.yes:
        return _messagesModel.sharedMessages.yes;
      case ChatWithVetMessageType.no:
        return _messagesModel.sharedMessages.no;
      default:
        return null;
    }
  }
}
