import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class ClinicFinderEventAnalytics {
  final AnalyticsService _analytics;

  ClinicFinderEventAnalytics(this._analytics);

  void logFindClinicOnHome() => _analytics.logEvent('find_a_clinic-on_home');

  void logFindClinicBtnAppearsAfterAiJourney() =>
      _analytics.logEvent('find_a_clinic-btn_appears_after_ai_journey');

  void logFindClinicAfterAiJourney() =>
      _analytics.logEvent('find_a_clinic-after_ai_journey');

  void logUserClickThroughGoogleMap() =>
      _analytics.logEvent('find_a_clinic-user_click_through_google_map');

  void logUserEnterLocationInfoOnMap() =>
      _analytics.logEvent('find_a_clinic-user_enter_location_info_on_map');
}
