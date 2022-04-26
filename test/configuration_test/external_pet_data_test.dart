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
import 'external_pet_data_test.template.dart' as self;
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
WidgetConfiguration config;
ParentWindowService parentWindow;
final pet = petsListResponseBody[0]['pet'];

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
    } else if (isPetsListRequest(request)) {
      return petsListResponse;
    } else if (request.url.pathSegments.last == pet['id'].toString() && request.method == 'GET') {
      return Future.value(http.Response(json.encode(petsListResponseBody[0]), 200));
    } else {
      return defaultResponse;
    }
  }

  Future<void> initializeApp() async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    parentWindow = injector.get<ParentWindowService>(ParentWindowService);
    when(config.externalPetDataEnabled).thenReturn(true);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  setUp(() async {
    await initializeApp();
  });

  tearDown(disposeAnyRunningTest);

  test('Notifies parent window when clicking "Add pet" on my pets screen', () async {
    await widgetPO.navigateToMyPets();
    await fixture.update();
    await widgetPO.myPets.clickAddPetButton();
    await fixture.update();
    verify(parentWindow.notifyAddPetRequested('/my_pets', {}));
  });

  test('Does not show edit a pet button', () async {
    await widgetPO.navigateToMyPets();
    await fixture.update();
    await widgetPO.myPets.navigateToPetProfile(pet['name']);
    await fixture.update();
    expect(widgetPO.petProfile.hasEditPetButton(), isFalse);
  });

  test('Notifies parent window when clicking "Add pet" in nutribot flow', () async {
    when(config.nutribotEnabled).thenReturn(true);
    await fixture.update();
    await widgetPO.navigateToNutribot();
    await fixture.update();
    final nutribotPO = widgetPO.nutribot;
    await nutribotPO.controls.selectOption('Add a pet');
    await fixture.update();
    verify(parentWindow.notifyAddPetRequested('/nutribot', {}));
  });

  test('Notifies parent window when clicking "Add pet" in ask a vet flow', () async {
    when(config.askAVetDirectlyEnabled).thenReturn(true);
    await fixture.update();
    await widgetPO.navigateToAskAVet();
    await fixture.update();
    final chatPO = widgetPO.chat;
    await chatPO.controls.selectOption('Add a pet');
    await fixture.update();
    verify(parentWindow.notifyAddPetRequested('/chat', {'chatType': 'ask_a_vet'}));
  });
}
