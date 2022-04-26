import 'package:common_barkibu_dart/viewmodels/chat/chat_flow.dart';

abstract class ChatWithVetFlow extends ChatFlow {
  ChatWithVetFlow();

  factory ChatWithVetFlow.askFeedback() = AskFeedbackChatWithVetFlow;
}

class AskFeedbackChatWithVetFlow extends ChatWithVetFlow {}
