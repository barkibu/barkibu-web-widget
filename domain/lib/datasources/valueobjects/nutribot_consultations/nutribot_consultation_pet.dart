import 'package:json_annotation/json_annotation.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation_pet.dart';

part 'nutribot_consultation_pet.g.dart';

@JsonSerializable()
class NutribotConsultationPetResponse {
  final int id;
  final String name;

  const NutribotConsultationPetResponse({this.id, this.name});

  factory NutribotConsultationPetResponse.fromJson(Map<String, dynamic> json) =>
      _$NutribotConsultationPetResponseFromJson(json);

  NutribotConsultationPet toPet() => NutribotConsultationPet(id: id, name: name);
}
