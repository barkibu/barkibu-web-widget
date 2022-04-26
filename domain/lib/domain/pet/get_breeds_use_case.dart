import 'dart:async';

import 'package:common_barkibu_dart/models/breed.dart';
import 'package:common_barkibu_dart/repositories/pet/breeds_repository.dart';

abstract class AutoCompletionUseCase<T> {
  FutureOr<Iterable<T>> search(String value, [Map<String, dynamic> params = const {}]);
}

abstract class GetBreedsUseCase {
  Future<List<Breed>> getBreeds(String query, String species, String locale);
}

class GetBreedsUseCaseImpl implements GetBreedsUseCase, AutoCompletionUseCase<Breed> {
  final BreedsRepository _BreedsRepository;

  GetBreedsUseCaseImpl(this._BreedsRepository);

  @override
  Future<List<Breed>> getBreeds(String query, String species, String locale) async =>
      await _BreedsRepository.getBreeds(query, species, locale);

  @override
  FutureOr<Iterable<Breed>> search(String value, [Map<String, dynamic> params = const {}]) {
    return getBreeds(value, params['species'], params['locale']);
  }
}
