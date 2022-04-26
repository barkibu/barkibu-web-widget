import 'dart:js_util';
import 'dart:html';

@TestOn('browser')
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:pageloader/html.dart';
import 'package:web_widget/app_component.dart';
import 'package:web_widget/app_component.template.dart' as ng;
import 'page_objects/widget_po.dart';
import 'clinics_finder_test.template.dart' as self;
import 'utils/utils.dart';

class MockGeolocation extends Mock implements Geolocation {}

class MockCoordinates extends Mock implements Coordinates {
  @override
  num get latitude => 40.5719479;

  @override
  num get longitude => -122.3575825;
}

class MockGeoposition extends Mock implements Geoposition {
  @override
  Coordinates get coords => MockCoordinates();
}

NgTestFixture<AppComponent> fixture;
WidgetConfiguration configuration;
WidgetPO widgetPO;
MockGeolocation geolocation;
MockGeoposition geoposition;

@GenerateInjector([routerProvidersForTesting])
final InjectorFactory rootInjector = self.rootInjector$Injector;

Future<http.Response> requestHandler(http.Request request) async {
  if (isCurrentUserRequest(request)) {
    return currentUserResponse;
  } else if (isClinicsRequest(request)) {
    return clinicsResponse;
  } else if (isActiveChatRequest(request)) {
    return activeChatResponse;
  }
  return defaultResponse;
}

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed.forComponent<AppComponent>(
    ng.AppComponentNgFactory,
    rootInjector: injector.factory,
  );

  Future<void> initializeApp() async {
    initializeServiceLocator(requestHandler: requestHandler);
    storeAccessToken(token: 'access_token');
    configuration = ServiceLocator.container.get<Configuration>();
    when(configuration.findAClinicEnabled).thenReturn(true);
    when(configuration.findAClinicAddressApiEnabled).thenReturn(false);

    geolocation = MockGeolocation();
    geoposition = MockGeoposition();

    fixture = await testBed.create();
    var context = HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    widgetPO = WidgetPO.create(context);
    await fixture.update();
  }

  setUp(initializeApp);
  tearDown(disposeAnyRunningTest);

  group('with location enabled,', () {
    setUp(() {
      when(configuration.findAClinicEnabled).thenReturn(true);
      when(geolocation.getCurrentPosition()).thenAnswer((_) {
        return Future.value(geoposition);
      });
      callMethod(window.navigator, '__defineGetter__', ['geolocation', () => geolocation]);
    });
    test('hours are displayed in clinics first item', () async {
      await fixture.update();
      await widgetPO.navigateToClinicsFinder();
      await fixture.update();
      expect(widgetPO.clinicsFinder.hasCards(), true);
    });
  });

  group('with location disabled,', () {
    setUp(() {
      when(configuration.findAClinicAddressApiEnabled).thenReturn(true);
      when(geolocation.getCurrentPosition()).thenAnswer((_) => Future.error('error'));
      callMethod(window.navigator, '__defineGetter__', ['geolocation', () => geolocation]);
    });
    test('address entry displayed', () async {
      await fixture.update();
      await widgetPO.navigateToClinicsFinder();
      await fixture.update();
      expect(widgetPO.clinicsFinder.isAddressPresent, true);
    });
  });
}
