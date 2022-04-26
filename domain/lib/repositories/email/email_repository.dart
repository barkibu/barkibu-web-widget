import 'package:common_barkibu_dart/datasources/email/email_datasource.dart';
import 'package:common_barkibu_dart/models/email.dart';

abstract class EmailRepository {
  Future<bool> emailQuestion(Email email);
}

class EmailRepositoryImpl implements EmailRepository {
  final EmailDatasource _emailDatasource;

  EmailRepositoryImpl(this._emailDatasource);

  @override
  Future<bool> emailQuestion(Email email) {
    return _emailDatasource.sendEmail(email);
  }
}
