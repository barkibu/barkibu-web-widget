import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:intl/intl.dart';

class Assessment {
  final String consultationId;
  final List<Condition> conditions;
  final List<Symptom> symptoms;
  final Urgency urgency;
  final bool finished;
  final DateTime createdAt;

  Assessment({
    this.consultationId,
    this.conditions,
    this.urgency,
    this.finished,
    this.symptoms,
    this.createdAt,
  });

  String get mainSymptom => symptoms?.first?.name ?? '';

  bool get hasConditions => conditions != null && conditions.isNotEmpty;

  bool get hasSymptomArticles => symptoms != null && symptoms.withArticle().isNotEmpty;

  String get reportDate =>
      DateFormat(ServiceLocator.container<LocaleService>().messagesModel().sharedMessages.dateFormat).format(createdAt);

  static List<Assessment> sortedByDate(List<Assessment> assessments) {
    return List.from(assessments)..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}
