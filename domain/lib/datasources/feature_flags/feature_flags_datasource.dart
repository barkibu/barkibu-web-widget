import 'package:common_barkibu_dart/datasources/api/feature_flags_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/features/features.dart';
import 'package:common_barkibu_dart/models/features.dart';

abstract class FeatureFlagsDatasource {
  Future<Features> getFeatureFlagsUser();
}

class FeatureFlagsDatasourceImpl implements FeatureFlagsDatasource {
  final FeatureFlagApi _featureFlagApi;

  FeatureFlagsDatasourceImpl(this._featureFlagApi);

  @override
  Future<Features> getFeatureFlagsUser() async {
    var response = await _featureFlagApi.getFeatureFlagsUser();
    return response.isSuccessful ? FeaturesResponse.fromJson(response.body).toFeatures() : null;
  }
}
