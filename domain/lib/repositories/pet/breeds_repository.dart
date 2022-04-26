import 'package:common_barkibu_dart/datasources/local/breed_datasource.dart' as local;
import 'package:common_barkibu_dart/datasources/pet/breeds_datasource.dart';
import 'package:common_barkibu_dart/models/breed.dart';

abstract class BreedsRepository {
  Future<List<Breed>> getBreeds(String query, String species, String locale);
}

class BreedsRepositoryImpl implements BreedsRepository {
  final BreedDatasource _breedDatasource;
  final local.BreedDatasource _localBreedDatasource;

  BreedsRepositoryImpl(this._breedDatasource, this._localBreedDatasource);

  @override
  Future<List<Breed>> getBreeds(String query, String species, String locale) async {
    final cachedBreeds = await _localBreedDatasource.getBreeds(query: query, species: species, locale: locale);
    if (cachedBreeds != null) {
      return cachedBreeds;
    }
    final serverBreeds = await _breedDatasource.getBreeds(query: query, species: species, locale: locale);
    await _localBreedDatasource.persistBreeds(serverBreeds, query: query, species: species, locale: locale);
    return serverBreeds;
  }
}
