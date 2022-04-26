import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/email/email.dart';

part 'email_api.chopper.dart';

abstract class EmailApi {
  Future<Response> emailQuestions(EmailRequest request);
}

@ChopperApi(baseUrl: 'emails')
abstract class EmailApiImpl extends ChopperService implements EmailApi {
  static EmailApi create([ChopperClient client]) => _$EmailApiImpl(client);

  @Post()
  @override
  Future<Response> emailQuestions(@Body() EmailRequest request);
}
