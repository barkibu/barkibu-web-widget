import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/reset_password.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/user.dart';

part 'user_api.chopper.dart';

abstract class UserApi {
  Future<Response> createUser(UserRequest user);
  Future<Response> updateUser(UserRequest user);
  Future<Response> sendEmail(SendEmailRequest email);
  Future<Response> resetPassword(ResetPasswordRequest userData);
}

@ChopperApi(baseUrl: 'user')
abstract class UserApiImpl extends ChopperService implements UserApi {
  static UserApi create([ChopperClient client]) => _$UserApiImpl(client);

  @Post()
  @override
  Future<Response> createUser(@Body() UserRequest user);

  @Put()
  @override
  Future<Response> updateUser(@Body() UserRequest user);

  @Post(path: 'begin_password_reset')
  @override
  Future<Response> sendEmail(@Body() SendEmailRequest email);

  @Post(path: 'reset_password')
  @override
  Future<Response> resetPassword(@Body() ResetPasswordRequest userData);
}
