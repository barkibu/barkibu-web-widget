import 'package:common_barkibu_dart/datasources/feature_flags/feature_flags_datasource.dart';
import 'package:common_barkibu_dart/models/features.dart';

abstract class FeatureFlagsRepository {
  Future<Features> getFeatureFlagsUser();
}

class FeatureFlagsRepositoryImpl implements FeatureFlagsRepository {
  final FeatureFlagsDatasource _featureFlagsDatasource;

  FeatureFlagsRepositoryImpl(this._featureFlagsDatasource);

  @override
  Future<Features> getFeatureFlagsUser() {
    return _featureFlagsDatasource.getFeatureFlagsUser();
  }
}
