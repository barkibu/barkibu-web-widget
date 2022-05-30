import 'package:common_barkibu_dart/messages/homeMessages.i18n.dart';
import 'package:web_widget/messages/tsc/home_messages_tsc.dart';

class HomeMessages_furlife extends HomeMessages_tsc {
  const HomeMessages_furlife();

  @override
  MessagesHomeMessages_furlife get messages => MessagesHomeMessages_furlife(this);
}

class MessagesHomeMessages_furlife extends MessagesHomeMessages_tsc {
  const MessagesHomeMessages_furlife(HomeMessages_furlife _parent) : super(_parent);

  @override
  NutritionMessagesHomeMessages_furlife get nutrition => NutritionMessagesHomeMessages_furlife(this);
}

class NutritionMessagesHomeMessages_furlife extends NutritionMessagesHomeMessages {
  NutritionMessagesHomeMessages_furlife(MessagesHomeMessages _parent) : super(_parent);

  @override
  String get subtitle => 'Get tailored food recommendations for your pet';
}
