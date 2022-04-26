@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'pet_preselection_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
Router router;
final pet = petsListResponseBody[0]['pet'];

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    Future<http.Response> requestHandler(http.Request request) async {
      if (isCurrentUserRequest(request)) {
        return currentUserResponse;
      } else if (isActiveChatRequest(request)) {
        return activeChatResponse;
      } else if (request.url.pathSegments.last == pet['id'].toString() && request.method == 'GET') {
        return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
      } else {
        return defaultResponse;
      }
    }

    await initializeApp(requestHandler);
  });

  test('Allows user to preselect pet for nutribot', () async {
    final query = NavigationParams(queryParameters: {'petId': pet['id'].toString()});
    await router.navigate('/nutribot', query);
    await fixture.update();
    final expectedMessage = 'Does ${pet['name']} have sensitivities to any of these foods?';
    expect(widgetPO.nutribot.messages.receivedMessages(), contains(expectedMessage));
  });

  test('Allows user to preselect pet for ask a vet', () async {
    final params = {'petId': pet['id'].toString(), 'chatType': 'ask_a_vet'};
    final query = NavigationParams(queryParameters: params);
    await router.navigate('/chat', query);
    await fixture.update();
    await fixture.update();
    final expectedMessage = 'What is the primary symptom ${pet['name']} is experiencing?';
    expect(widgetPO.chat.messages.receivedMessages(), contains(expectedMessage));
  });
}
