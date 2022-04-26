import 'dart:convert';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/search/search_breeds.dart';
import 'package:common_barkibu_dart/models/breed.dart';

abstract class BreedDatasource {
  Future<List<Breed>> getBreeds({String query, String species, String locale});

  Future<void> persistBreeds(List<Breed> breeds, {String query, String species, String locale});

  Duration get maxStorageAge;

  Future<void> deleteAll();
}

class BreedDatasourceImpl implements BreedDatasource {
  final CacheStorage _cacheStorage;
  static final storagePrefix = 'breed';

  BreedDatasourceImpl(this._cacheStorage);

  @override
  Duration get maxStorageAge => Duration(days: 7);

  @override
  Future<List<Breed>> getBreeds({String query, String species, String locale}) async {
    final cachedData =
        await (_cacheStorage.readUntilDuration('${storagePrefix}/${query}/${species}/${locale}', maxStorageAge));

    if (cachedData == null) {
      return null;
    }

    final breedsList = SearchBreedsResponse.fromJson(jsonDecode(cachedData));

    return breedsList.map((SearchBreedResponse breed) => breed.toBreed()).toList();
  }

  @override
  Future<void> persistBreeds(List<Breed> breeds, {String query, String species, String locale}) async {
    final breedsResponse =
        breeds.map((Breed breed) => SearchBreedResponse(breed.key, breed.breedUuid, breed.name, breed.size)).toList();
    await _cacheStorage.write('${storagePrefix}/${query}/${species}/${locale}', jsonEncode(breedsResponse));
  }

  @override
  Future<void> deleteAll() async {
    await _cacheStorage.delete('${storagePrefix}');
  }
}
