import 'package:common_barkibu_dart/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class ConditionResponse {
  final String key;
  final String name;
  final Urgency urgency;
  final String article;
  final String shortDescription;
  final String diagnosis;
  final String treatment;
  final String prevention;
  final String firstAid;
  final String predispositionFactors;
  final double score;
  final int usualness;

  ConditionResponse(
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
  );

  factory ConditionResponse.fromJson(Map<String, dynamic> json) => _$ConditionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionResponseToJson(this);

  Condition toCondition() => Condition(
        key: key,
        name: name,
        urgency: urgency,
        article: article,
        shortDescription: shortDescription,
        diagnosis: diagnosis,
        treatment: treatment,
        prevention: prevention,
        firstAid: firstAid,
        predispositionFactors: predispositionFactors,
        score: score,
        usualness: usualness,
      );
}
