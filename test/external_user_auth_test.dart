@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:pageloader/html.dart';
import 'package:http/http.dart' as http;
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;

import 'page_objects/widget_po.dart';
import 'external_user_auth_test.template.dart' as self;
import 'utils/utils.dart';

NgTestFixture<AppComponent> fixture;
WidgetConfiguration config;
WidgetPO widgetPO;

class FakeSignInWithOTPUseCase extends Fake implements SignInWithOTPUseCase {
  final FakeGetUserUseCase fakeGetUserUseCase;

  FakeSignInWithOTPUseCase(this.fakeGetUserUseCase);

  @override
  Future<dynamic> signInWithOTP(String otp) async {
    // ignore: missing_required_param
    fakeGetUserUseCase.signedInUser = User(firstName: 'Leo');
    return null;
  }
}

class FakeGetUserUseCase extends Fake implements GetUserUseCase {
  User signedInUser;

  @override
  Future<User> getUser() => Future.value(signedInUser);
}

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  Future<http.Response> requestHandler(http.Request request) async {
    if (isCurrentUserRequest(request)) {
      return currentUserResponse;
    }
    if (isActiveChatRequest(request)) {
      return activeChatResponse;
    } else {
      return defaultResponse;
    }
  }

  void initializeApp({String authToken, String otpToken}) async {
    final injector = InjectorProbe(rootInjector);
    final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory, rootInjector: injector.factory);

    initializeServiceLocator(requestHandler: requestHandler);
    config = injector.get<WidgetConfiguration>(WidgetConfiguration);
    when(config.externalAuthToken).thenReturn(authToken);
    when(config.otpToken).thenReturn(otpToken);

    if (otpToken != null) {
      final fakeGetUserUseCase = FakeGetUserUseCase();
      ServiceLocator.container.registerSingleton<SignInWithOTPUseCase>(FakeSignInWithOTPUseCase(fakeGetUserUseCase));
      ServiceLocator.container.registerSingleton<GetUserUseCase>(fakeGetUserUseCase);
    }

    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  tearDown(disposeAnyRunningTest);

  test('shows home page for signed in user with token', () async {
    await initializeApp(authToken: 'externalAuthToken');
    expect(widgetPO.nav.innerText, isNot(contains('Sign in')));
    expect(widgetPO.nav.innerText, isNot(contains('Sign up')));
    expect(widgetPO.nav.innerText, contains('My Pets'));
  });

  test('shows home page for signed in user with otp token', () async {
    await initializeApp(otpToken: 'Backend otpToken');
    expect(widgetPO.nav.innerText, isNot(contains('Sign in')));
    expect(widgetPO.nav.innerText, isNot(contains('Sign up')));
    expect(widgetPO.nav.innerText, contains('My Pets'));
  });
}
