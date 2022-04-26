import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class RecommendationsEventAnalytics {
  final AnalyticsService _analytics;

  RecommendationsEventAnalytics(this._analytics);

  void logRecommendationsViewList() => _analytics.logEvent('recommendations_view_list');

  void logRecommendationsViewDetail() => _analytics.logEvent('recommendations_view_detail');

  void logRecommendationsClickBuy() => _analytics.logEvent('recommendations_click_buy');
}
