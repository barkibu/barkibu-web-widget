import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class MyAccountEventAnalytics {
  final AnalyticsService _analytics;

  MyAccountEventAnalytics(this._analytics);

  void logMyAccountView() => _analytics.logEvent('my_account-view');

  void logMyAccountEdit() => _analytics.logEvent('my_account-edit');
}
