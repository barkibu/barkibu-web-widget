import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/datasources/datasources.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:common_barkibu_dart/shared/chat/chat_message_type_mapping.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_streamed_events_control.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

@Component(
    selector: 'chat-select',
    templateUrl: 'chat_select_component.html',
    directives: [coreDirectives, WidgetButtonComponent],
    providers: [ClassProvider(ChatMessageTypeMapping)],
    styleUrls: ['chat_select_component.css'])
class ChatSelectComponent extends ChatStreamedEventsControls<SelectOptionConfirmed> {
  final WidgetConfiguration _config;
  final ChatMessageTypeMapping _messageTypeMapping;
  final ParentWindowService _parentWindow;

  ChatSelectComponent(this._config, this._messageTypeMapping, this._parentWindow);

  @Input('optionsViewModel')
  SingleOptionsSelectorViewModel selectViewModel;

  @Input('textAndOptionsViewModel')
  TextInputAndSingleOptionsSelectorViewModel textAndOptionsViewModel;

  dynamic get viewModel {
    return selectViewModel ?? textAndOptionsViewModel;
  }

  bool get externalLinksEventsEnabled => _config.externalLinksEventsEnabled;

  bool isUrlRedirection(OptionViewModel item) => item.key is MessageUrlButtonDefinition;

  String itemUrl(OptionViewModel item) {
    final option = item.key;
    if (option is MessageUrlButtonDefinition) {
      return option.url;
    }
    return '';
  }

  void confirmSelectedOption(OptionViewModel item) {
    controlEventsController.add(SelectOptionConfirmed(viewModel.chatFlow, item));
  }

  String itemDescription(OptionViewModel item) {
    if (item.key is PetHealthChatMessageType ||
        item.key is NutribotChatMessageType ||
        item.key is ContactVetMessageType) {
      return _mappedMessageType(item);
    } else {
      return item.description;
    }
  }

  String _mappedMessageType(OptionViewModel item) {
    return _messageTypeMapping.getMessageByType(item.key);
  }

  void notifyUrlOption(OptionViewModel item) {
    final option = item.key;
    if (option is MessageUrlButtonDefinition) {
      _parentWindow.notifyRedirectionRequested(option.name, itemUrl(item));
    }
  }
}
