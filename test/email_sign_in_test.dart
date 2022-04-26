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
import 'page_objects/sign_in_po.dart';
import 'email_sign_in_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
SignInPO signInPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(config.authByEmailEnabled).thenReturn(true);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToSignIn();
    await fixture.update();
    signInPO = widgetPO.signIn;
    await signInPO.navigateToEmailSignIn();
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  group('when response is successful', () {
    setUp(() async {
      Future<http.Response> successResponseHandler(http.Request request) async {
        var body = json.encode({
          'user': {'email': 'john.doe@example.com', 'country': 'ES'}
        });
        var headers = {'authorization': 'Bearer token'};
        return Future.value(http.Response(body, 200, headers: headers));
      }

      await initializeApp(successResponseHandler);
    });

    test('Shows validation errors', () async {
      await signInPO.submitForm();
      await fixture.update();
      expect(signInPO.hasValidationMessage('Invalid e-mail'), isTrue);
      expect(signInPO.hasValidationMessage('The Password is required'), isTrue);
    });

    test('Redirects back to home', () async {
      await signInPO.fillInEmail('john.doe@example.com');
      await signInPO.fillInPassword('Password');
      await signInPO.submitForm();
      await fixture.update();
      expect(router.current.path, '');
      expect(widgetPO.home, exists);
      expect(widgetPO.nav.innerText, isNot(contains('Sign in')));
      expect(widgetPO.nav.innerText, contains('Profile'));
      expect(widgetPO.nav.innerText, contains('Log out'));
    });

    test('Allows user to sign out', () async {
      await signInPO.fillInEmail('john.doe@example.com');
      await signInPO.fillInPassword('Password');
      await signInPO.submitForm();
      await fixture.update();
      await widgetPO.navigateToSignOut();
      await fixture.update();
      expect(widgetPO.nav.innerText, contains('Sign in'));
    });
  });

  group('when response is not successful', () {
    setUp(() async {
      Future<http.Response> failureResponseHandler(http.Request request) async {
        var body = json.encode({'error': 'error message'});
        return Future.value(http.Response(body, 401));
      }

      await initializeApp(failureResponseHandler);
    });

    test('Shows an error message', () async {
      await signInPO.fillInEmail('john.doe@example.com');
      await signInPO.fillInPassword('Password');
      await signInPO.submitForm();
      await fixture.update();
      expect(signInPO.hasErrorMessage('The e-mail or the password are incorrect'), isTrue);
    });
  });
}
