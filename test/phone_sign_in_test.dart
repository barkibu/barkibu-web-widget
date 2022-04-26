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
import 'page_objects/sign_in_po.dart';
import 'phone_sign_in_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
SignInPO signInPO;
WidgetConfiguration configuration;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    configuration = injector.get<WidgetConfiguration>(WidgetConfiguration);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToSignIn();
    await fixture.update();
    signInPO = widgetPO.signIn;
  }

  tearDown(disposeAnyRunningTest);

  final phone = '123456';
  final prefix = '+7';
  final code = '000000';
  final token = 'tok3n';

  Future<void> fillInAndSubmitPhone() async {
    await signInPO.fillInPhoneNumber(phone);
    await signInPO.fillInPhonePrefix(prefix);
    await signInPO.submitForm();
    await fixture.update();
  }

  Future<void> fillInAndSubmitCode() async {
    await signInPO.fillInCode(code);
    await signInPO.submitForm();
    await fixture.update();
  }

  test('Shows validation errors', () async {
    await initializeApp(noopRequestHandler);
    await signInPO.submitForm();
    await fixture.update();
    expect(signInPO.hasValidationMessage('The Phone number country code is required'), isTrue);
    expect(signInPO.hasValidationMessage('The Phone number is required'), isTrue);
  });

  test('Shows validation errors for incorrect phone and prefix', () async {
    await initializeApp(noopRequestHandler);
    await signInPO.fillInPhoneNumber('not a phone number');
    await signInPO.fillInPhonePrefix('not a phone prefix');
    await signInPO.submitForm();
    await fixture.update();
    expect(signInPO.hasValidationMessage('Enter a valid phone number country code'), isTrue);
    expect(signInPO.hasValidationMessage('Enter a valid phone number'), isTrue);
  });

  test('Shows an error when api response returns invalid phone error', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      final response = {'error': 'invalid_phone_number'};
      return Future.value(http.Response(json.encode(response), 400));
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    expect(signInPO.hasErrorMessage('The phone number you entered is invalid'), isTrue);
  });

  test('Shows an error when api response returns any error', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      return Future.value(http.Response('', 500));
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    expect(signInPO.hasErrorMessage('There was an error while sending verification code'), isTrue);
  });

  test('Shows error if code is not entered', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      return Future.value(http.Response('', 201));
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    await signInPO.submitForm();
    await fixture.update();
    expect(signInPO.hasValidationMessage('Enter a valid 6-digit code'), isTrue);
  });

  test('Makes an api request the code when user resends the code', () async {
    var apiCallsCount = 0;
    Future<http.Response> requestHandler(http.Request request) async {
      final requestBody = json.decode(request.body);
      expect(request.url.path, '/phone_sign_in');
      expect(request.method, 'POST');
      expect(requestBody['phone_sign_in']['phoneNumber'], phone);
      expect(requestBody['phone_sign_in']['phoneNumberPrefix'], prefix);
      apiCallsCount++;
      return Future.value(http.Response('', 201));
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    await signInPO.resendVerificationCode();
    await fixture.update();
    expect(apiCallsCount, 2);
  });

  test('Shows error when code was not accepted by backend', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      if (request.url.path == '/phone_sign_in') {
        return Future.value(http.Response('', 201));
      } else {
        final response = {'error': 'incorrect_code'};
        return Future.value(http.Response(json.encode(response), 400));
      }
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    await fillInAndSubmitCode();
    expect(signInPO.hasErrorMessage('Code didn’t match'), isTrue);
  });

  test('Shows error when backend returned error', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      if (request.url.path == '/phone_sign_in') {
        return Future.value(http.Response('', 201));
      } else {
        return Future.value(http.Response('', 500));
      }
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    await fillInAndSubmitCode();
    expect(signInPO.hasErrorMessage('There was an error while verifying your phone number'), isTrue);
  });

  test('User is redirected to home page after sign in', () async {
    Future<http.Response> requestHandler(http.Request request) async {
      if (request.url.path == '/phone_sign_in') {
        return Future.value(http.Response('', 201));
      } else if (request.url.path == '/phone_sign_in/verify') {
        return Future.value(http.Response('', 201, headers: {'authorization': 'Bearer $token'}));
      } else {
        var user = {'firstName': '', 'lastName': '', 'country': 'ES'};
        return Future.value(http.Response(json.encode({'user': user}), 200));
      }
    }

    await initializeApp(requestHandler);
    await fillInAndSubmitPhone();
    await fillInAndSubmitCode();
    expect(widgetPO.home, exists);
  });
}
