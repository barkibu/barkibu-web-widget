import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:test/test.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'home_test.template.dart' as self;
import '../page_objects/chat_po.dart';
import '../page_objects/nutribot_po.dart';
import '../page_objects/pet_assessment_history_po.dart';
import '../page_objects/widget_po.dart';
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
PetAssessmentHistoryPO historyPO;
WidgetConfiguration configuration;
HtmlPageLoaderElement context;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

Future<http.Response> requestHandler(http.Request request) async {
  if (isCurrentUserRequest(request)) {
    return currentUserResponse;
  } else if (isPetsListRequest(request)) {
    return petsListResponse;
  } else if (isActiveChatRequest(request)) {
    return activeChatResponse;
  }
  return defaultResponse;
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(
      requestHandler: requestHandler,
    );
    storeAccessToken();
    configuration = ServiceLocator.container.get<Configuration>();
    fixture = await testBed.create();
    context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  setUp(() async {
    await initializeApp(requestHandler);
  });

  test('HomeComponent is correctly loaded', () {
    expect(widgetPO.home, exists);
  });
  group('[Nutribot CTA]', () {
    group('with nutribot config disabled', () {
      setUp(() {
        when(configuration.nutribotEnabled).thenReturn(false);
      });
      test('is hidden', () async {
        await fixture.update();
        expect(widgetPO.hasNutribotLink(), false);
      });
    });

    group('with nutribot config enabled', () {
      setUp(() {
        when(configuration.nutribotEnabled).thenReturn(true);
      });
      test('is displayed', () async {
        await fixture.update();
        expect(widgetPO.hasNutribotLink(), true);
      });

      test('click redirects to Nutribot', () async {
        await fixture.update();
        await widgetPO.navigateToNutribot();
        await fixture.update();
        expect(NutribotPO.lookup(context), exists);
      });
    });
  });

  group('[AskAVet CTA]', () {
    group('with askAVet config disabled', () {
      setUp(() {
        when(configuration.askAVetDirectlyEnabled).thenReturn(false);
      });
      test('is hidden', () async {
        await fixture.update();
        expect(widgetPO.hasAskAVetLink(), false);
      });
    });

    group('with askAVet config enabled', () {
      setUp(() {
        when(configuration.askAVetDirectlyEnabled).thenReturn(true);
      });
      test('is displayed', () async {
        await fixture.update();
        expect(widgetPO.hasAskAVetLink(), true);
      });

      test('click redirects to Ask a Vet', () async {
        await fixture.update();
        await widgetPO.navigateToAskAVet();
        await fixture.update();
        final chatPO = ChatPO.lookup(context);
        expect(chatPO, exists);
        expect(
            chatPO.messages.receivedMessages(),
            contains(
                'We’ll connect you with a vet in a moment, but first we have a few quick questions to help our team give you the best guidance.'));
      });
    });
  });

  group('[AIVet CTA]', () {
    group('with aivetEnabled config disabled', () {
      setUp(() {
        when(configuration.aivetEnabled).thenReturn(false);
      });
      test('is hidden', () async {
        await fixture.update();
        expect(widgetPO.hasAivetForm(), false);
      });
    });

    group('with askAVet config enabled', () {
      setUp(() {
        when(configuration.aivetEnabled).thenReturn(true);
      });
      test('is displayed', () async {
        await fixture.update();
        expect(widgetPO.hasAivetForm(), true);
      });
    });
  });
}
