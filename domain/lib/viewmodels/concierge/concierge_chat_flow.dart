import 'package:common_barkibu_dart/viewmodels/chat/chat_flow.dart';

abstract class ConciergeChatFlow extends ChatFlow {
  ConciergeChatFlow();

  factory ConciergeChatFlow.inputText() = InputTextConciergeChatFlow;
  factory ConciergeChatFlow.selectOption() = SelectOptionConciergeChatFlow;
}

class InputTextConciergeChatFlow extends ConciergeChatFlow {}

class SelectOptionConciergeChatFlow extends ConciergeChatFlow {}
