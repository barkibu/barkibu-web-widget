import 'package:common_barkibu_dart/datasources/valueobjects/aivet/condition.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/aivet/symptom.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment.g.dart';

@JsonSerializable()
class AssessmentResponse {
  final String consultationId;
  final bool finished;
  final Urgency urgency;
  final List<SymptomResponse> symptoms;
  final List<ConditionResponse> conditions;
  final DateTime createdAt;

  const AssessmentResponse(
    this.consultationId,
    this.finished,
    this.urgency,
    this.conditions,
    this.createdAt,
    this.symptoms,
  );

  factory AssessmentResponse.fromJson(Map<String, dynamic> json) => _$AssessmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentResponseToJson(this);

  Assessment toAssessment() => Assessment(
        consultationId: consultationId,
        conditions: conditions.map((c) => c.toCondition()).toList(),
        urgency: urgency,
        finished: finished,
        symptoms: symptoms.map((c) => c.toSymptom()).toList(),
        createdAt: createdAt,
      );
}
