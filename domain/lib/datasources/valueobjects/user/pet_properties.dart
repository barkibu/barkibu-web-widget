import 'package:json_annotation/json_annotation.dart';
import 'package:common_barkibu_dart/models/pet_properties.dart';

part 'pet_properties.g.dart';

@JsonSerializable()
class PetPropertiesResponse {
  final int id;
  final String kbKey;
  final String name;
  final String species;
  final String currentPlan;
  final String currentPlanStarted;
  final String currentPlanEnds;

  PetPropertiesResponse(
    this.id,
    this.name,
    this.kbKey,
    this.species,
    this.currentPlan,
    this.currentPlanStarted,
    this.currentPlanEnds,
  );

  factory PetPropertiesResponse.fromJson(Map<String, dynamic> json) => _$PetPropertiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PetPropertiesResponseToJson(this);

  PetProperties toPetProperties() => PetProperties(
        id: id,
        kbKey: kbKey,
        name: name,
        species: species,
        currentPlan: currentPlan,
        currentPlanStarted: currentPlanStarted,
        currentPlanEnds: currentPlanEnds,
      );
}
