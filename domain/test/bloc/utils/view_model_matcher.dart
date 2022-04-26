import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:test/test.dart';

Matcher hasBotMessageMatcher(type) => predicate(
    (state) =>
        state.chatViewModels.any((viewModel) => viewModel is MessageTypeChatViewModel && viewModel.messageType == type),
    'has bot Message of type: $type');

Matcher botMessageMatcher(type) => predicate(
    (state) =>
        state.viewModel is MessageTypeChatViewModel &&
        (state.viewModel as MessageTypeChatViewModel).messageType == type,
    'is bot Message of type: $type');

Matcher botMessageWithHelpMatcher({String message, String helpTitle, String helpContent}) => predicate(
    (state) =>
        state.viewModel is MessageWithHelpChatViewModel &&
        (state.viewModel as MessageWithHelpChatViewModel).me == false &&
        (state.viewModel as MessageWithHelpChatViewModel).helpTitle == helpTitle &&
        (state.viewModel as MessageWithHelpChatViewModel).helpContent == helpContent &&
        (state.viewModel as MessageWithHelpChatViewModel).message == message,
    'is bot Message: $message');

Matcher botMessageTypeWithHelpMatcher({PetHealthChatMessageType messageType, String helpTitle, String helpContent}) =>
    predicate(
        (state) =>
            state.viewModel is MessageWithHelpTypeChatViewModel &&
            (state.viewModel as MessageWithHelpTypeChatViewModel).me == false &&
            (state.viewModel as MessageWithHelpTypeChatViewModel).messageType == messageType,
        'is bot Message: $messageType');

Matcher ownMessageTypeMatcher(type) => predicate(
    (state) =>
        state.viewModel is MessageTypeChatViewModel &&
        (state.viewModel as MessageTypeChatViewModel).me &&
        (state.viewModel as MessageTypeChatViewModel).messageType == type,
    'is own Message of type: $type');

Matcher ownMessageMatcher(String message) => predicate(
    (state) =>
        state.viewModel is MessageChatViewModel &&
        (state.viewModel as MessageChatViewModel).me &&
        (state.viewModel as MessageChatViewModel).message == message,
    'is own Message: $message');

Matcher vetMessageMatcher(String message) => predicate(
    (state) =>
        state.viewModel is MessageChatViewModel &&
        !(state.viewModel as MessageChatViewModel).me &&
        (state.viewModel as MessageChatViewModel).message == message,
    'is vet Message: $message');

Matcher hasSingleOption(dynamic optionKey) {
  return predicate((state) {
    final viewModel = state.viewModel;
    if (viewModel is SingleOptionsSelectorViewModel) {
      return viewModel.items.map((option) => option.key).contains(optionKey);
    }
    return false;
  }, 'has option $optionKey');
}

Matcher hasViewModel<VM extends ChatViewModel>() {
  return predicate((state) {
    return state.viewModel is VM;
  }, 'has a viewmodel of type $VM');
}
