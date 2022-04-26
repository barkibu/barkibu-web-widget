import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/domain/email/send_email_use_case.dart';

import 'email_contact_event.dart';
import 'email_contact_state.dart';

class EmailContactBloc extends Bloc<EmailContactEvent, EmailContactState> {
  final SendEmailUseCase sendEmailUseCase;

  EmailContactBloc(this.sendEmailUseCase);

  @override
  EmailContactState get initialState => EmailContactInitial();

  @override
  Stream<EmailContactState> mapEventToState(
    EmailContactEvent event,
  ) async* {
    if (event is EmailContactMessageSent) {
      yield EmailContactLoadInProgress();
      final responseEmailVet = await sendEmailUseCase.sendEmail(event.emailForVet);
      if (responseEmailVet) {
        yield EmailContactLoadFinished();
      } else {
        yield EmailContactLoadFailed();
      }
    }
  }
}
