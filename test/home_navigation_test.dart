@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'home_navigation_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  setUp(() async {
    initializeServiceLocator();
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  });

  tearDown(disposeAnyRunningTest);

  test('widget window shows navigation', () async {
    expect(widgetPO.hasSignInLink(), isTrue);
    expect(widgetPO.hasSignUpLink(), isTrue);
  });

  test('Shows the sign up form', () async {
    await widgetPO.navigateToSignUp();
    await fixture.update();
    expect(router.current.path, '/sign_up');
    expect(widgetPO.signUp, exists);
  });

  test('Navigating back from sign up', () async {
    await widgetPO.navigateToSignUp();
    await fixture.update();
    expect(router.current.path, '/sign_up');
    expect(widgetPO.signUp, exists);
    await widgetPO.signUp.navigateBack();
    await fixture.update();
    expect(router.current.path, '');
    expect(widgetPO.home, exists);
  });

  test('Navigating back from sign in', () async {
    await widgetPO.navigateToSignIn();
    await fixture.update();
    expect(router.current.path, '/sign_in');
    expect(widgetPO.signIn, exists);
    await widgetPO.signIn.navigateBack();
    await fixture.update();
    expect(router.current.path, '');
    expect(widgetPO.home, exists);
  });
}
