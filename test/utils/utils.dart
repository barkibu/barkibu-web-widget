export 'mock_platform_location.dart';
export 'injector_probe.dart';
export 'twilio_test_chat_service.dart';
export 'responses.dart';
export 'package:web_widget/src/browser_storage/in_memory_storage.dart';
export 'package:web_widget/src/widget_configuration.dart';
export 'package:web_widget/src/widget_window/parent_window_service.dart';
export 'package:common_barkibu_dart/service_locator.dart';

import 'package:common_barkibu_dart/services/ip_tools_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:bloc/bloc.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/twilio.dart';
import 'package:web_widget/src/bloc/simple_bloc_delegate.dart';
import 'package:web_widget/src/browser_storage/in_memory_storage.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';
import 'mock_ip_tool_service_dart.dart';
import 'mock_monitoring_service.dart';
import 'mock_platform_location.dart';
import 'mock_configuration.dart';
import 'mock_analytics.dart';
import 'mock_twilio_chat.dart';
import 'mock_navigation_service.dart';
import 'mock_parent_window_service.dart';

WidgetConfiguration configurationFactory() => ServiceLocator.container<Configuration>();

const routerProvidersForTesting = [
  ValueProvider.forToken(appBaseHref, '/'),
  routerProviders,
  // Mock platform location even with real router, otherwise sometimes tests hang.
  ClassProvider(PlatformLocation, useClass: MockPlatformLocation),
  FactoryProvider(WidgetConfiguration, configurationFactory),
  ClassProvider(ParentWindowService, useClass: MockParentWindowService),
];

Future<http.Response> noopRequestHandler(http.Request request) async {
  return Future.value(http.Response('', 200));
}

void initializeBlocLogging() {
  BlocSupervisor.delegate = SimpleBlocDelegate(MockMonitoringService());
}

void initializeServiceLocator({MockClientHandler requestHandler, TwilioChatService twilio}) {
  ServiceLocator.container.allowReassignment = true;
  requestHandler ??= noopRequestHandler;
  twilio ??= TwilioChatServiceMock();
  final config = MockConfiguration();

  mockConfigDefaultValues(config);

  ServiceLocator.setup(
    configuration: config,
    secureStorage: InMemoryStorage(),
    navigationService: MockNavigationService(),
    httpClient: MockClient(requestHandler),
    twilio: twilio,
    monitoringServiceFactory: () async => MockMonitoringService(),
  );

  ServiceLocator.container.registerSingleton<AnalyticsService>(AnalyticsServiceMock());
  ServiceLocator.container.registerSingleton<IpToolsService>(IpToolServiceMock());
}

void storeAccessToken({token}) {
  var storage = ServiceLocator.container<SecureStorage>();
  storage.write(SecureStorageKeys.accessToken, token ?? 'token_value');
}
