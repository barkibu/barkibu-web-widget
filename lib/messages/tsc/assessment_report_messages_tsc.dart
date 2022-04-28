import 'package:common_barkibu_dart/messages/assessmentReportMessages.i18n.dart';

class AssessmentReportMessages_tsc extends AssessmentReportMessages {
  const AssessmentReportMessages_tsc();

  @override
  String get title => 'Virtual vet report';

  @override
  String get urgentBodyCondition =>
      "Some of {pet}'s symptoms could be related to urgent issues. Based on this information, we recommend speaking with a vet very soon.";

  @override
  String get urgentBodySymptom =>
      "Some of {pet}'s symptoms could be related to urgent issues. Based on this information, we recommend speaking with a vet very soon.";

  @override
  String get notUrgentBody =>
      "Based on your answers, we haven't detected an urgent condition. However, if the symptoms continue or you're concerned about {pet}'s state, we recommend visiting your vet or local clinic.";

  @override
  String get treatedAtHome => 'Can be treated at home';
}