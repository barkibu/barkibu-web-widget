import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_streamed_events_control.dart';

import 'dart:html';

@Component(
  selector: 'chat-text-input',
  templateUrl: 'chat_text_input_component.html',
  styleUrls: ['chat_text_input_component.css'],
  directives: [coreDirectives, formDirectives],
)
class ChatTextInputComponent extends ChatStreamedEventsControls<TextEntered> {
  String currentText = '';
  final Element element;
  final MessagesModel messages;

  ChatTextInputComponent(this.element, this.messages);

  @Input('simpleTextViewModel')
  TextInputSimpleChatViewModel simpleTextViewModel;

  @Input('textAndOptionsViewModel')
  TextInputAndSingleOptionsSelectorViewModel textAndOptionsViewModel;

  dynamic get viewModel {
    return simpleTextViewModel ?? textAndOptionsViewModel;
  }

  void confirmTextEntered() {
    controlEventsController.add(TextEntered(viewModel.chatFlow, currentText));
  }

  String get placeholderText {
    if (viewModel.chatFlow is InputSymptomAIVetChatFlow) {
      return messages.chatMessages.symptomInputHint;
    } else if (viewModel.chatFlow is InputPetNamePetDefinitionChatFlow) {
      return messages.chatMessages.petNameInputHint;
    }
    return '';
  }

  String get labelText {
    if (viewModel.chatFlow is InputSymptomAIVetChatFlow) {
      return messages.chatMessages.symptomInputHint;
    } else if (viewModel.chatFlow is InputPetNamePetDefinitionChatFlow) {
      return messages.chatMessages.petNameInputHint;
    }
    return '';
  }
}
