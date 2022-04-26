import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/extensions/chat_view_model.dart';

class AivetEventAnalytics {
  final AnalyticsService _analytics;

  AivetEventAnalytics(this._analytics);

  void logEntersFirstInputConcierge() => _logEntersFirstInput('Concierge');

  void logEntersFirstInputAIVet() => _logEntersFirstInput('AIVet');

  void _logEntersFirstInput(String type) => _analytics.logEvent('aivet-enters_first_input', parameters: {'type': type});

  void logPetCreated(String species) => _analytics.logEvent('aivet-adds_pet', parameters: {'species': species});

  void logShowsMenu() => _analytics.logEvent('aivet-shows_menu');

  void logClicksMenu() => _analytics.logEvent('aivet-clicks_menu');

  void logVirtualVetDoesNotUnderstandSymptom(int timesSymptomIsNotUnderstanded) => _analytics
      .logEvent('aivet-does_not_understand_symptom', parameters: {'total_times': timesSymptomIsNotUnderstanded});

  void logVirtualVetShowAnyConditions(int conditionsCount) =>
      _analytics.logEvent('aivet-show_any_conditions', parameters: {'total_conditions': conditionsCount});

  void logVirtualVetShowAnyResult(int conditionsCount, int symptomsCount) =>
      _analytics.logEvent('aivet-show_any_result',
          parameters: {'total_conditions': conditionsCount, 'total_symptom_articles': symptomsCount});

  // When the user ends the chat, where does she/he go?
  void logVirtualVetShowAnySymptomArticles(int symptomsCount) =>
      _analytics.logEvent('aivet-show_any_symptom_articles', parameters: {'total_symptom_articles': symptomsCount});

  void logVirtualVetShowNothing() => _analytics.logEvent('aivet-show_nothing');

  void logVirtualVetHelpful(bool isHelpful) =>
      _analytics.logEvent('aivet-was_helpful', parameters: {'Answer': _analytics.event.yesNo(isHelpful)});

  void _logVirtualVetNextScreen(String screen) {
    _analytics.logEvent('aivet-next_screen', parameters: {
      'screen': screen,
    });
  }

  void logVirtualVetShowReport(Assessment report) => _analytics.logEvent(
        'aivet-shows_report',
        parameters: {
          'conditions': report.conditions.length,
          'symptoms': report.symptoms.where((symptom) => symptom.presence == 'yes').length,
          'symptom_articles': report.symptoms.withArticle().where((symptom) => symptom.presence == 'yes').length,
          'report_urgency': report.urgency.toString().split('.').last,
        },
      );

  void logOpenReport(String source, Assessment report, String urgentTitle) => _analytics.logEvent(
        'aivet-open_report',
        parameters: {
          'source': source,
          'conditions': report.conditions.length,
          'symptoms': report.symptoms.where((symptom) => symptom.presence == 'yes').length,
          'symptom_articles': report.symptoms.withArticle().where((symptom) => symptom.presence == 'yes').length,
          'report_urgency': report.urgency.toString().split('.').last,
          'title_report_urgency_level': urgentTitle,
        },
      );

  void logVirtualVetNextHome() => _logVirtualVetNextScreen('Home');

  void logVirtualVetNextAskAVet() => _logVirtualVetNextScreen('Ask a Vet');

  void logVirtualVetAnotherQuestion() => _analytics.logEvent('aivet-another_question');

  void logVirtualVetSymptomHintOpened() => _analytics.logEvent('aivet-symptom_hint_open');

  void logVirtualVetNextQuestionPresence(String presence) =>
      _analytics.logEvent('aivet-next_question_presence', parameters: {'Presence': presence});

  void logVirtualVetAllAnswersNoOrUnknown() => _analytics.logEvent('aivet-all_answers_no_or_unknown');

  void logVirtualVetEnd() => _analytics.logEvent('aivet-finish');

  void logAnamnesisFinished(Assessment assessment) {
    final symptomsDislayedWithArticle = assessment.symptoms.withArticle().where((symptom) => symptom.presence == 'yes');

    if (assessment.symptoms.where((s) => s.isPresent).length <= 1) {
      logVirtualVetAllAnswersNoOrUnknown();
    }

    if (assessment.hasConditions) {
      logVirtualVetShowAnyConditions(assessment.conditions.length);
    }
    if (!assessment.hasSymptomArticles && !assessment.hasConditions) {
      logVirtualVetShowNothing();
    }

    if (symptomsDislayedWithArticle.isNotEmpty) {
      logVirtualVetShowAnySymptomArticles(symptomsDislayedWithArticle.length);
    }
    logVirtualVetEnd();
    logVirtualVetShowReport(assessment);
  }

  void logChatInteraction(String conversationId, ChatViewModel model) {
    _analytics.logEvent('aivet-turn', parameters: model.toMap({'conversation_id': conversationId}));
  }

  void logOpenSymptomHint(String symptomName) =>
      _analytics.logEvent('aivet-opens_symptom_hint', parameters: {'symptom_hint': symptomName});

  void logShowsSymptomHint(String symptomName) =>
      _analytics.logEvent('aivet-shows_symptom_hint', parameters: {'symptom_hint': symptomName});

  void logMessageViewReportInPetProfile() => _analytics.logEvent('aivet-message_view_report_in_pet_profile');
}
