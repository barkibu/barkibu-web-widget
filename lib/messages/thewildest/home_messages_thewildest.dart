import 'package:common_barkibu_dart/messages/homeMessages.i18n.dart';
import 'package:web_widget/messages/tsc/home_messages_tsc.dart';

class HomeMessages_thewildest extends HomeMessages_tsc {
  const HomeMessages_thewildest();

  @override
  MessagesHomeMessages_thewildest get messages => MessagesHomeMessages_thewildest(this);
}

class MessagesHomeMessages_thewildest extends MessagesHomeMessages_tsc {
  const MessagesHomeMessages_thewildest(HomeMessages_thewildest _parent) : super(_parent);

  @override
  AskAVetMessagesHomeMessages_thewildest get askAVet => AskAVetMessagesHomeMessages_thewildest(this);
}

class AskAVetMessagesHomeMessages_thewildest extends AskAVetMessagesHomeMessages {
  AskAVetMessagesHomeMessages_thewildest(MessagesHomeMessages _parent) : super(_parent);

  @override
  String get subtitle => 'Have a question for a veterinarian? Click here to email with a professional';
}