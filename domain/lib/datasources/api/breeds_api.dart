import 'package:chopper/chopper.dart';

part 'breeds_api.chopper.dart';

abstract class BreedsApi {
  Future<Response> getBreeds(String query, String species, String locale);
}

@ChopperApi(baseUrl: 'breeds')
abstract class BreedsApiImpl extends ChopperService implements BreedsApi {
  static BreedsApi create([ChopperClient client]) => _$BreedsApiImpl(client);

  @Get()
  @override
  Future<Response> getBreeds(@Query() String query, @Query() String species, @Query() locale);
}
