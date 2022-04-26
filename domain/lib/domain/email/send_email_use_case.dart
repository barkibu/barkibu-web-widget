import 'package:common_barkibu_dart/models/email.dart';
import 'package:common_barkibu_dart/repositories/email/email_repository.dart';

abstract class SendEmailUseCase {
  Future<bool> sendEmail(Email email);
}

class SendEmailUseCaseImpl implements SendEmailUseCase {
  final EmailRepository _emailRepository;

  SendEmailUseCaseImpl(this._emailRepository);

  @override
  Future<bool> sendEmail(Email email) async => await _emailRepository.emailQuestion(email);
}
