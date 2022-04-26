import 'package:common_barkibu_dart/datasources/valueobjects/aivet/condition.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/aivet/symptom.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anamnesis.g.dart';

@JsonSerializable()
class AnamnesisRequest {
  final List<SymptomRequest> symptoms;
  String consultationId;

  AnamnesisRequest(this.consultationId, this.symptoms);

  factory AnamnesisRequest.fromJson(Map<String, dynamic> json) => _$AnamnesisRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnamnesisRequestToJson(this);
}

@JsonSerializable()
class SymptomRequest {
  final String key;
  final String presence;
  final String duration;
  final String frequency;

  SymptomRequest(this.key, this.presence, [this.duration = 'unknown', this.frequency = 'unknown']);

  factory SymptomRequest.fromJson(Map<String, dynamic> json) => _$SymptomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomRequestToJson(this);
}

@JsonSerializable()
class AnamnesisResponse {
  final String consultationId;
  final bool shouldStop;
  final Urgency urgency;
  final List<SymptomResponse> invalidSymptoms;
  final List<SymptomResponse> symptoms;
  final List<ConditionResponse> conditions;
  final NextQuestionResponse nextQuestion;
  final DateTime createdAt;

  const AnamnesisResponse(
    this.consultationId,
    this.shouldStop,
    this.urgency,
    this.conditions,
    this.nextQuestion,
    this.createdAt,
    this.invalidSymptoms,
    this.symptoms,
  );

  factory AnamnesisResponse.fromJson(Map<String, dynamic> json) => _$AnamnesisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnamnesisResponseToJson(this);

  Anamnesis toAnamnesis() => Anamnesis(
        consultationId: consultationId,
        conditions: conditions.map((c) => c.toCondition()).toList(),
        invalidSymptoms: invalidSymptoms.map((c) => c.toSymptom()).toList(),
        urgency: urgency,
        shouldStop: shouldStop,
        symptoms: symptoms.map((c) => c.toSymptom()).toList(),
        nextQuestion: nextQuestion?.toNextQuestion(),
        createdAt: createdAt,
      );
}

@JsonSerializable()
class NextQuestionResponse {
  final String symptomKey;
  final String symptomName;
  final String question;
  final String hint;
  final String answersType;
  final bool duration;
  final bool frequency;
  final bool urgency;

  NextQuestionResponse(
    this.symptomKey,
    this.symptomName,
    this.question,
    this.hint,
    this.answersType,
    this.duration,
    this.frequency,
    this.urgency,
  );

  factory NextQuestionResponse.fromJson(Map<String, dynamic> json) => _$NextQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NextQuestionResponseToJson(this);

  NextQuestion toNextQuestion() => NextQuestion(
      symptomKey: symptomKey,
      symptomName: symptomName,
      question: question,
      hint: hint,
      answersType: AnswersType.values.firstWhere((answer) => answer.toString() == 'AnswersType.' + answersType),
      duration: duration,
      frequency: frequency,
      urgency: urgency);
}
