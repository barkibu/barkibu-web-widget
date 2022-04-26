import 'package:common_barkibu_dart/common_barkibu_dart.dart';

class AssessmentReportViewModel {
  final String consultationId;
  final Pet pet;
  final List<Symptom> symptoms;
  final List<Condition> conditions;
  final Urgency urgency;
  final DateTime createdAt;

  AssessmentReportViewModel._({
    this.consultationId,
    // ignore: always_require_non_null_named_parameters
    this.pet,
    this.symptoms,
    this.conditions,
    this.urgency,
    this.createdAt,
  }) : assert(pet != null && symptoms != null && conditions != null && urgency != null && createdAt != null);

  // ignore: always_require_non_null_named_parameters
  factory AssessmentReportViewModel.fromAssessment({Pet pet, Assessment assessment}) {
    assert(pet != null && assessment != null);
    return AssessmentReportViewModel._(
      consultationId: assessment.consultationId,
      pet: pet.createCopy(),
      symptoms: assessment.symptoms != null ? assessment.symptoms.where((symptom) => symptom.isPresent).toList() : [],
      conditions: assessment.conditions != null ? assessment.conditions.copy() : [],
      urgency: assessment.urgency,
      createdAt: assessment.createdAt ?? DateTime.now(),
    );
  }

  bool hasUrgentConditions() => urgency != Urgency.low && conditions.hasAnyUrgent();
}
