import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/shared/chat/chat_message_type_mapping.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_streamed_events_control.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/form/checkbox_component.dart';

@Component(selector: 'chat-multiple-select', templateUrl: 'chat_multiple_select_component.html', directives: [
  coreDirectives,
  WidgetButtonComponent,
  CheckboxComponent,
], providers: [
  ClassProvider(ChatMessageTypeMapping)
], styleUrls: [
  'chat_multiple_select_component.css'
])
class ChatMultipleSelectComponent extends ChatStreamedEventsControls<MultipleSelectOptionsConfirmed> {
  final ChatMessageTypeMapping _messageTypeMapping;
  final MessagesModel messages;
  List<OptionViewModel> selectedItems = [];

  ChatMultipleSelectComponent(this.messages, this._messageTypeMapping);

  @Input('optionsViewModel')
  MultipleOptionsSelectorViewModel selectViewModel;

  void confirmSelectedOptions() {
    final event = MultipleSelectOptionsConfirmed(selectViewModel.chatFlow, selectedItems);
    controlEventsController.add(event);
  }

  void toggleSelectedOption(bool isSelected, OptionViewModel item) {
    if (isClearAllItem(item) && isSelected) {
      selectedItems = [item];
    } else if (!isSelected) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
      selectedItems.remove(clearAllItem);
    }
  }

  bool isSelected(OptionViewModel item) => selectedItems.contains(item);
  bool isClearAllItem(OptionViewModel item) => item == clearAllItem;

  OptionViewModel get clearAllItem {
    if (selectViewModel.clearAllItemIndex == null || selectViewModel.clearAllItemIndex < 0) {
      return null;
    } else {
      return selectViewModel.items[selectViewModel.clearAllItemIndex];
    }
  }

  String itemDescription(OptionViewModel item) {
    if (item.key is PetHealthChatMessageType || item.key is NutribotChatMessageType) {
      return _mappedMessageType(item);
    } else {
      return item.description;
    }
  }

  String _mappedMessageType(OptionViewModel item) {
    return _messageTypeMapping.getMessageByType(item.key);
  }
}
