@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/sign_up_po.dart';
import 'email_sign_up_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
SignUpPO signUpPO;
WidgetConfiguration config;

Future<http.Response> requestHandler(http.Request request) async {
  var body = json.encode({
    'user': {'email': 'john.doe@example.com', 'country': 'ES'}
  });
  var headers = {'authorization': 'Bearer token'};
  return Future.value(http.Response(body, 200, headers: headers));
}

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  setUp(() async {
    initializeServiceLocator(requestHandler: requestHandler);
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(config.authByEmailEnabled).thenReturn(true);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToSignUp();
    await fixture.update();
    signUpPO = widgetPO.signUp;
    await signUpPO.navigateToEmailSignUp();
    await fixture.update();
  });

  tearDown(disposeAnyRunningTest);

  test('Shows validation errors', () async {
    await signUpPO.submitForm();
    await fixture.update();
    expect(signUpPO.hasValidationMessage('Enter a valid name'), isTrue);
    expect(signUpPO.hasValidationMessage('Enter a valid e-mail address'), isTrue);
    expect(signUpPO.hasValidationMessage('The Password is required'), isTrue);
    expect(signUpPO.hasValidationMessage('You must accept our terms'), isTrue);
  });

  test('Creates a user', () async {
    await signUpPO.fillInFirstName('John');
    await signUpPO.fillInEmail('john.doe@example.com');
    await signUpPO.fillInPassword('Password');
    await signUpPO.acceptTerms();
    await signUpPO.submitForm();
    await fixture.update();
    expect(router.current.path, '');
    expect(widgetPO.home, exists);
  });

  test('User open terms and conditions', () async {
    await signUpPO.openTermsAndConditions();
    await fixture.update();
    expect(signUpPO.isFormHidden(), isTrue);
    expect(widgetPO.symptomInfoScreen.showsTerms(), isTrue);
    await widgetPO.symptomInfoScreen.goBack();
    await fixture.update();
    expect(signUpPO.isFormHidden(), isFalse);
  });
}
