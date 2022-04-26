import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bloc/bloc.dart';
import 'package:http/browser_client.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/app_component.template.dart' as ng;
import 'package:web_widget/src/twilio/twilio_video_service.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';
import 'package:web_widget/src/analytics/analytics_notifications_service.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_exception_handler.dart';
import 'package:web_widget/src/navigation/navigation_service.dart';
import 'package:web_widget/src/browser_storage/browser_storage.dart';
import 'package:web_widget/src/bloc/simple_bloc_delegate.dart';
import 'package:web_widget/src/twilio/twilio_chat_service.dart';
import 'package:web_widget/messages/messages_model_factory.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash,
  exceptionHandlerModule,
  ClassProvider(ParentWindowService, useClass: ParentWindowServiceImpl)
])
final InjectorFactory injector = self.injector$Injector;

void main() async {
  var config = WidgetConfiguration();

  ServiceLocator.setup(
      configuration: config,
      secureStorage: await BrowserStorage.storageFactory(),
      navigationService: BrowserNavigationService(),
      httpClient: BrowserClient(),
      twilio: TwilioChatServiceImpl(),
      locale: config.locale,
      monitoringServiceFactory: () async => MonitoringServiceImpl(injector().get(ExceptionHandler)),
      messagesModelDefault: clientMessagesFactory(config),
      messagesModelEs: clientMessagesEsFactory(config),
      messagesModelDe: clientMessagesDeFactory(config),
      useLegacyAuthDatasource: config.useLegacyAuthDatasource);
  ServiceLocator.container.registerFactoryParam<TwilioVideoService, TwilioVideoParams, void>(
      (twilioVideoParams, _) => TwilioVideoServiceImpl(twilioVideoParams));

  ServiceLocator.container
      .registerSingleton<AnalyticsService>(AnalyticsNotificationsService(config, ParentWindowServiceImpl()));

  BlocSupervisor.delegate = SimpleBlocDelegate(await ServiceLocator.container.getAsync<MonitoringService>());

  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
