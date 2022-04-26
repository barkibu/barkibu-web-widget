import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class CoreEventAnalytics {
  final AnalyticsService _analytics;

  CoreEventAnalytics(this._analytics);

  void logPetTab() => _analytics.logEvent('core-clicks_pet_tab');

  void logAssistantTab() => _analytics.logEvent('core-clicks_assistant_tab');

  void logAssistantTabStartsAivet() => _logStartsAivet('Assistant Tab');

  void logPetProfileStartsAivet() => _logStartsAivet('Pet Profile');

  void _logStartsAivet(String source) => _analytics.logEvent('core-starts_aivet', parameters: {'source': source});
}
