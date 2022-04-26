import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_streamed_events_control.dart';
import 'package:web_widget/src/widget_configuration.dart';

import 'dart:html';

import 'package:web_widget/src/widget_window/parent_window_service.dart';

@Component(
  selector: 'chat-phone-input',
  templateUrl: 'chat_phone_input_component.html',
  styleUrls: ['chat_phone_input_component.css'],
  directives: [coreDirectives, formDirectives],
)
class ChatPhoneInputComponent extends ChatStreamedEventsControls<PhoneNumberEntered> {
  final MessagesModel _messagesModel;
  final ParentWindowService _parentWindowService;
  final WidgetConfiguration _config;

  final patternPrefix = AuthData.phonePrefixPattern;
  final patternPhone = AuthData.phonePattern;

  String prefix;
  String phone = '';
  Element element;

  String placeholderPrefix = '+1';
  String placeholderPhone = '000000000';
  @Input('viewModel')
  PhoneNumberInputChatViewModel viewModel;

  bool get externalLinksEventsEnabled => _config.externalLinksEventsEnabled;
  bool get isPhoneValid => phone.isNotEmpty && phone.contains(patternPhone);
  bool get isPrefixValid => prefix.isNotEmpty && prefix.contains(patternPrefix);

  String get prefixInputLabel => _messagesModel.contactMessages.inputs.prefix;
  String get phoneInputLabel => _messagesModel.contactMessages.inputs.phone;
  String get submitAltText => _messagesModel.sharedMessages.altImageText.submit;

  ChatPhoneInputComponent(this.element, this._messagesModel, this._config, this._parentWindowService) {
    prefix = _config.defaultPhonePrefix ?? '';
  }

  void confirmTextEntered() {
    controlEventsController.add(PhoneNumberEntered(viewModel.chatFlow, phone, prefix));
  }

  void notifyPhoneNumberAdded() => _parentWindowService.notifyPhoneNumberAdded(phone);
}
