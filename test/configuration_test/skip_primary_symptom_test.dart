@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pageloader/testing.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import '../page_objects/widget_po.dart';
import '../page_objects/chat_po.dart';
import 'skip_primary_symptom_test.template.dart' as self;
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
ChatPO chatPO;
WidgetConfiguration configuration;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory,
  );

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToAiVetChat();
    await fixture.update();
    chatPO = ChatPO.lookup(context);
    configuration = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(configuration.telehealthChatEnabled).thenReturn(true);
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (isCurrentUserRequest(request)) {
        return currentUserResponse;
      }
      if (isPetsListRequest(request)) {
        return petsListResponse;
      }

      if (isSymptomSearchRequest(request)) {
        return symptomSearchResponse;
      }

      if (isActiveChatRequest(request)) {
        return activeChatResponse;
      }
      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
    when(configuration.skipPrimarySymptomEnabled).thenReturn(true);
    when(configuration.telehealthChatEnabled).thenReturn(true);
  });

  test('Allows pet parent to skip symptom definition', () async {
    await chatPO.controls.selectOption('Snoopy');
    await fixture.update();
    await chatPO.controls.enterText('My pet is sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('None of these');
    await fixture.update();
    await chatPO.controls.enterText('I will put it differently: sneezing');
    await fixture.update();
    await chatPO.controls.selectOption('None of these');
    await fixture.update();
    await chatPO.controls.selectOption('Skip: Connect me with a vet now instead');
    await fixture.update();
    await chatPO.controls.selectOption('Chat');
    await fixture.update();
    expect(widgetPO.chatWithVet, exists);
  });
}
