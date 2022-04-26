@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'reconnect_with_a_vet_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
TwilioTestChatService twilio;
WidgetPO widgetPO;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final consultationId = 'consultatioin_id';
  final petParentIdentiy = 'bob@email.com';
  final accessToken = 'acc3s_token';
  final channelSid = 'channel_sid';
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    twilio = TwilioTestChatService(petParentIdentiy);
    initializeServiceLocator(requestHandler: requestHandler, twilio: twilio);
    storeAccessToken();
    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    router = injector.get<Router>(Router);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    Future<http.Response> successResponseHandler(http.Request request) async {
      if (request.url.pathSegments.last == 'auth') {
        var body = json.encode({
          'user': {'twilioIdentity': petParentIdentiy}
        });
        return Future.value(http.Response(body, 200));
      } else if (request.url.path == '/chats') {
        var body =
            json.encode({'accessToken': accessToken, 'channelSid': channelSid, 'aivetConsultationId': consultationId});
        return Future.value(http.Response(body, 200));
      }
      return defaultResponse;
    }

    await initializeApp(successResponseHandler);
  });

  test('Reconnecting with a vet', () async {
    expect(widgetPO.confirmationModal, exists);
    expect(widgetPO.confirmationModal.title, 'Continue previous chat');
    expect(widgetPO.confirmationModal.description,
        'You were in the middle of a chat with a vet, do you want to continue ?');
    await widgetPO.confirmationModal.confirm();
    await fixture.update();
    expect(widgetPO.askAVet, exists);
    expect(widgetPO.chatWithVet, exists);
    expect(router.current.path, '/ask_a_vet');
    expect(router.current.queryParameters['id'], consultationId);
    expect(router.current.queryParameters['reconnect'], 'true');
  });

  test('Dismissing a modal', () async {
    expect(widgetPO.confirmationModal, exists);
    await widgetPO.confirmationModal.cancel();
    await fixture.update();
    expect(widgetPO.confirmationModal, notExists);
    expect(widgetPO.home, exists);
  });
}
