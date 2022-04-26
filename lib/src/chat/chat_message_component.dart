import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:common_barkibu_dart/shared/chat/chat_message_type_mapping.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/nutribot/nutribot_recommendation_message_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/current_theme.dart';

@Component(
  selector: 'chat-message',
  templateUrl: 'chat_message_component.html',
  directives: [
    coreDirectives,
    NutribotRecommendationMessageComponent,
    IconComponent,
  ],
  providers: [
    ClassProvider(ChatMessageTypeMapping),
  ],
  styleUrls: ['chat_message_component.css'],
)
class ChatMessageComponent extends CurrentTheme {
  @Input()
  ChatViewModel viewModel;

  @Input()
  bool showMessageSource;

  @Input()
  bool isMyMessage;

  final ChatMessageTypeMapping messageTypeMapping;
  final InfoBloc infoBloc;
  final MessagesModel messages;
  final WidgetConfiguration config;
  final AnalyticsService _analyticsService;

  ChatMessageComponent(this.infoBloc, this.messages, this.messageTypeMapping, this.config, this._analyticsService)
      : super(config);

  String messageCssClass() {
    return isMyMessage ? 'sent' : 'received';
  }

  String get appName => config.appName;

  bool get isNutribotRecommendation => viewModel is NutribotRecommendationViewModel;

  String messageRepresentation() {
    if (viewModel is MessageChatViewModel) {
      return (viewModel as MessageChatViewModel).message;
    } else if (viewModel is MessageWithHelpChatViewModel) {
      return (viewModel as MessageWithHelpChatViewModel).message;
    } else if (viewModel is MessageTypeChatViewModel) {
      var model = viewModel as MessageTypeChatViewModel;
      return messageTypeMapping.getMessageByType(model.messageType, data: model.data);
    } else if (viewModel is MessageWithHelpTypeChatViewModel) {
      var model = viewModel as MessageWithHelpTypeChatViewModel;
      return messageTypeMapping.getMessageByType(model.messageType, data: model.data);
    } else if (viewModel is ButtonOutputChatViewModel) {
      switch ((viewModel as ButtonOutputChatViewModel).action) {
        case ChatViewModelAction.reOpenReport:
          {
            return messages.chatMessages.openReport;
          }
        default:
          {
            return (viewModel as ButtonOutputChatViewModel).action.toString();
          }
      }
    } else {
      return viewModel.runtimeType.toString();
    }
  }

  bool get hasSypmtomInfo => viewModel is MessageWithHelpChatViewModel || viewModel is MessageWithHelpTypeChatViewModel;

  void showInfo(ChatViewModel viewModel) {
    if (viewModel is MessageWithHelpChatViewModel) {
      _analyticsService.event.aivet.logVirtualVetSymptomHintOpened();
      infoBloc.add(SymptomInfoOpened(
        name: viewModel.helpTitle,
        description: viewModel.helpContent,
      ));
    } else if (viewModel is MessageWithHelpTypeChatViewModel &&
        viewModel.messageType == PetHealthChatMessageType.selectAgeRange) {
      infoBloc.add(AgeInfoOpened(species: viewModel.data['species']));
    }
  }
}
