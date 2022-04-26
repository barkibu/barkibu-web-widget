import 'package:pageloader/html.dart';
import 'video_stream_po.dart';

import 'chat_controls_po.dart';

part 'chat_with_vet_po.g.dart';

@PageObject()
@CheckTag('chat-with-vet')
abstract class ChatWithVetPO {
  ChatWithVetPO();
  factory ChatWithVetPO.create(PageLoaderElement context) = $ChatWithVetPO.create;
  factory ChatWithVetPO.lookup(PageLoaderSource context) = $ChatWithVetPO.lookup;

  @ByCheckTag()
  VideoStreamPO get videoStream;

  @ByCss('.message-container.received .message-body')
  List<PageLoaderElement> get _receivedMessages;

  @ByCss('.message-container.sent .message-body')
  List<PageLoaderElement> get _sentMessages;

  @ByCss('ask-a-vet-system-message .message-container')
  List<PageLoaderElement> get _systemMessages;

  @ByCss('ask-a-vet-text-input input[type="text"]')
  PageLoaderElement get _textInput;

  @ByCss('ask-a-vet-text-input button[type="submit"]')
  PageLoaderElement get _textInputSubmit;

  @ByTagName('ask-a-vet-typing')
  PageLoaderElement get _typingIndicator;

  @ByCheckTag()
  ChatControlsPO get chatControlsPO;

  void typeMessage(String text) async {
    await _textInput.type(text);
  }

  void sendCurrentMessage() async {
    await _textInputSubmit.click();
  }

  List<String> receivedMessages() {
    return _receivedMessages.map((messageEl) => messageEl.innerText).toList();
  }

  List<String> sentMessages() {
    return _sentMessages.map((messageEl) => messageEl.innerText).toList();
  }

  List<String> systemMessages() {
    return _systemMessages.map((messageEl) => messageEl.innerText).toList();
  }

  bool hasTypingMessage(String vetIdentity) {
    return _typingIndicator.innerText.contains('$vetIdentity is typing');
  }

  bool hasNoTypingMessage() {
    return _typingIndicator.innerText.isEmpty;
  }
}
