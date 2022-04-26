import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class AssessmentReportEventAnalytics {
  final AnalyticsService _analytics;

  AssessmentReportEventAnalytics(this._analytics);

  void logReportClicksTalkToAVet() => _analytics.logEvent('assessment_report-clicks_talk_to_a_vet');

  void logReportClicksExport() => _analytics.logEvent('assessment_report-clicks_export');

  void logReportClicksOpenConditionArticle(String conditionName, String urgency) =>
      _analytics.logEvent('assessment_report-open_condition_article', parameters: {
        'condition_name': conditionName,
        'condition_urgency': urgency,
      });

  void logReportClicksOpenSymptomArticle(String symptomName, String urgency) =>
      _analytics.logEvent('assessment_report-open_symptom_article', parameters: {
        'symptom_name': symptomName,
        'symptom_urgency': urgency,
      });

  void logReportShowConditionOrSymptom(bool isCondition, String name, String urgency, bool hasArticle, String source) {
    isCondition
        ? logReportShowCondition(name, urgency, hasArticle, source)
        : logReportShowSymptom(name, urgency, hasArticle, source);
  }

  void logReportShowCondition(String conditionName, String urgency, bool hasArticle, String source) =>
      _analytics.logEvent('assessment_report-show_condition', parameters: {
        'condition_name': conditionName,
        'condition_urgency': urgency,
        'has_article': hasArticle,
        'source': source,
      });

  void logReportShowSymptom(String symptomName, String urgency, bool hasArticle, String source) =>
      _analytics.logEvent('assessment_report-show_symptom', parameters: {
        'symptom_name': symptomName,
        'symptom_urgency': urgency,
        'has_article': hasArticle,
        'source': source,
      });
}
