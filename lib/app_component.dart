import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/widget_configuration.dart';

AuthBloc authBlocFactory() => ServiceLocator.container<AuthBloc>();
MessagesModel messagesModelFactory() => ServiceLocator.container<LocaleService>().messagesModel();
NavigationService navigationServiceFactory() => ServiceLocator.container<NavigationService>();
AnalyticsService analyticsServiceFactory() => ServiceLocator.container<AnalyticsService>();

@Component(selector: 'app', templateUrl: 'app_component.html', styleUrls: [
  'app_component.css'
], directives: [
  routerDirectives,
  coreDirectives,
  formDirectives
], providers: [
  FactoryProvider(MessagesModel, messagesModelFactory),
  FactoryProvider(AuthBloc, authBlocFactory),
  FactoryProvider(NavigationService, navigationServiceFactory),
  FactoryProvider(AnalyticsService, analyticsServiceFactory)
], exports: [
  Routes
])
class AppComponent implements OnDestroy, OnInit {
  final AuthBloc authBloc;
  final WidgetConfiguration config;
  final Router router;

  AppComponent(this.authBloc, this.config, this.router);

  @override
  void ngOnInit() {
    document.querySelector('body').dataset = {'theme': config.theme};
    authBloc.add(AppStarted((b) => b
      ..token = config.externalAuthToken
      ..otpToken = config.otpToken));
  }

  @override
  void ngOnDestroy() {
    authBloc.close();
  }
}
