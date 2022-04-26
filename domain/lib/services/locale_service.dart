import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class LocaleService {
  String currentLocale;
  MessagesModel messagesModel();
}

class LocaleServiceImpl extends LocaleService {
  @override
  String currentLocale;

  LocaleServiceImpl(this.currentLocale);

  @override
  MessagesModel messagesModel() {
    try {
      return ServiceLocator.container<MessagesModel>(instanceName: 'messages_$currentLocale');
    } catch (error) {
      return ServiceLocator.container<MessagesModel>(instanceName: 'messages_default');
    }
  }
}
