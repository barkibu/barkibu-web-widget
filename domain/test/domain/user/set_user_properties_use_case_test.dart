import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';
import '../../mocks/mocks.dart';

class AnalyticsServiceMock extends Mock implements AnalyticsService {}

void main() {
  final service = GetIt.instance;
  final apiResponse = {
    'userProperties': {
      'userId': 99,
      'consultationsCount': 2,
      'dogsCount': 1,
      'catsCount': 0,
      'createdAt': '2020-03-30 11:32:09 UTC',
      'email': 'fake@mail.com',
      'phone': '+52303987655',
      'pets': [
        {
          'id': 1,
          'name': 'Bob',
          'species': 'dog',
          'currentPlan': 'some_health_plan',
          'currentPlanStarted': '2020-03-30',
          'currentPlanEnds': null
        }
      ]
    }
  };

  final isUserProperties = predicate((props) =>
      props is UserProperties &&
      props.catsCount == 0 &&
      props.dogsCount == 1 &&
      props.consultationsCount == 2 &&
      props.createdAt == '2020-03-30 11:32:09 UTC' &&
      props.userId == 99 &&
      props.email == 'fake@mail.com' &&
      props.phone == '+52303987655' &&
      props.pets[0].id == 1 &&
      props.pets[0].name == 'Bob' &&
      props.pets[0].species == 'dog' &&
      props.pets[0].currentPlan == 'some_health_plan' &&
      props.pets[0].currentPlanStarted == '2020-03-30' &&
      props.pets[0].currentPlanEnds == null);

  final analyticsService = AnalyticsServiceMock();
  final mockMonitoringService = MockMonitoringService();

  SetUserPropertiesUseCase initializeUseCase(MockClientHandler handler) {
    final chopperClient = ChopperClient(
      converter: JsonConverter(),
      baseUrl: 'http://example.com/v1',
      client: MockClient(handler),
    );
    final api = UserPropertiesApiImpl.create(chopperClient);
    final datasource = UserPropertiesDatasourceImpl(api);
    final repo = UserPropertiesRepositoryImpl(datasource);

    return SetUserPropertiesUseCaseImpl(repo, analyticsService);
  }

  setUp(() {
    service.registerSingleton<MonitoringService>(mockMonitoringService);
  });

  tearDown(() {
    if (service.isRegistered<MonitoringService>()) {
      service.unregister<MonitoringService>();
    }
  });

  group('SetUserPropertiesUseCase#setProperties', () {
    test('raise an exception if user properties api returns an error', () async {
      Future<http.Response> requestHandler(http.Request request) {
        expect(request.method, 'GET');
        expect(request.url.path, '/v1/user_properties');
        return Future.value(http.Response('{"errors": "not signed in"}', 401));
      }

      final useCase = initializeUseCase(requestHandler);
      await useCase.setProperties();
      verifyNever(analyticsService.trackUserProperties(any));
      verify(mockMonitoringService.capture(
          event: anyNamed('event'), severityLevel: anyNamed('severityLevel'), stackTrace: anyNamed('stackTrace')));
    });

    test('sets properties on analytics', () async {
      Future<http.Response> requestHandler(http.Request request) {
        expect(request.method, 'GET');
        expect(request.url.path, '/v1/user_properties');
        return Future.value(http.Response(json.encode(apiResponse), 200));
      }

      final useCase = initializeUseCase(requestHandler);
      await useCase.setProperties();
      verify(analyticsService.trackUserProperties(argThat(isUserProperties)));
    });
  });
}
