import 'package:pageloader/html.dart';

import 'chat_message_po.dart';

part 'chat_messages_po.g.dart';

@PageObject()
@CheckTag('chat-messages')
abstract class ChatMessagesPO {
  ChatMessagesPO();
  factory ChatMessagesPO.create(PageLoaderElement context) = $ChatMessagesPO.create;
  factory ChatMessagesPO.lookup(PageLoaderSource context) = $ChatMessagesPO.lookup;

  @ByCss('.message-container.received .message-body')
  List<PageLoaderElement> get _receivedMessages;

  @ByCss('.message-container.sent .message-body')
  List<PageLoaderElement> get _sentMessages;

  @ByCss('.message-symptom-info button')
  PageLoaderElement get _symptomInfoButton;

  @ByCheckTag()
  List<ChatMessagePO> get _messages;

  List<String> receivedMessages() {
    return _receivedMessages.map((messageEl) => messageEl.innerText).toList();
  }

  List<String> sentMessages() {
    return _sentMessages.map((messageEl) => messageEl.innerText).toList();
  }

  void openSymptomInfo() {
    _symptomInfoButton.click();
  }

  void learnMore(String message) {
    _messages.firstWhere((element) => element.hasMessageBody(message)).learnMore();
  }
}
