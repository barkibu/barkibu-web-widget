import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/sign_in.dart';

part 'auth_api.chopper.dart';

abstract class AuthApi {
  Future<Response> signIn(SignInRequest signInVO);
  Future<Response> signOut();
  Future<Response> getUser();
}

@ChopperApi(baseUrl: 'auth')
abstract class AuthApiImpl extends ChopperService implements AuthApi {
  static AuthApi create([ChopperClient client]) => _$AuthApiImpl(client);

  @Post(path: 'sign_in')
  @override
  Future<Response> signIn(@Body() SignInRequest signInRequest);

  @Delete(path: 'sign_out')
  @override
  Future<Response> signOut();

  @Get()
  @override
  Future<Response> getUser();
}
