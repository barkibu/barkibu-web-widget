import 'package:common_barkibu_dart/datasources/api/email_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/email/email.dart';
import 'package:common_barkibu_dart/models/email.dart';

abstract class EmailDatasource {
  Future<bool> sendEmail(Email email);
}

class EmailDatasourceImpl implements EmailDatasource {
  final EmailApi _emailApi;

  EmailDatasourceImpl(this._emailApi);

  @override
  Future<bool> sendEmail(Email email) async {
    var response = await _emailApi.emailQuestions(EmailRequest(
      body: email.body,
      subject: email.subject,
    ));

    return response.isSuccessful;
  }
}
