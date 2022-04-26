@TestOn('browser')

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'page_objects/profile_home_po.dart';
import 'profile_home_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
Router router;
WidgetPO widgetPO;
ProfileHomePO profileHomePO;
MockClientHandler updateUserRequestHander;

var user = {'firstName': 'Bobby', 'lastName': 'Tables', 'email': 'email@example.com'};

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

Future<http.Response> authRequestHandler(http.Request request) async {
  return Future.value(http.Response(json.encode({'user': user}), 200));
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
    profileHomePO = ProfileHomePO.lookup(context);
  }

  tearDown(disposeAnyRunningTest);

  group('Profile screen', () {
    setUp(() async => await initializeApp(authRequestHandler));

    test('Shows user info on profile screen', () async {
      expect(profileHomePO.hasFullName('Bobby Tables'), isTrue);
      expect(profileHomePO.hasUserInfo('email@example.com'), isTrue);
    });
  });
}
