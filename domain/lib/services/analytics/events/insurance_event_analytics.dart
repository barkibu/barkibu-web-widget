import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class InsuranceEventAnalytics {
  final AnalyticsService _analytics;

  InsuranceEventAnalytics(this._analytics);

  void logInsuranceView() => _analytics.logEvent('insurance-view');

  void logInsuranceBarkibuInformation() => _analytics.logEvent('insurance-more_info');

  void logInsuranceClaim() => _analytics.logEvent('insurance-claim');

  void logInsuranceQuote() => _analytics.logEvent('insurance-quote');
}
