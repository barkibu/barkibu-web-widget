@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:mockito/mockito.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import '../page_objects/widget_po.dart';
import 'external_profile_data_test.template.dart' as self;
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<http.Response> requestHandler(http.Request request) async {
    if (isCurrentUserRequest(request)) {
      return currentUserResponse;
    } else if (isActiveChatRequest(request)) {
      return activeChatResponse;
    } else {
      return defaultResponse;
    }
  }

  Future<void> initializeApp({bool signIn = true}) async {
    initializeServiceLocator(requestHandler: requestHandler);
    if (signIn) {
      storeAccessToken();
    }
    fixture = await testBed.create();
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  test('Does not show profile on home screen when externalProfileDataEnabled is true', () async {
    await initializeApp();
    when(config.externalProfileDataEnabled).thenReturn(true);
    await fixture.update();
    expect(widgetPO.hasMyPetsLink(), isTrue);
    expect(widgetPO.hasProfileLink(), isFalse);
  });

  test('Does not show sign in/sign up buttons when externalProfileDataEnabled is true', () async {
    await initializeApp(signIn: false);
    when(config.externalProfileDataEnabled).thenReturn(true);
    await fixture.update();
    expect(widgetPO.hasSignInLink(), isFalse);
    expect(widgetPO.hasSignUpLink(), isFalse);
  });
}
