import 'package:common_barkibu_dart/models/pet.dart';

class PetFormModel {
  int id;
  String name;
  String species;
  String breed;
  String breedUuid;
  String size;
  String sex;
  dynamic neutered;
  String birthdate;

  PetFormModel(Pet pet) {
    id = pet.id;
    name = pet.name;
    species = pet.species ?? '';
    breed = pet.breed ?? '';
    breedUuid = pet.breedUuid ?? '';
    size = pet.size ?? '';
    sex = pet.sex ?? '';
    neutered = pet.neutered ?? '';
    birthdate = pet.birthdate ?? '';
  }

  Pet toPet() {
    return Pet(
        id: id,
        name: name,
        species: species,
        breed: breed,
        breedUuid: breedUuid,
        size: size,
        sex: sex,
        neutered: neutered == 'true',
        birthdate: birthdate);
  }
}
