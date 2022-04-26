import 'dart:convert';

import 'package:common_barkibu_dart/datasources/local/breed_datasource.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/search/search_breeds.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/datasource_mocks.dart';

void main() {
  final mockStorage = MockCacheStorage();
  final dataSource = BreedDatasourceImpl(mockStorage);
  final queryStringParams = ['breed', 'params', 'other'];
  final cacheRoute = BreedDatasourceImpl.storagePrefix + '/' + ['breed', 'params', 'other'].join('/');
  final json = jsonEncode([SearchBreedResponse('key', 'breedUuid', 'name', 'size')]);

  group('Local BreedDatasource (unit)', () {
    group('getBreeds', () {
      test('returns null when cache is empty', () async {
        when(mockStorage.readUntilDuration(cacheRoute, dataSource.maxStorageAge)).thenAnswer((_) async => null);

        final response = await dataSource.getBreeds(
            query: queryStringParams[0], species: queryStringParams[1], locale: queryStringParams[2]);

        expect(response, null);
      });

      test('returns a list of breeds when cache has data', () async {
        when(mockStorage.readUntilDuration(cacheRoute, dataSource.maxStorageAge)).thenAnswer((_) async => json);

        final response = await dataSource.getBreeds(
            query: queryStringParams[0], species: queryStringParams[1], locale: queryStringParams[2]);

        expect(response is List<Breed>, true);
      });
    });

    group('persistBreeds', () {
      test('writes to cache', () async {
        when(mockStorage.write(cacheRoute, json)).thenAnswer((_) async => null);

        await dataSource.persistBreeds([Breed(key: 'key', breedUuid: 'breedUuid', name: 'name', size: 'size')],
            query: queryStringParams[0], species: queryStringParams[1], locale: queryStringParams[2]);
        verify(mockStorage.write(cacheRoute, json)).called(1);
      });
    });

    group('deleteAll', () {
      test('deletes root breeds', () async {
        when(mockStorage.delete(BreedDatasourceImpl.storagePrefix)).thenAnswer((_) async => null);

        await dataSource.deleteAll();
        verify(mockStorage.delete(BreedDatasourceImpl.storagePrefix)).called(1);
      });
    });
  });
}
