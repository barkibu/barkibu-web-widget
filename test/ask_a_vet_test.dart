@TestOn('browser')

import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;
import 'package:web_widget/src/twilio/twilio_video_sdk_wrapper.dart';
import 'package:web_widget/src/twilio/twilio_video_service.dart';

import 'page_objects/widget_po.dart';
import 'ask_a_vet_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
TwilioTestChatService twilio;
WidgetPO widgetPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

class MockTwilioVideoService extends Mock implements TwilioVideoService {}

class MockTwilioTrack extends Mock implements TwilioTrack {
  final DivElement htmlTrackDiv;
  MockTwilioTrack(this.htmlTrackDiv);
  @override
  DivElement attach() => htmlTrackDiv;
}

void main() {
  final consultationId = 'consultatioin_id';
  final petParentIdentiy = 'bob@email.com';
  final vetIdentity = 'vet@barkibu.com';
  final accessToken = 'acc3s_token';
  final channelSid = 'channel_sid';
  final roomSid = 'room_sid';
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  MockTwilioVideoService mockTwilioVideoService;

  Future<void> initializeApp(requestHandler) async {
    twilio = TwilioTestChatService(petParentIdentiy);
    initializeServiceLocator(requestHandler: requestHandler, twilio: twilio);
    ServiceLocator.container.registerFactoryParam<TwilioVideoService, TwilioVideoParams, void>(
        (twilioVideoParams, _) => mockTwilioVideoService);
    storeAccessToken();
    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    router = injector.get<Router>(Router);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    await fixture.update();
    final query = NavigationParams(queryParameters: {'id': consultationId});
    await router.navigate('/ask_a_vet', query);
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
      } else if (request.url.path == '/chats/new') {
        var body = json.encode({'accessToken': accessToken, 'channelSid': channelSid});
        return Future.value(http.Response(body, 200));
      } else if (request.url.path == '/videochats/new') {
        var body = json.encode({'accessToken': accessToken, 'roomSid': roomSid});
        return Future.value(http.Response(body, 200));
      } else if (isActiveChatRequest(request)) {
        return activeChatResponse;
      }
      return defaultResponse;
    }

    mockTwilioVideoService = MockTwilioVideoService();
    await initializeApp(successResponseHandler);
  });

  test('Chatting with a vet', () async {
    expect(widgetPO.chatWithVet, exists);
    await widgetPO.chatWithVet.typeMessage('Hello, I am looking for help');
    await fixture.update();
    await widgetPO.chatWithVet.sendCurrentMessage();
    await fixture.update();
    expect(widgetPO.chatWithVet.sentMessages(), contains('Hello, I am looking for help'));
    twilio.joinAsVet(vetIdentity);
    await fixture.update();
    expect(widgetPO.chatWithVet.systemMessages(), contains('You are connected with vet@barkibu.com from the Vet Team'));
    twilio.vetIsTypeing(vetIdentity);
    await fixture.update();
    expect(widgetPO.chatWithVet.hasTypingMessage(vetIdentity), isTrue);
    twilio.vetStoppedTyping(vetIdentity);
    await fixture.update();
    expect(widgetPO.chatWithVet.hasNoTypingMessage(), isTrue);
    twilio.sendMessageAsVet(vetIdentity, 'How can I help you?');
    await fixture.update();
    expect(widgetPO.chatWithVet.receivedMessages(), contains('How can I help you?'));
    await widgetPO.chatWithVet.typeMessage('Bye');
    await fixture.update();
    await widgetPO.chatWithVet.sendCurrentMessage();
    await fixture.update();
    expect(widgetPO.chatWithVet.sentMessages(), contains('Bye'));
    twilio.leaveAsAVet(vetIdentity);
    await fixture.update();
    expect(widgetPO.chatWithVet.receivedMessages(), contains('Was your chat with the vet helpful?'));
    await widgetPO.chatWithVet.chatControlsPO.selectYesNoOption('Yes');
    await fixture.update();
    expect(widgetPO.chatWithVet.sentMessages(), contains('Yes'));
    expect(widgetPO.chatWithVet.receivedMessages(),
        contains('Great! Come back any time you have a question about your pet.'));
    await widgetPO.chatWithVet.chatControlsPO.clickChatButton('Go back');
    await fixture.update();
    expect(widgetPO.home, exists);
  });

  group('VideoStreamSharing', () {
    final htmlTrackDiv = DivElement()..innerText = 'My pretty doggo';
    final localVideoTrack = MockTwilioTrack(htmlTrackDiv);
    final localAudioTrack = MockTwilioTrack(htmlTrackDiv);
    setUp(() {
      when(config.telehealthVideoCapabilityEnabled).thenReturn(true);
      when(config.isVideoSupported).thenReturn(true);
      when(mockTwilioVideoService.createLocalVideoTrack()).thenAnswer((_) => Future.value(localVideoTrack));
      when(mockTwilioVideoService.createLocalAudioTrack()).thenAnswer((_) => Future.value(localAudioTrack));
    });

    test('Starting video Stream', () async {
      expect(widgetPO.askAVet, exists);
      await fixture.update();
      expect(widgetPO.chatWithVet.videoStream.modalClasses(), contains('hidden'));
      widgetPO.chatWithVet.videoStream.requestVideoStream();
      await fixture.update();
      expect(widgetPO.chatWithVet.videoStream.modalClasses(), isNot(contains('hidden')));
      expect(widgetPO.chatWithVet.videoStream.streamStatus(), contains('Connecting with the vet'));
      await twilio.respondToVideoStreamShareRequest(channelSid, roomSid, VideoChatRoomStatus.accepted);
      await fixture.update();
      expect(widgetPO.chatWithVet.videoStream.streamContains(htmlTrackDiv.toString()), true);
      verify(mockTwilioVideoService.connectAndDisplay(localVideoTrack, localAudioTrack)).called(1);

      // Closing the VideoStream from Vet side
      await twilio.respondToVideoStreamShareRequest(channelSid, roomSid, VideoChatRoomStatus.terminated);
      await fixture.update();
      expect(widgetPO.chatWithVet.videoStream.streamStatus(),
          contains('Video chat is now off. Click Back to return to typing with the vet'));
    });
  });
}
