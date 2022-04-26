import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/features.dart';

abstract class GetPetFeaturesUseCase {
  Future<Features> getFeatures(int id);
}

class GetPetFeaturesUseCaseImpl implements GetPetFeaturesUseCase {
  final PetRepository _petRepository;
  final Configuration _configuration;

  GetPetFeaturesUseCaseImpl(this._petRepository, this._configuration);

  @override
  Future<Features> getFeatures(int id) async =>
      _configuration.apiFeatureFlagsEnabled ? await _petRepository.getFeatures(id) : Features();
}
