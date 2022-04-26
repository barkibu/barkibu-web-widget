import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_symptoms.g.dart';

@JsonSerializable()
class SearchSymptomResponse {
  final String key;
  final String name;
  final bool duration;
  final bool frequency;

  const SearchSymptomResponse({this.key, this.name, this.duration, this.frequency});

  factory SearchSymptomResponse.fromJson(Map<String, dynamic> json) => _$SearchSymptomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSymptomResponseToJson(this);

  SymptomFound toSymptomFound() => SymptomFound(
        symptom: Symptom(key: key, name: name),
        duration: duration,
        frequency: frequency,
      );
}

class SearchSymptomsResponse {
  static List<SearchSymptomResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic symptom) => SearchSymptomResponse.fromJson(symptom))?.toList() ?? [];
}
