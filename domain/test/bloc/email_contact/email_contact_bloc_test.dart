import 'package:common_barkibu_dart/bloc/email_contact/email_contact.dart';
import 'package:common_barkibu_dart/bloc/email_contact/email_contact_bloc.dart';
import 'package:common_barkibu_dart/domain/email/send_email_use_case.dart';
import 'package:common_barkibu_dart/models/email.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSendEmailUseCase extends Mock implements SendEmailUseCase {}

void main() {
  EmailContactBloc emailContactBloc;
  SendEmailUseCase sendEmailUseCase;
  setUp(() {
    sendEmailUseCase = MockSendEmailUseCase();
    emailContactBloc = EmailContactBloc(sendEmailUseCase);
  });
  group('Send email', () {
    final email = Email(
      subject: 'Dummy mail sample',
      body: 'This is a dummy mail',
    );

    test(('initialState should be [EmailContactInitial]'), () {
      expect(emailContactBloc.initialState, isA<EmailContactInitial>());
    });

    test(('should emit [EmailContactLoadInProgress and EmailContactLoadFinished] when email is sended successfully'),
        () async {
      when(sendEmailUseCase.sendEmail(any)).thenAnswer((_) async => true);

      final expect = [
        isA<EmailContactInitial>(),
        isA<EmailContactLoadInProgress>(),
        isA<EmailContactLoadFinished>(),
      ];

      emailContactBloc.add(EmailContactMessageSent((b) => b..emailForVet = email));
      await expectLater(emailContactBloc, emitsInOrder(expect));
    });

    test(('should emit [EmailContactLoadInProgress and EmailContactLoadFailed] when email is not sended successfully'),
        () async {
      when(sendEmailUseCase.sendEmail(any)).thenAnswer((_) async => false);

      final expect = [
        isA<EmailContactInitial>(),
        isA<EmailContactLoadInProgress>(),
        isA<EmailContactLoadFailed>(),
      ];

      emailContactBloc.add(EmailContactMessageSent((b) => b..emailForVet = email));
      await expectLater(emailContactBloc, emitsInOrder(expect));
    });
  });
}
