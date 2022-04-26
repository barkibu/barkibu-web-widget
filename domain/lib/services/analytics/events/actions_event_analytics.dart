import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class ActionsEventAnalytics {
  final AnalyticsService _analytics;

  ActionsEventAnalytics(this._analytics);

  void logScreenshotTaken(String route) => _analytics.logEvent('actions-screenshot', parameters: {'screen': route});
}
