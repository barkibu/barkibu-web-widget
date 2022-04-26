import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/shared/chat/contact_vet_message_type_mapping.dart';
import 'package:common_barkibu_dart/shared/chat/nutribot_message_type_mapping.dart';
import 'package:common_barkibu_dart/shared/chat/pet_health_message_type_mapping.dart';
import 'package:common_barkibu_dart/viewmodels/chat_with_vet/chat_with_vet_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/nutribot/nutribot_chat_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

import 'chat_with_vet_message_type_mapping.dart';

class ChatMessageTypeMapping {
  final MessagesModel _messagesModel;

  ChatMessageTypeMapping(this._messagesModel);

  String getMessageByType(dynamic type, {Map<String, String> data, String defaultValue}) {
    var mapper;

    if (type is PetHealthChatMessageType) {
      mapper = PetHealthMessageTypeMapping.getMessageByType;
    } else if (type is NutribotChatMessageType) {
      mapper = NutribotMessageTypeMapping.getMessageByType;
    } else if (type is ContactVetMessageType) {
      mapper = ContactVetMessageTypeMapping.getMessageByType;
    } else if (type is ChatWithVetMessageType) {
      mapper = ChatWithVetMessageTypeMapping.getMessageByType;
    }

    if (mapper == null && defaultValue == null) throw NullThrownError();
    return mapper?.call(type, _messagesModel, data: data) ?? defaultValue;
  }

  String getTitleByOptionType(ChatButtonOptionType type) =>
      PetHealthMessageTypeMapping.getTitleByOptionType(type, _messagesModel);

  String getModalTitleByType(PetHealthChatMessageType type, {Map<String, String> data}) =>
      PetHealthMessageTypeMapping.getModalTitleByType(type, _messagesModel, data: data);

  String getModalContentByType(PetHealthChatMessageType type, {Map<String, String> data}) =>
      PetHealthMessageTypeMapping.getModalContentByType(type, _messagesModel, data: data);
}
