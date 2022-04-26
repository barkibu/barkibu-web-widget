import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/phone_sign_in.dart';

part 'phone_sign_in_api.chopper.dart';

abstract class PhoneSignInApi {
  Future<Response> sendVerificationCode(PhoneVerificationRequest request);
  Future<Response> signIn(PhoneSignInRequest request);
}

@ChopperApi(baseUrl: 'phone_sign_in')
abstract class PhoneSignInApiImpl extends ChopperService implements PhoneSignInApi {
  static PhoneSignInApi create([ChopperClient client]) => _$PhoneSignInApiImpl(client);

  @Post()
  @override
  Future<Response> sendVerificationCode(@Body() PhoneVerificationRequest request);

  @Post(path: '/verify')
  @override
  Future<Response> signIn(@Body() PhoneSignInRequest request);
}
