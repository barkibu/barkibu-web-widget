import 'package:common_barkibu_dart/messages/homeMessages.i18n.dart';

class HomeMessages_tsc extends HomeMessages {
  const HomeMessages_tsc();

  @override
  MessagesHomeMessages_tsc get messages => MessagesHomeMessages_tsc(this);
}

class MessagesHomeMessages_tsc extends MessagesHomeMessages {
  const MessagesHomeMessages_tsc(HomeMessages_tsc _parent) : super(_parent);

  @override
  String get subtitle => 'How can we help your pet?';
  @override
  String get makeConsultation => 'Pet Health Symptom Checker';
  @override
  String get help => 'Get quick guidance from the Virtual Vet';
}
