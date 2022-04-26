import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/auth/phone_sign_up.dart';

part 'phone_sign_up_api.chopper.dart';

abstract class PhoneSignUpApi {
  Future<Response> sendVerificationCode(PhoneVerificationRequest request);
  Future<Response> signUp(PhoneSignUpRequest request);
}

@ChopperApi(baseUrl: 'phone_registration')
abstract class PhoneSignUpApiImpl extends ChopperService implements PhoneSignUpApi {
  static PhoneSignUpApi create([ChopperClient client]) => _$PhoneSignUpApiImpl(client);

  @Post()
  @override
  Future<Response> sendVerificationCode(@Body() PhoneVerificationRequest request);

  @Post(path: '/verify')
  @override
  Future<Response> signUp(@Body() PhoneSignUpRequest request);
}
