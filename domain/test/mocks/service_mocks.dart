import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/services/analytics/event_analytics_service.dart';
import 'package:common_barkibu_dart/services/analytics/events/event.dart';
import 'package:common_barkibu_dart/services/analytics/events/faq_events_analytics.dart';
import 'package:common_barkibu_dart/services/analytics/screen_analytics_service.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/services/monitoring_service.dart';
import 'package:mockito/mockito.dart';

class MockAnalyticsService extends Mock implements AnalyticsService {
  ScreenAnalyticsService _screenAnalyticsService;
  EventAnalyticsService _eventAnalyticsService;

  MockAnalyticsService() {
    _screenAnalyticsService = MockScreenAnalyticsService();
    _eventAnalyticsService = MockEventAnalyticsService();
  }

  @override
  MockScreenAnalyticsService get screen => _screenAnalyticsService;

  @override
  MockEventAnalyticsService get event => _eventAnalyticsService;
}

class MockScreenAnalyticsService extends Mock implements ScreenAnalyticsService {}

class MockEventAnalyticsService extends Mock implements EventAnalyticsService {
  AccessEventAnalytics _accessEventAnalytics;
  CoreEventAnalytics _coreEventAnalytics;
  PetsEventAnalytics _petsEventAnalytics;
  PlansEventAnalytics _plansEventAnalytics;
  AivetEventAnalytics _aivetEventAnalytics;
  AskAVetEventAnalytics _askAVetEventAnalytics;
  MyAccountEventAnalytics _myAccountEventAnalytics;
  MyPetsEventAnalytics _myPetsEventAnalytics;
  InsuranceEventAnalytics _insuranceEventAnalytics;
  NutribotEventAnalytics _nutribotEventAnalytics;
  FaqEventsAnalytics _faqEventsAnalytics;

  MockEventAnalyticsService() {
    _accessEventAnalytics = MockAccessEventAnalytics();
    _coreEventAnalytics = MockCoreEventAnalytics();
    _petsEventAnalytics = MockPetsEventAnalytics();
    _plansEventAnalytics = MockPlansEventAnalytics();
    _aivetEventAnalytics = MockAivetEventAnalytics();
    _askAVetEventAnalytics = MockAskAVetEventAnalytics();
    _myAccountEventAnalytics = MockMyAccountEventAnalytics();
    _myPetsEventAnalytics = MockMyPetsEventAnalytics();
    _insuranceEventAnalytics = MockInsuranceEventAnalytics();
    _nutribotEventAnalytics = MockNutribotEventAnalytics();
    _faqEventsAnalytics = MockFaqEventsAnalytics();
  }

  @override
  MockAccessEventAnalytics get access => _accessEventAnalytics;

  @override
  MockCoreEventAnalytics get core => _coreEventAnalytics;

  @override
  MockPetsEventAnalytics get pets => _petsEventAnalytics;

  @override
  MockPlansEventAnalytics get plans => _plansEventAnalytics;

  @override
  MockAivetEventAnalytics get aivet => _aivetEventAnalytics;

  @override
  MockAskAVetEventAnalytics get askAVet => _askAVetEventAnalytics;

  @override
  MockMyAccountEventAnalytics get myAccount => _myAccountEventAnalytics;

  @override
  MockMyPetsEventAnalytics get myPets => _myPetsEventAnalytics;

  @override
  MockInsuranceEventAnalytics get insurance => _insuranceEventAnalytics;

  @override
  MockNutribotEventAnalytics get nutribot => _nutribotEventAnalytics;

  @override
  MockFaqEventsAnalytics get faq => _faqEventsAnalytics;
}

class MockConfiguration extends Mock implements Configuration {
  @override
  int botPreMessageDelay = 0;

  @override
  int botPostMessageDelay = 0;

  @override
  bool telehealthVideoCapabilityEnabled = true;
}

class MockMonitoringService extends Mock implements MonitoringService {}

class MockAccessEventAnalytics extends Mock implements AccessEventAnalytics {}

class MockCoreEventAnalytics extends Mock implements CoreEventAnalytics {}

class MockPetsEventAnalytics extends Mock implements PetsEventAnalytics {}

class MockPlansEventAnalytics extends Mock implements PlansEventAnalytics {}

class MockAivetEventAnalytics extends Mock implements AivetEventAnalytics {}

class MockAskAVetEventAnalytics extends Mock implements AskAVetEventAnalytics {}

class MockMyAccountEventAnalytics extends Mock implements MyAccountEventAnalytics {}

class MockMyPetsEventAnalytics extends Mock implements MyPetsEventAnalytics {}

class MockInsuranceEventAnalytics extends Mock implements InsuranceEventAnalytics {}

class MockNutribotEventAnalytics extends Mock implements NutribotEventAnalytics {}

class MockFaqEventsAnalytics extends Mock implements FaqEventsAnalytics {}
