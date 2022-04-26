import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:merge_map/merge_map.dart';

extension ChatViewModelExtension on ChatViewModel {
  Map<String, dynamic> toMap([Map<String, dynamic> options = const {}]) {
    return mergeMap([
      _viewModelInstanceToMap(),
      {'type': type == ChatViewModelType.input ? 'input' : 'output'},
      options,
    ]);
  }

  Map<String, dynamic> _viewModelInstanceToMap() {
    final model = this;

    if (model is MessageChatViewModel) {
      return {'class': 'Message', 'me': model.me, 'message': model.message};
    } else if (model is ImageChatViewModel) {
      return {'class': 'Image', 'me': model.me, 'medial_url': model.mediaUrl};
    } else if (model is MessageWithHelpChatViewModel) {
      return {
        'class': 'MessageWithHelp',
        'me': model.me,
        'message': model.message,
        'help_title': model.helpTitle,
        'help_content': model.helpContent
      };
    } else if (model is MessageWithHelpTypeChatViewModel) {
      return {
        'class': 'MessageWithHelpType',
        'me': model.me,
        'message_type': model.messageType.toString(),
        'payload': model.data,
      };
    } else if (model is MessageTypeChatViewModel) {
      return {
        'class': 'MessageType',
        'me': model.me,
        'message_type': model.messageType.toString(),
        'payload': model.data,
      };
    } else if (model is CardViewModel) {
      return {'class': 'Card', 'title': model.title, 'description': model.description, 'urgent': model.urgent};
    } else if (model is NutribotRecommendationViewModel) {
      return {
        'class': 'NutribotRecommendation',
        'title': model.titleType.toString(),
        'description': model.descriptionType.toString(),
        'payload': model.data.toString(),
      };
    } else if (model is OptionViewModel) {
      return {'class': 'Option', 'description': model.description, 'key': model.key.toString()};
    } else if (model is CardsListChatViewModel) {
      return {'class': 'CardList', 'items': model.items.map((card) => card.toMap()).toList()};
    } else if (model is TextInputSimpleChatViewModel) {
      return {'class': 'TextInput'};
    } else if (model is TextInputCompoundChatViewModel) {
      return {'class': 'TextInputCompound'};
    } else if (model is PhoneNumberInputChatViewModel) {
      return {'class': 'PhoneNumberInput'};
    } else if (model is TextInputAndSingleOptionsSelectorViewModel) {
      return {'class': 'TextInputAndSingleOptionsSelector', 'items': model.items.map((item) => item.toMap()).toList()};
    } else if (model is ButtonInputChatViewModel) {
      final data = model.dataResolver();
      final payload = {};
      if (data is AssessmentIdentificationViewModel) {
        payload['consultationId'] = data.consultationId;
      }
      return {'class': 'ButtonInput', 'action': model.action.toString(), 'payload': payload};
    } else if (model is ButtonOutputChatViewModel) {
      return {'class': 'ButtonOutput', 'me': model.me, 'action': model.action.toString()};
    } else if (model is ButtonsInputChatViewModel) {
      return {'class': 'ButtonsInput', 'items': model.items.map((item) => item.toString()).toList()};
    } else if (model is SingleOptionsSelectorViewModel) {
      return {'class': 'SingleOptionsSelector', 'items': model.items.map((item) => item.toMap()).toList()};
    } else if (model is MultipleOptionsSelectorViewModel) {
      return {'class': 'MultipleOptionsSelector', 'items': model.items.map((item) => item.toMap()).toList()};
    } else if (model is YesNoViewModel) {
      return {'class': 'YesNoSelector'};
    } else if (model is AgeSelectorViewModel) {
      return {'class': 'AgeSelector'};
    } else if (model is BreedSelectorViewModel) {
      return {'class': 'BreedSelector'};
    } else if (model is YesNoUnknownViewModel) {
      return {'class': 'YesNoUnknown'};
    }
    return {'class': 'UnMappedViewModel', 'runtime_type': model.runtimeType.toString()};
  }
}
