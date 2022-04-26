import 'package:angular/angular.dart';
import 'package:angular/security.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/home/main_menu_component.dart';
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
  selector: 'home',
  templateUrl: 'home_component.html',
  styleUrls: ['home_component.css'],
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
    MainMenuComponent,
    SafeInnerHtmlDirective
  ],
  exports: [RoutePaths],
)
class HomeComponent implements OnInit {
  final AuthBloc authBloc;
  final WidgetConfiguration _configuration;
  final DomSanitizationService domSanitizationService;
  User currentUser;
  AuthState authState;
  String question;
  Router router;

  HomeComponent(
    this.authBloc,
    this.router,
    this.domSanitizationService,
    this._configuration,
  );

  bool get aivetEnabled => _configuration.aivetEnabled;
  bool get externalProfileDataEnabled => _configuration.externalProfileDataEnabled;

  @override
  void ngOnInit() async {
    authBloc.listen(authStateChangeHandler);
  }

  void authStateChangeHandler(AuthState newState) {
    if (newState is Authenticated) {
      currentUser = newState.user;
    }
    authState = newState;
  }

  bool isUserSignedIn() {
    return authState is Authenticated;
  }

  bool isAuthLoading() {
    return authState is AuthLoading;
  }
}
