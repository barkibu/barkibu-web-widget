import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
  selector: 'ask-a-vet-text-input',
  templateUrl: 'ask_a_vet_text_input_component.html',
  styleUrls: ['ask_a_vet_text_input_component.css'],
  directives: [coreDirectives, formDirectives],
)
class AskAVetTextInputComponent {
  final MessagesModel messages;
  final WidgetConfiguration _config;

  @Input()
  ChatWithVetBloc chatBloc;

  AskAVetTextInputComponent(this.messages, this._config);

  bool get telehealthMediaSharingEnabled => _config.telehealthMediaSharingEnabled;
  String get label => messages.chatMessages.chatMessageInputHint;
  String get placeholder => messages.chatMessages.chatMessageInputHint;

  void sendMessage(InputElement messageBody) {
    final event = ChatWithVetMessageSent((b) => b
      ..messageBody = messageBody.value
      ..attributes = {});
    chatBloc.add(event);
    messageBody.value = '';
  }

  void uploadFiles(FileUploadInputElement input) {
    input.files.forEach((File file) {
      final formData = FormData()..appendBlob('file', file);
      final event = ChatWithVetMediaMessageSent((b) => b
        ..mimeType = file.type
        ..mediaPath = file.name
        ..formData = formData
        ..attributes = {});
      chatBloc.add(event);
    });
    input.value = null;
  }
}
