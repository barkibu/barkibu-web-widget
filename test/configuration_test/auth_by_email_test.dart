@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import '../page_objects/widget_po.dart';
import 'auth_by_email_test.template.dart' as self;
import '../utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetPO widgetPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp() async {
    initializeServiceLocator();
    fixture = await testBed.create();
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  test('Hides tabs when sign in via email is disabled', () async {
    await initializeApp();
    await widgetPO.navigateToSignIn();
    when(config.authByEmailEnabled).thenReturn(true);
    await fixture.update();
    expect(widgetPO.signIn.hasEmailTab, isTrue);
    expect(widgetPO.signIn.hasPhoneTab, isTrue);
    when(config.authByEmailEnabled).thenReturn(false);
    await fixture.update();
    expect(widgetPO.signIn.hasEmailTab, isFalse);
    expect(widgetPO.signIn.hasPhoneTab, isFalse);
  });

  test('Hides tabs when sign up via email is disabled', () async {
    await initializeApp();
    await widgetPO.navigateToSignUp();
    when(config.authByEmailEnabled).thenReturn(true);
    await fixture.update();
    expect(widgetPO.signUp.hasEmailTab, isTrue);
    expect(widgetPO.signUp.hasPhoneTab, isTrue);
    when(config.authByEmailEnabled).thenReturn(false);
    await fixture.update();
    expect(widgetPO.signUp.hasEmailTab, isFalse);
    expect(widgetPO.signUp.hasPhoneTab, isFalse);
  });
}
