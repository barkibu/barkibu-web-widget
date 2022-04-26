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
import 'page_objects/password_recovery_po.dart';
import 'password_recovery_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
PasswordRecoveryPO passwordRecoveryPO;
WidgetConfiguration config;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp({requestHandler}) async {
    initializeServiceLocator(requestHandler: requestHandler);
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(config.authByEmailEnabled).thenReturn(true);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToSignIn();
    await fixture.update();
    await widgetPO.signIn.navigateToEmailSignIn();
    await fixture.update();
    await widgetPO.signIn.navigateToPasswordRecovery();
    await fixture.update();
    passwordRecoveryPO = PasswordRecoveryPO.lookup(context);
  }

  Future<void> submitEmail(String email) async {
    await passwordRecoveryPO.fillInEmail(email);
    await fixture.update();
    await passwordRecoveryPO.submitEmail();
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  test('enables submit button only for valid email', () async {
    await initializeApp();
    expect(widgetPO.passwordRecovery, exists);
    expect(passwordRecoveryPO.isEmailSubmitDisabled(), isTrue);
    await passwordRecoveryPO.fillInEmail('example');
    await fixture.update();
    expect(passwordRecoveryPO.isEmailSubmitDisabled(), isTrue);
    await passwordRecoveryPO.fillInEmail('@email.com');
    await fixture.update();
    expect(passwordRecoveryPO.isEmailSubmitDisabled(), isFalse);
  });

  test('shows password reset form when email is submitted', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      expect(request.url.pathSegments.last, 'begin_password_reset');
      expect(json.decode(request.body)['user']['email'], 'email@example.com');
      return Future.value(http.Response('', 204));
    }

    await initializeApp(requestHandler: requestHandler);
    await submitEmail('email@example.com');
    expect(
        passwordRecoveryPO.successMessage(), 'We have emailed a reset code to your e-mail address: email@example.com');
  });

  test('shows an error message when code was not sent', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      return Future.value(http.Response('', 500));
    }

    await initializeApp(requestHandler: requestHandler);
    await submitEmail('email@example.com');
    expect(passwordRecoveryPO.errorMessage(), 'An error has occurred');
  });

  test('shows validation errors on reset password form', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      return Future.value(http.Response('', 200));
    }

    await initializeApp(requestHandler: requestHandler);
    await submitEmail('email@example.com');
    await passwordRecoveryPO.fillInPassword('nope');
    await passwordRecoveryPO.fillInPasswordRepeat('nope2');
    await fixture.update();
    expect(passwordRecoveryPO.hasValidationMessage('Passwords doesn’t match'), isTrue);
  });

  test('allows user to resend reset code', () async {
    var resetRequestCount = 0;
    Future<http.Response> requestHandler(http.Request request) async {
      resetRequestCount++;
      expect(request.url.pathSegments.last, 'begin_password_reset');
      expect(json.decode(request.body)['user']['email'], 'email@example.com');
      return Future.value(http.Response('', 204));
    }

    await initializeApp(requestHandler: requestHandler);
    await submitEmail('email@example.com');
    await passwordRecoveryPO.resendResetCode();
    await fixture.update();
    expect(resetRequestCount, 2);
  });

  test('shows error message when reset failed', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      if (request.url.pathSegments.last == 'begin_password_reset') {
        return Future.value(http.Response('', 200));
      } else {
        return Future.value(http.Response('', 500));
      }
    }

    await initializeApp(requestHandler: requestHandler);
    await submitEmail('email@example.com');
    await passwordRecoveryPO.fillInPassword('Password');
    await passwordRecoveryPO.fillInPasswordRepeat('Password');
    await passwordRecoveryPO.fillInCode('123456');
    await fixture.update();
    await passwordRecoveryPO.submitPasswordReset();
    await fixture.update();
    expect(passwordRecoveryPO.errorMessage(), 'An error has occurred');
  });

  test('redirects to home page and signs in user', () async {
    var userResponse = json.encode({
      'user': {'email': 'john.doe@example.com', 'country': 'ES'}
    });
    var resetPassBody = {
      'user': {'email': 'email@example.com', 'passwordResetCode': '123456', 'password': 'Password'}
    };

    Future<http.Response> requestHandler(http.Request request) async {
      if (request.url.pathSegments.last == 'begin_password_reset') {
        return Future.value(http.Response('', 204));
      } else if (request.url.pathSegments.last == 'reset_password') {
        expect(json.decode(request.body), resetPassBody);
        return Future.value(http.Response('', 204));
      } else if (request.url.pathSegments.last == 'sign_in') {
        return Future.value(http.Response(userResponse, 200, headers: {'authorization': 'Bearer token'}));
      } else if (isCurrentUserRequest(request)) {
        return Future.value(http.Response(userResponse, 200));
      } else if (isActiveChatRequest(request)) {
        return activeChatResponse;
      } else {
        return defaultResponse;
      }
    }

    await initializeApp(requestHandler: requestHandler);
    await submitEmail('email@example.com');
    await fixture.update();
    await passwordRecoveryPO.fillInPassword('Password');
    await fixture.update();
    await passwordRecoveryPO.fillInPasswordRepeat('Password');
    await fixture.update();
    await passwordRecoveryPO.fillInCode('123456');
    await fixture.update();
    await passwordRecoveryPO.submitPasswordReset();
    await fixture.update();
    expect(widgetPO.home, exists);
    expect(router.current.path, '');
  });
}
