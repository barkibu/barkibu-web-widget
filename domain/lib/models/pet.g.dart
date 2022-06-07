// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    id: json['id'] as int,
    kbKey: json['kbKey'] as String,
    species: json['species'] as String,
    sex: json['sex'] as String,
    neutered: json['neutered'] as bool,
    breed: json['breed'] as String,
    breedUuid: json['breedUuid'] as String,
    mixedBreed: json['mixedBreed'] as bool,
    size: json['size'] as String,
    features: json['features'] == null
        ? null
        : Features.fromJson(json['features'] as Map<String, dynamic>),
    name: json['name'] as String,
    avatarUrl: json['avatarUrl'] as String,
    foodPreferences: json['foodPreferences'] == null
        ? null
        : FoodPreferences.fromJson(
            json['foodPreferences'] as Map<String, dynamic>),
    fullAge: json['fullAge'] as String,
    birthdate: json['birthdate'] as String,
  )..queries = json['queries'] as int;
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'kbKey': instance.kbKey,
      'species': instance.species,
      'sex': instance.sex,
      'neutered': instance.neutered,
      'breed': instance.breed,
      'breedUuid': instance.breedUuid,
      'mixedBreed': instance.mixedBreed,
      'size': instance.size,
      'avatarUrl': instance.avatarUrl,
      'birthdate': instance.birthdate,
      'foodPreferences': instance.foodPreferences,
      'fullAge': instance.fullAge,
      'queries': instance.queries,
      'name': instance.name,
      'features': instance.features,
    };
