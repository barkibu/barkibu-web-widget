import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class NutribotEventAnalytics {
  final AnalyticsService _analytics;

  NutribotEventAnalytics(this._analytics);

  void logNutribotStart() => _analytics.logEvent('nutribot-start');

  void logNutribotHelpful(bool isHelpful) =>
      _analytics.logEvent('nutribot-was_helpful', parameters: {'answer': _analytics.event.yesNo(isHelpful)});

  void logNutribotShowRecommendation(int numberOfFoodShowed) =>
      _analytics.logEvent('nutribot-show_recommendation', parameters: {'total_food': numberOfFoodShowed});

  void logNutribotViewRecommendation() => _analytics.logEvent('nutribot-view_recommendation');

  void logNutribotClickBuy() => _analytics.logEvent('nutribot-click_buy');
}
