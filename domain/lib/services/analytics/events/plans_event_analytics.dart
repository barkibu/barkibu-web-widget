import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class PlansEventAnalytics {
  final AnalyticsService _analytics;

  PlansEventAnalytics(this._analytics);

  void logHealthPlansView(String planName, String source) =>
      _analytics.logEvent('plans-views_health_plans', parameters: {'plan': planName, 'source': source});

  void logHealthPlanDetailsView() => _analytics.logEvent('plans-view_details');

  void logBenefitsInformation(String planName) =>
      _analytics.logEvent('plans-benefits_more_info', parameters: {'plan_name': planName});

  void logHealthPlansBarkibuInformation() => _analytics.logEvent('plans-more_info');

  void logBuyHealthPlan(String planName) =>
      _analytics.logEvent('plans-clicks_plans_CTA', parameters: {'plan': planName});

  void logFaqHealthPlan(String planName) =>
      _analytics.logEvent('plans-clicks_plans_FAQ', parameters: {'plan': planName});
}
