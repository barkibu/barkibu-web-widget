import 'package:chopper/chopper.dart';

part 'token_api.chopper.dart';

abstract class TokenApi {
  Future<Response> createToken();
}

@ChopperApi(baseUrl: 'tokens')
abstract class TokenApiImpl extends ChopperService implements TokenApi {
  static TokenApi create([ChopperClient client]) => _$TokenApiImpl(client);

  @Post()
  @override
  Future<Response> createToken();
}
