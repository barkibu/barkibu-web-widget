import 'dart:collection';

import 'package:common_barkibu_dart/models/breed.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_options.g.dart';

@JsonSerializable()
class ConsultationOptionsVO {
  final List<SpecieVO> species;
  final List<SexVO> sexes;
  final Map<String, List<BreedVO>> breeds;
  final List<SymptomVO> symptoms;

  @JsonKey(name: 'pet_name_max_length')
  final int petNameMaxLength;

  @JsonKey(name: 'symptoms_durations')
  final List<SymptomDurationVO> symptomsDurations;

  ConsultationOptionsVO({
    this.species,
    this.sexes,
    this.petNameMaxLength,
    this.breeds,
    this.symptoms,
    this.symptomsDurations,
  });

  static Map<String, List<BreedVO>> _mapBreedsModelToVO(List<Species> species) {
    var breeds = HashMap<String, List<BreedVO>>();

    species.forEach((s) => breeds[s.key] = s.breeds.map((b) => BreedVO.fromModel(b)).toList());

    return breeds;
  }

  factory ConsultationOptionsVO.fromJson(Map<String, dynamic> json) => _$ConsultationOptionsVOFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationOptionsVOToJson(this);

  factory ConsultationOptionsVO.fromModel(ConsultationOptions model) => ConsultationOptionsVO(
        species: model.species.map((e) => SpecieVO.fromModel(e)).toList(),
        sexes: model.sexes.map((e) => SexVO.fromModel(e)).toList(),
        petNameMaxLength: model.petNameMaxLength,
        symptoms: model.symptoms.map((e) => SymptomVO.fromModel(e)),
        symptomsDurations: model.symptomsDurations.map((e) => SymptomDurationVO.fromModel(e)),
        breeds: _mapBreedsModelToVO(model.species),
      );

  ConsultationOptions toConsultationOptions() => ConsultationOptions(
        species: species.where((e) => (e.key == 'dog' || e.key == 'cat')).map((v) => v.toModel(breeds[v.key])).toList(),
        sexes: sexes.map((v) => v.toModel()).toList(),
        petNameMaxLength: petNameMaxLength,
        symptoms: symptoms.map((v) => v.toModel()).toList(),
        symptomsDurations: symptomsDurations.map((v) => v.toModel()).toList(),
      );
}

@JsonSerializable()
class SymptomVO {
  final String key;
  final String name;

  SymptomVO({this.key, this.name});

  factory SymptomVO.fromJson(Map<String, dynamic> json) => _$SymptomVOFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomVOToJson(this);

  factory SymptomVO.fromModel(Symptom model) => SymptomVO(key: model.key, name: model.name);

  Symptom toModel() => Symptom(key: key, name: name);
}

@JsonSerializable()
class SymptomDurationVO {
  final String label;
  final int min;
  final int max;

  SymptomDurationVO({this.label, this.min, this.max});

  factory SymptomDurationVO.fromJson(Map<String, dynamic> json) => _$SymptomDurationVOFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomDurationVOToJson(this);

  factory SymptomDurationVO.fromModel(SymptomDuration model) =>
      SymptomDurationVO(label: model.label, min: model.min, max: model.max);

  SymptomDuration toModel() => SymptomDuration(label: label, min: min, max: max);
}

@JsonSerializable()
class SpecieVO {
  final String key;
  final String label;
  final String img;

  SpecieVO({this.key, this.label, this.img});

  factory SpecieVO.fromJson(Map<String, dynamic> json) => _$SpecieVOFromJson(json);

  Map<String, dynamic> toJson() => _$SpecieVOToJson(this);

  factory SpecieVO.fromModel(Species model) => SpecieVO(key: model.key, label: model.label, img: model.img);

  Species toModel(List<BreedVO> breeds) => Species(
        key: key,
        label: label,
        img: img,
        breeds: breeds?.map((b) => b.toModel())?.toList(),
      );
}

@JsonSerializable()
class SexVO {
  final String key;
  final String label;

  SexVO({this.key, this.label});

  factory SexVO.fromJson(Map<String, dynamic> json) => _$SexVOFromJson(json);

  Map<String, dynamic> toJson() => _$SexVOToJson(this);

  factory SexVO.fromModel(Sex model) => SexVO(key: model.key, label: model.label);

  Sex toModel() => Sex(key: key, label: label);
}

@JsonSerializable()
class BreedVO {
  final String key;
  final String name;

  BreedVO({this.key, this.name});

  factory BreedVO.fromJson(Map<String, dynamic> json) => _$BreedVOFromJson(json);

  Map<String, dynamic> toJson() => _$BreedVOToJson(this);

  factory BreedVO.fromModel(Breed model) => BreedVO(key: model.key, name: model.name);

  Breed toModel() => Breed(key: key, name: name);
}
