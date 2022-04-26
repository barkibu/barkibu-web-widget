import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/extensions/list_extensions.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:intl/intl.dart';

abstract class EntityWithArticle {
  final String name;
  final String article;

  EntityWithArticle(this.name, this.article);
}

class Anamnesis {
  final String consultationId;
  final List<Condition> conditions;
  final List<Symptom> invalidSymptoms;
  final List<Symptom> symptoms;
  final Urgency urgency;
  final bool shouldStop;
  final NextQuestion nextQuestion;
  final DateTime createdAt;

  Anamnesis({
    this.consultationId,
    this.conditions,
    this.urgency,
    this.shouldStop,
    this.nextQuestion,
    this.invalidSymptoms,
    this.symptoms,
    this.createdAt,
  });

  String get mainSymptom => symptoms?.first?.name ?? '';

  bool get hasConditions => conditions != null && conditions.isNotEmpty;

  bool get hasSymptomArticles => symptoms != null && symptoms.withArticle().isNotEmpty;

  String get reportDate =>
      DateFormat(ServiceLocator.container<LocaleService>().messagesModel().sharedMessages.dateFormat).format(createdAt);

  static List<Anamnesis> sortedByDate(List<Anamnesis> anamneses) {
    return List.from(anamneses)..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}

class Condition extends EntityWithArticle {
  final String key;
  @override
  final String name;
  final Urgency urgency;
  @override
  final String article;
  final String shortDescription;
  final String diagnosis;
  final String treatment;
  final String prevention;
  final String firstAid;
  final String predispositionFactors;
  final double score;
  final int usualness;

  Condition({
    this.key,
    this.name,
    this.urgency,
    this.article,
    this.shortDescription,
    this.diagnosis,
    this.treatment,
    this.prevention,
    this.firstAid,
    this.predispositionFactors,
    this.score,
    this.usualness,
  }) : super(name, article);

  bool get hasArticle => !article.isNullEmptyOrWhitespace;
}

class NextQuestion {
  final String symptomKey;
  final String symptomName;
  final String question;
  final String hint;
  final AnswersType answersType;
  final bool duration;
  final bool frequency;
  final bool urgency;

  NextQuestion({
    this.symptomKey,
    this.symptomName,
    this.question,
    this.hint,
    this.answersType,
    this.duration,
    this.frequency,
    this.urgency,
  });
}

enum AnswersType { YesNoUnknown }
