import 'package:angular/angular.dart';
import 'package:angular/security.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/chat/chat_component.dart';
import 'package:web_widget/src/home/sign_component.dart';

import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/ask_a_vet/restore_active_chat_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
  selector: 'main-menu',
  templateUrl: 'main_menu_component.html',
  styleUrls: ['main_menu_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
    WidgetButtonComponent,
    SpinnerOverlayComponent,
    IconComponent,
    RestoreActiveChatCopmonent,
    layoutDirectives,
    GoBackComponent,
    SignComponent,
    SafeInnerHtmlDirective
  ],
  exports: [RoutePaths],
)
class MainMenuComponent implements OnInit {
  final WidgetConfiguration _configuration;
  final DomSanitizationService domSanitizationService;

  final AnalyticsService _analyticsService;
  MessagesModel messages;
  String question;
  Router router;

  MainMenuComponent(
    this.messages,
    this.router,
    this._configuration,
    this._analyticsService,
    this.domSanitizationService,
  );

  @Input()
  User currentUser;

  String get askAVetUrl => RoutePaths.chat.toUrl(queryParameters: {'chatType': ChatComponent.askAVetFlow});

  bool get findAClinicEnabled => _configuration.findAClinicEnabled;
  bool get nutribotEnabled => _configuration.nutribotEnabled;
  bool get aivetEnabled => _configuration.aivetEnabled;
  bool get askAVetDirectlyEnabled => _configuration.askAVetDirectlyEnabled;
  bool get externalProfileDataEnabled => _configuration.externalProfileDataEnabled;
  String get appName => _configuration.appName;
  String get brandName => _configuration.brandName;
  String get virtualVetInfoAltText {
    return '${messages.homeMessages.messages.virtualVetLearnMoreQuestion} info';
  }

  void logAskAVetStarts() => _analyticsService.event.askAVet.logAskAVetStart('askAVet');
  void logFindClinicOnHome() => _analyticsService.event.clinicFinder.logFindClinicOnHome();

  bool get termsOfServiceHomeEnabled => _configuration.termsOfServiceHomeEnabled;
  bool get virtualVetInfoEnabled => _configuration.virtualVetInfoEnabled;

  void openChat([bool askAVetFlow = false]) {
    var chatUrl = RoutePaths.chat.toUrl();
    final queryParameters = <String, String>{};
    _analyticsService.event.core.logAssistantTabStartsAivet();
    if (askAVetFlow) {
      queryParameters['chatType'] = ChatComponent.askAVetFlow;
    }
    if (question != null && question.isNotEmpty) {
      queryParameters['question'] = question;
    }
    router.navigate(chatUrl, NavigationParams(queryParameters: queryParameters));
  }

  @override
  void ngOnInit() {
    _analyticsService.screen.logMainMenu();
  }

  void navigateEmail() => router.navigate(RoutePaths.emailSender.toUrl());
}
