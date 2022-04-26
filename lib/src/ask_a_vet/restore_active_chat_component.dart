import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/navigation/confirmation_modal_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

ConnectChatUseCase connectChatUseCaseFactory() => ServiceLocator.container<ConnectChatUseCase>();

@Component(
    selector: 'restore-active-chat',
    template: '''
    <confirmation-modal *ngIf="activeConnection != null"
      [title]="modalTitle" [description]="modalDescription" [confirmText]="yesText"
      (onConfirmed)="redirectToAskAVet()"
      (onCanceled)="leaveChannel()">
    </confirmation-modal>
  ''',
    providers: [FactoryProvider(ConnectChatUseCase, connectChatUseCaseFactory)],
    directives: [NgIf, ConfirmationModalComponent])
class RestoreActiveChatCopmonent implements OnInit {
  final MessagesModel messages;
  final ConnectChatUseCase connectUseCase;
  final Router router;
  final WidgetConfiguration config;
  ActiveChatConnection activeConnection;

  RestoreActiveChatCopmonent(this.connectUseCase, this.messages, this.router, this.config);

  @override
  void ngOnInit() async {
    if (config.telehealthEnabled) {
      activeConnection = await connectUseCase.retrieveActiveChatConnection();
    }
  }

  String get modalTitle => messages.chatMessages.chatWithVet.recoverChat.title;
  String get modalDescription => messages.chatMessages.chatWithVet.recoverChat.detail;
  String get yesText => messages.chatMessages.chatWithVet.recoverChat.yes;

  void leaveChannel() {
    final channelSid = activeConnection.channelSid;
    activeConnection.twilio
        .sendMessage(channelSid, messages.chatMessages.chatWithVet.petParentLeftPermanently, {hideMessageKey: true});
    activeConnection.twilio.leaveChannel(channelSid);
    activeConnection = null;
  }

  void redirectToAskAVet() {
    final query = NavigationParams(queryParameters: {'id': activeConnection.consultationId, 'reconnect': 'true'});
    router.navigate(RoutePaths.askAVet.toUrl(), query);
  }
}
