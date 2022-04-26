import 'package:chopper/chopper.dart';
part 'user_properties_api.chopper.dart';

abstract class UserPropertiesApi {
  Future<Response> getProperties();
}

@ChopperApi(baseUrl: 'user_properties')
abstract class UserPropertiesApiImpl extends ChopperService implements UserPropertiesApi {
  static UserPropertiesApi create([ChopperClient client]) => _$UserPropertiesApiImpl(client);

  @Get()
  @override
  Future<Response> getProperties();
}
