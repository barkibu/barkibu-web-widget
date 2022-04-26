@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pageloader/html.dart';
import 'package:pageloader/testing.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/profile_edit_po.dart';
import 'profile_edit_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
ProfileEditPO profileEditPO;
MockClientHandler updateUserRequestHander;
var user = {'firstName': 'Bobby', 'lastName': 'Tables', 'email': 'email@example.com'};

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

Future<http.Response> authRequestHandler(http.Request request) async {
  if (isCurrentUserRequest(request)) {
    return Future.value(http.Response(json.encode({'user': user}), 200));
  } else if (isPetsListRequest(request)) {
    return Future.value(http.Response(json.encode([]), 200));
  } else if (isActiveChatRequest(request)) {
    return activeChatResponse;
  } else {
    return defaultResponse;
  }
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

  Future<void> initializeApp(requestHandler) async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken(token: 'access_token');
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
    await widgetPO.navigateToProfileHome();
    await fixture.update();
    await widgetPO.profileHome.navigateToEditProfile();
    await fixture.update();
    profileEditPO = ProfileEditPO.lookup(context);
  }

  tearDown(disposeAnyRunningTest);

  group('when profile is not updated', () {
    setUp(() async => await initializeApp(authRequestHandler));

    test('Toggles form button status', () async {
      expect(profileEditPO.isDisabled(), isTrue);
      await profileEditPO.fillInEmail('a');
      await fixture.update();
      expect(profileEditPO.isDisabled(), isFalse);
      await profileEditPO.fillInEmail('#invalid');
      await fixture.update();
      expect(profileEditPO.isDisabled(), isTrue);
    });

    test('Shows validation messages', () async {
      await profileEditPO.fillInEmail('#invalid');
      await profileEditPO.fillInPhonePrefix('#invalid');
      await profileEditPO.fillInPhoneNumber('#invalid');
      await fixture.update();
      expect(profileEditPO.hasValidationMessage('Enter a valid e-mail address'), isTrue);
      expect(profileEditPO.hasValidationMessage('Enter a valid phone number country code'), isTrue);
      expect(profileEditPO.hasValidationMessage('Enter a valid phone number'), isTrue);
    });
  });

  group('when profile is saved', () {
    setUp(() async {
      Future<http.Response> updateHandler(http.Request request) async {
        if (request.url.pathSegments.last == 'user') {
          expect(request.method, 'PUT');
          var requestBody = json.decode(request.body);
          expect(requestBody['user']['email'], user['email'] + 'a');
          expect(requestBody['user']['firstName'], user['firstName'] + '_updated');
          expect(requestBody['user']['lastName'], user['lastName'] + '_updated');
          expect(requestBody['user']['phoneNumber'], '123131');
          expect(requestBody['user']['phoneNumberPrefix'], '+37');

          var updatedUser = {'email': 'newEmail', 'firstName': 'newFirstName', 'lastName': 'newLastName'};
          var responseBody = json.encode({'user': updatedUser});
          return Future.value(http.Response(responseBody, 200));
        } else {
          return authRequestHandler(request);
        }
      }

      await initializeApp(updateHandler);
    });

    test('Updates a user', () async {
      await profileEditPO.fillInFirstName('_updated');
      await profileEditPO.fillInLastName('_updated');
      await profileEditPO.fillInEmail('a');
      await profileEditPO.fillInPhonePrefix('+37');
      await profileEditPO.fillInPhoneNumber('123131');
      await fixture.update();
      await profileEditPO.submitForm();
      await fixture.update();
      expect(widgetPO.profileHome, exists);
      expect(router.current.path, '/profile');
      expect(widgetPO.profileHome.hasFullName('newFirstName newLastName'), isTrue);
      expect(widgetPO.profileHome.hasUserInfo('newEmail'), isTrue);
    });
  });

  group('when profile is not saved', () {
    setUp(() async {
      Future<http.Response> updateHandler(http.Request request) async {
        if (request.url.pathSegments.last == 'user') {
          expect(request.method, 'PUT');
          var requestBody = json.decode(request.body);
          expect(requestBody['user']['email'], user['email'] + 'a');
          expect(requestBody['user']['firstName'], user['firstName'] + '_updated');
          expect(requestBody['user']['lastName'], user['lastName'] + '_updated');
          expect(requestBody['user']['phoneNumber'], '123131');
          expect(requestBody['user']['phoneNumberPrefix'], '+37');

          var responseBody = json.encode({
            'email': ['has already been taken']
          });
          return Future.value(http.Response(responseBody, 422));
        } else {
          return authRequestHandler(request);
        }
      }

      await initializeApp(updateHandler);
    });

    test('Show error message', () async {
      await profileEditPO.fillInFirstName('_updated');
      await profileEditPO.fillInLastName('_updated');
      await profileEditPO.fillInEmail('a');
      await profileEditPO.fillInPhonePrefix('+37');
      await profileEditPO.fillInPhoneNumber('123131');
      await fixture.update();
      await profileEditPO.submitForm();
      await fixture.update();
      expect(profileEditPO.snackbarText(), contains('Email has already been taken'));
    });
  });
}
