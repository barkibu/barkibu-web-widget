// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationOptionsVO _$ConsultationOptionsVOFromJson(
    Map<String, dynamic> json) {
  return ConsultationOptionsVO(
    species: (json['species'] as List)
        ?.map((e) =>
            e == null ? null : SpecieVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sexes: (json['sexes'] as List)
        ?.map(
            (e) => e == null ? null : SexVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    petNameMaxLength: json['pet_name_max_length'] as int,
    breeds: (json['breeds'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : BreedVO.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    symptoms: (json['symptoms'] as List)
        ?.map((e) =>
            e == null ? null : SymptomVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    symptomsDurations: (json['symptoms_durations'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomDurationVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConsultationOptionsVOToJson(
        ConsultationOptionsVO instance) =>
    <String, dynamic>{
      'species': instance.species,
      'sexes': instance.sexes,
      'breeds': instance.breeds,
      'symptoms': instance.symptoms,
      'pet_name_max_length': instance.petNameMaxLength,
      'symptoms_durations': instance.symptomsDurations,
    };

SymptomVO _$SymptomVOFromJson(Map<String, dynamic> json) {
  return SymptomVO(
    key: json['key'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SymptomVOToJson(SymptomVO instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

SymptomDurationVO _$SymptomDurationVOFromJson(Map<String, dynamic> json) {
  return SymptomDurationVO(
    label: json['label'] as String,
    min: json['min'] as int,
    max: json['max'] as int,
  );
}

Map<String, dynamic> _$SymptomDurationVOToJson(SymptomDurationVO instance) =>
    <String, dynamic>{
      'label': instance.label,
      'min': instance.min,
      'max': instance.max,
    };

SpecieVO _$SpecieVOFromJson(Map<String, dynamic> json) {
  return SpecieVO(
    key: json['key'] as String,
    label: json['label'] as String,
    img: json['img'] as String,
  );
}

Map<String, dynamic> _$SpecieVOToJson(SpecieVO instance) => <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'img': instance.img,
    };

SexVO _$SexVOFromJson(Map<String, dynamic> json) {
  return SexVO(
    key: json['key'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$SexVOToJson(SexVO instance) => <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
    };

BreedVO _$BreedVOFromJson(Map<String, dynamic> json) {
  return BreedVO(
    key: json['key'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BreedVOToJson(BreedVO instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
