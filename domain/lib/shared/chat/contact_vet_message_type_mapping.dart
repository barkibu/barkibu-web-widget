import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';

class ContactVetMessageTypeMapping {
  static String getMessageByType(
    ContactVetMessageType type,
    MessagesModel _messagesModel, {
    Map<String, String> data,
  }) {
    switch (type) {
      case ContactVetMessageType.channelChoice:
        return _messagesModel.chatMessages.botMessages.channelChoice;
      case ContactVetMessageType.email:
        return _messagesModel.sharedMessages.email;
      case ContactVetMessageType.sendEmail:
        return _messagesModel.contactMessages.actions.sendEmail;
      case ContactVetMessageType.videoCall:
        return _messagesModel.sharedMessages.video;
      case ContactVetMessageType.phoneCall:
        return _messagesModel.sharedMessages.phoneCall;
      case ContactVetMessageType.chat:
        return _messagesModel.sharedMessages.chat;
      case ContactVetMessageType.letsConnectChat:
        return _messagesModel.chatMessages.chatWithVet.letsConnectChat;
      case ContactVetMessageType.letsConnectVideoOrPhone:
        return _messagesModel.chatMessages.chatWithVet.letsConnectVideoOrPhone(data['brandName'], data['channel']);
      case ContactVetMessageType.letsConnectVideoOrPhoneInformation:
        return _messagesModel.chatMessages.chatWithVet.letsConnectVideoOrPhoneInformation;
      case ContactVetMessageType.letsConnectEmail:
        return _messagesModel.chatMessages.chatWithVet.letsConnectEmail(data['brandName']);
      case ContactVetMessageType.checkPhoneNumber:
        return _messagesModel.chatMessages.botMessages.checkPhoneNumber(data['phoneNumber']);
      case ContactVetMessageType.emptyPhoneNumber:
        return _messagesModel.chatMessages.botMessages.emptyPhoneNumber;
      case ContactVetMessageType.changePhoneNumber:
        return _messagesModel.chatMessages.botMessages.changePhoneNumber;
      case ContactVetMessageType.noThanks:
        return _messagesModel.sharedMessages.noThanks;
      case ContactVetMessageType.ok:
        return _messagesModel.sharedMessages.ok;
      case ContactVetMessageType.yes:
        return _messagesModel.sharedMessages.yes;
      case ContactVetMessageType.no:
        return _messagesModel.sharedMessages.no;
      default:
        return null;
    }
  }
}
