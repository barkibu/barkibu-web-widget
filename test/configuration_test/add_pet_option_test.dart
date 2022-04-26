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
import 'add_pet_option_test.template.dart' as self;
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
    } else if (isPetsListRequest(request)) {
      return petsListResponse;
    } else {
      return defaultResponse;
    }
  }

  Future<void> initializeApp() async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken();
    fixture = await testBed.create();
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  setUp(() async {
    await initializeApp();
  });

  tearDown(disposeAnyRunningTest);

  test('Does not show add a pet button when addPetOptionEnabled is false', () async {
    when(config.addPetOptionEnabled).thenReturn(false);
    await widgetPO.navigateToMyPets();
    await fixture.update();
    expect(widgetPO.myPets.hasAddAPetButton(), isFalse);
  });

  test('Does not show add a pet option in nutribot flow when addPetOptionEnabled is false', () async {
    when(config.addPetOptionEnabled).thenReturn(false);
    when(config.nutribotEnabled).thenReturn(true);
    await fixture.update();
    await widgetPO.navigateToNutribot();
    await fixture.update();
    final nutribotPO = widgetPO.nutribot;
    expect(nutribotPO.controls.listSelectOptions(), contains('Snoopy'));
    expect(nutribotPO.controls.listSelectOptions(), contains('Purry'));
    expect(nutribotPO.controls.listSelectOptions(), isNot(contains('Add a pet')));
  });

  test('Does not show add a pet option in ask a vet flow when addPetOptionEnabled is false', () async {
    when(config.addPetOptionEnabled).thenReturn(false);
    when(config.askAVetDirectlyEnabled).thenReturn(true);
    await fixture.update();
    await widgetPO.navigateToAskAVet();
    await fixture.update();
    final chatPO = widgetPO.chat;
    expect(chatPO.controls.listSelectOptions(), contains('Snoopy'));
    expect(chatPO.controls.listSelectOptions(), contains('Purry'));
    expect(chatPO.controls.listSelectOptions(), isNot(contains('Add a pet')));
  });
}
