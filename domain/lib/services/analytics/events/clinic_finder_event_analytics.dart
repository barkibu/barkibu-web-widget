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
      _analytics.logEvent('user_click_through_google_map');

  void logUserEnterLocationInfo() =>
      _analytics.logEvent('user_enter_location_info');
}
// 1. User clicks the Find A Clinic button on the home screen
// 2. Find A Clinic button appears after AI Vet journey
// 3. User clicks on the Find A Clinic button at the conclusion of their AI Vet journey
// 4. User clicks through to Google maps
// 5. User enters location info (this is a nice to have. If it is more complicated than the others, let me know)
