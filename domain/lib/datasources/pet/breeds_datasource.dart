import 'package:common_barkibu_dart/datasources/api/breeds_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/search/search_breeds.dart';
import 'package:common_barkibu_dart/models/breed.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/monitoring_service.dart';

abstract class BreedDatasource {
  Future<List<Breed>> getBreeds({String query, String species, String locale});
}

class BreedsDatasourceImpl implements BreedDatasource {
  final BreedsApi _breedsApi;

  BreedsDatasourceImpl(this._breedsApi);

  @override
  Future<List<Breed>> getBreeds({
    String query,
    String species,
    String locale,
  }) async {
    var response = await _breedsApi.getBreeds(query, species, locale);

    if (response.isSuccessful) {
      return SearchBreedsResponse.fromJson(response.body).map((SearchBreedResponse breed) => breed.toBreed()).toList();
    } else {
      final monitoringService = ServiceLocator.container<MonitoringService>();
      monitoringService.capture(event: response.error, severityLevel: SeverityLevel.ERROR);
    }
    return [];
  }
}
