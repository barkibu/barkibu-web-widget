import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/extensions/extensions.dart';
import 'package:common_barkibu_dart/models/features.dart';
import 'package:common_barkibu_dart/models/food_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  int id;
  String kbKey;
  String species;
  String sex;
  bool neutered;
  String breed;
  String breedUuid;
  bool mixedBreed;
  String size;
  String _name;
  String avatarUrl;
  String birthdate;
  FoodPreferences foodPreferences;
  Features _features;
  String fullAge;
  @JsonKey(ignore: true)
  String chipNumber;
  int queries = 0;

  Pet({
    this.id,
    this.kbKey,
    this.species,
    this.sex,
    this.neutered,
    this.breed,
    this.breedUuid,
    this.mixedBreed,
    this.size,
    Features features,
    String name,
    this.avatarUrl,
    this.foodPreferences,
    this.fullAge,
    this.chipNumber,
    this.birthdate,
  }) {
    this.name = name;
    _features = features ?? Features(insurance: false, telehealth: false);
  }

  String get name => _name;

  double get percentageOfCompletedProfile {
    var fields = <String>['name', 'species', 'sex', 'neutered', 'birthdate', 'chipNumber'];
    var filledFields = fields.where((field) => getProp(field) != null && getProp(field) != '').length;
    return (filledFields / fields.length);
  }

  dynamic getProp(String field) => <String, dynamic>{
        'name': name,
        'species': species,
        'sex': sex,
        'neutered': neutered,
        'birthdate': birthdate,
        'chipNumber': chipNumber,
      }[field];

  set name(String petName) {
    _name = petName?.capitalize();
  }

  int get ageInYears => (DateTime.parse(birthdate).difference(DateTime.now()).inDays / 365).truncate();

  /// Returns true if the required attributes for AiVet to work correctly are filled
  bool isValidForAiVet() {
    return name != null && sex != null && species != null && neutered != null && birthdate != null;
  }

  bool isValidForForm() {
    return nameIsValid() && speciesIsValid() && sexIsValid() && castratedIsValid();
  }

  Features get features => _features;

  set features(Features petFeatures) {
    _features = petFeatures;
  }

  String getAvatarUrl() => '${ServiceLocator.container<Configuration>().backendUrl}/pets/${id}/avatar';

  bool nameIsValid() {
    return name != null && name.length >= 2 && name.length <= 255;
  }

  bool speciesIsValid() {
    return species != null;
  }

  bool sexIsValid() {
    return sex != null;
  }

  bool castratedIsValid() {
    return neutered != null;
  }

  Pet createCopy() {
    var pet = Pet(
      id: id,
      kbKey: kbKey,
      species: species,
      sex: sex,
      neutered: neutered,
      breed: breed,
      breedUuid: breedUuid,
      mixedBreed: mixedBreed,
      size: size,
      name: name,
      birthdate: birthdate,
      avatarUrl: avatarUrl,
      foodPreferences: foodPreferences,
      fullAge: fullAge,
      chipNumber: chipNumber,
    );
    pet.features = features;
    return pet;
  }

  factory Pet.copyFrom(Pet pet) {
    var copyPet = Pet(
      id: pet.id,
      kbKey: pet.kbKey,
      species: pet.species,
      sex: pet.sex,
      neutered: pet.neutered,
      breed: pet.breed,
      breedUuid: pet.breedUuid,
      mixedBreed: pet.mixedBreed,
      size: pet.size,
      name: pet.name,
      birthdate: pet.birthdate,
      avatarUrl: pet.avatarUrl,
      foodPreferences: pet.foodPreferences,
      fullAge: pet.fullAge,
      chipNumber: pet.chipNumber,
    );

    copyPet.features = pet.features;
    return copyPet;
  }

  Map<String, dynamic> toJson() => _$PetToJson(this);

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
