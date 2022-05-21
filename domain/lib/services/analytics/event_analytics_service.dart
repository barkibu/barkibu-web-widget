import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/services/analytics/events/clinic_finder_event_analytics.dart';
import 'package:common_barkibu_dart/services/analytics/events/event.dart';
import 'package:common_barkibu_dart/services/analytics/events/faq_events_analytics.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';

import 'events/assessment_report_event_analytics.dart';

class EventAnalyticsService {
  final AnalyticsService _analytics = ServiceLocator.container<AnalyticsService>();

  String yesNo(bool positive) => positive ? 'Yes' : 'No';

  AccessEventAnalytics get access => AccessEventAnalytics(_analytics);

  CoreEventAnalytics get core => CoreEventAnalytics(_analytics);

  PetsEventAnalytics get pets => PetsEventAnalytics(_analytics);

  AivetEventAnalytics get aivet => AivetEventAnalytics(_analytics);

  AskAVetEventAnalytics get askAVet => AskAVetEventAnalytics(_analytics);

  RecommendationsEventAnalytics get recommendations => RecommendationsEventAnalytics(_analytics);

  MyAccountEventAnalytics get myAccount => MyAccountEventAnalytics(_analytics);

  MyPetsEventAnalytics get myPets => MyPetsEventAnalytics(_analytics);

  NutribotEventAnalytics get nutribot => NutribotEventAnalytics(_analytics);

  InsuranceEventAnalytics get insurance => InsuranceEventAnalytics(_analytics);

  PlansEventAnalytics get plans => PlansEventAnalytics(_analytics);

  FaqEventsAnalytics get faq => FaqEventsAnalytics(_analytics);

  AssessmentReportEventAnalytics get assessmentReport => AssessmentReportEventAnalytics(_analytics);

  ActionsEventAnalytics get actions => ActionsEventAnalytics(_analytics);

  PetProfileEventAnalytics get petProfile => PetProfileEventAnalytics(_analytics);

  ClinicFinderEventAnalytics get  clinicFinder => ClinicFinderEventAnalytics(_analytics);
}
