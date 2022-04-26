import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/features.dart';

abstract class GetFeaturesUserUseCase {
  Future<Features> getFeaturesUser();
  Future<void> setFeaturesUser();
}

class GetFeaturesUserUseCaseImpl implements GetFeaturesUserUseCase {
  final FeatureFlagsRepository _featureFlagsRepository;
  final Configuration configuration;
  GetFeaturesUserUseCaseImpl(this._featureFlagsRepository, this.configuration);

  @override
  Future<Features> getFeaturesUser() async => await _featureFlagsRepository.getFeatureFlagsUser();

  @override
  Future<void> setFeaturesUser() async {
    if (configuration.apiFeatureFlagsEnabled) {
      final features = await _featureFlagsRepository.getFeatureFlagsUser();
      configuration.telehealthEnabled = features.telehealth;
      configuration.insuranceEnabled = features.insurance;
    }
  }
}
