import 'package:common_barkibu_dart/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'symptom.g.dart';

@JsonSerializable()
class SymptomResponse {
  final String key;
  final String name;
  final String presence;
  final Urgency urgency;
  final String article;

  SymptomResponse(this.key, this.name, this.presence, this.urgency, this.article);

  factory SymptomResponse.fromJson(Map<String, dynamic> json) => _$SymptomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomResponseToJson(this);

  Symptom toSymptom() => Symptom(
        key: key,
        name: name,
        article: article,
        urgency: urgency,
        presence: presence,
      );
}
