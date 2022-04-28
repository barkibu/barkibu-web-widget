import 'package:common_barkibu_dart/messages/chatMessages.i18n.dart';
import 'package:web_widget/messages/tsc/chat_messages_tsc.dart';

class ChatMessages_thewildest extends ChatMessages_tsc {
  const ChatMessages_thewildest();

  @override
  BotMessagesChatMessages get botMessages => BotMessagesChatMessages_thewildest(this);

  @override
  ChatWithVetChatMessages get chatWithVet => ChatWithVetChatMessages_thewildest(this);
}

class BotMessagesChatMessages_thewildest extends BotMessagesChatMessages_tsc {
  const BotMessagesChatMessages_thewildest(ChatMessages_thewildest _parent) : super(_parent);

  @override
  String get nextHelpQuestion => 'What can we help you with next?';

  @override
  String get channelChoice => 'OK, thanks for that helpful information. \nClick the email button below to begin.';

  @override
  String get optionTalkWithAVetTitle => 'Send another email';

  @override
  String symptomFound(String symptom) => 'Ok, got it. The main symptom is <b>$symptom</b>';

  @override
  String get optionAskAnotherQuestionTitle => 'Close Ask A Vet';
}

class ChatWithVetChatMessages_thewildest extends ChatWithVetChatMessages {
  ChatWithVetChatMessages_thewildest(ChatMessages_thewildest _parent) : super(_parent);

  @override
  String letsConnectEmail(String brandName) =>
      'We’ll get your email started using what you’ve already told us. Please add any extra info you think could be helpful.\n\nOur veterinary team will reply to your email within 24 hours. Click OK continue.';

  @override
  String get initVet =>
      'Welcome to <b>Ask A Vet.</b> If this is an emergency, please go to your local animal hospital or vet clinic right away. \n\nWe’ll start your email in a moment, but first we have a few quick questions to help our team give you the best guidance.';
}