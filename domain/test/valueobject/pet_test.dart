import 'package:common_barkibu_dart/datasources/valueobjects/pet/pet.dart';
import 'package:test/test.dart';

void main() {
  var petResponse = PetResponse(
    1,
    'xxx-1',
    'irrelevant',
    'irrelevant',
    false,
    'irrelevant',
    'irrelevant',
    true,
    'irrelevant',
    'irrelevant',
    'irrelevant',
    'irrelevant',
  );

  var petJsonResponse = <String, dynamic>{
    'pet': {
      'id': petResponse.id,
      'species': petResponse.species,
      'gender': petResponse.gender,
      'neutered': petResponse.neutered,
      'breed': petResponse.breed,
      'breedUuid': petResponse.breedUuid,
      'mixedBreed': petResponse.mixedBreed,
      'size': petResponse.size,
      'name': petResponse.name,
      'birthdate': petResponse.birthdate,
      'chipNumber': petResponse.chipNumber,
    }
  };

  group('PetResponse', () {
    test('transform Json to petResponse', () async {
      expect(PetResponse.fromJson(petJsonResponse).id, petResponse.id);
    });
  });

  group('PetsResponse', () {
    var petsJsonResponse = <Map<String, dynamic>>[petJsonResponse, petJsonResponse];

    test('transform Json to list of petResponse', () async {
      var fromJson = PetsResponse.fromJson(petsJsonResponse);

      expect(fromJson[0].id, petResponse.id);
      expect(fromJson.length, 2);
    });
  });

  group('PetRequest', () {
    var petRequest = PetRequest(
      species: 'irrelevant',
      gender: 'irrelevant',
      neutered: false,
      breed: 'irrelevant',
      breedUuid: 'irrelevant',
      mixedBreed: true,
      size: 'irrelevant',
      name: 'irrelevant',
      birthdate: 'irrelevant',
      avatarUrl: 'irrelevant',
      chipNumber: 'irrelevant',
    );

    var petJsonRequest = <String, dynamic>{
      'pet': {
        'species': petRequest.species,
        'gender': petRequest.gender,
        'neutered': petRequest.neutered,
        'breed': petRequest.breed,
        'breedUuid': petRequest.breedUuid,
        'mixedBreed': petRequest.mixedBreed,
        'size': petRequest.size,
        'name': petRequest.name,
        'birthdate': petRequest.birthdate,
        'avatarUrl': petRequest.avatarUrl,
        'chipNumber': petRequest.chipNumber,
      }
    };

    test('transform petRequest to Json', () async {
      expect(petRequest.toJson(), petJsonRequest);
    });

    test('transform Json to petRequest', () async {
      expect(PetRequest.fromJson(petJsonRequest).name, petRequest.name);
    });
  });
}
