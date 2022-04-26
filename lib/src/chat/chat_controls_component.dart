import 'dart:async';
import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:web_widget/src/chat/chat_age_input_component.dart';
import 'package:web_widget/src/chat/chat_breed_input_component.dart';
import 'package:web_widget/src/chat/chat_phone_input_component.dart';

import 'package:web_widget/src/navigation/spinner_component.dart';
import 'package:web_widget/src/chat/chat_select_component.dart';
import 'package:web_widget/src/chat/chat_multiple_select_component.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_text_input_component.dart';
import 'package:web_widget/src/chat/chat_yes_no_component.dart';
import 'package:web_widget/src/chat/chat_buttons_input_component.dart';
import 'package:web_widget/src/chat/chat_button_input_component.dart';

@Component(
  selector: 'chat-controls',
  templateUrl: 'chat_controls_component.html',
  directives: [
    coreDirectives,
    SpinnerComponent,
    ChatSelectComponent,
    ChatMultipleSelectComponent,
    ChatTextInputComponent,
    ChatYesNoComponent,
    ChatButtonsInputComponent,
    ChatButtonInputComponent,
    ChatPhoneInputComponent,
    ChatAgeInputComponent,
    ChatBreedInputComponent,
  ],
)
class ChatControlsComponent implements OnDestroy {
  final _chatControlStreamController = StreamController<ChatControlEvent>();

  @Output()
  Stream<ChatControlEvent> get onChatControlEvent => _chatControlStreamController.stream;

  @override
  void ngOnDestroy() {
    _chatControlStreamController.close();
  }

  @Input()
  ChatViewModel inputViewModel;

  ChatControlsComponent();

  String get inputModelType {
    if (inputViewModel is SingleOptionsSelectorViewModel) {
      return 'single_options_select';
    } else if (inputViewModel is TextInputSimpleChatViewModel) {
      return 'text_input';
    } else if (inputViewModel is YesNoUnknownViewModel) {
      return 'yes_no_unkown';
    } else if (inputViewModel is YesNoViewModel) {
      return 'yes_no';
    } else if (inputViewModel is TextInputAndSingleOptionsSelectorViewModel) {
      return 'text_input_and_options';
    } else if (inputViewModel is ButtonsInputChatViewModel) {
      return 'buttons_input';
    } else if (inputViewModel is MultipleOptionsSelectorViewModel) {
      return 'multiple_options_select';
    } else if (inputViewModel is ButtonInputChatViewModel) {
      return 'button_input';
    } else if (inputViewModel is PhoneNumberInputChatViewModel) {
      return 'phone_input';
    } else if (inputViewModel is AgeSelectorViewModel) {
      return 'age_input';
    } else if (inputViewModel is BreedSelectorViewModel) {
      return 'breed_input';
    } else {
      return inputViewModel.runtimeType.toString();
    }
  }

  void addEventToContolStream(ChatControlEvent event) {
    _chatControlStreamController.add(event);
  }
}
