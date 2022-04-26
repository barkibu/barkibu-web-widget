import 'package:common_barkibu_dart/services/analytics_service.dart';

class FaqEventsAnalytics {
  final AnalyticsService _analytics;

  FaqEventsAnalytics(this._analytics);

  void logFaqExpanded(String planName, String faqId) =>
      _analytics.logEvent('faq-faq_expanded', parameters: {'plan': planName, 'faq_id': faqId});
}
