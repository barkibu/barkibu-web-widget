import 'package:chopper/chopper.dart';

part 'feature_flags_api.chopper.dart';

abstract class FeatureFlagApi {
  Future<Response> getFeatureFlagsUser();
}

@ChopperApi(baseUrl: 'feature_flags')
abstract class FeatureFlagApiImpl extends ChopperService implements FeatureFlagApi {
  static FeatureFlagApi create([ChopperClient client]) => _$FeatureFlagApiImpl(client);

  @Get()
  @override
  Future<Response> getFeatureFlagsUser();
}
