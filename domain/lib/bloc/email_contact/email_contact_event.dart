import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/email.dart';

part 'email_contact_event.g.dart';

abstract class EmailContactEvent {}

abstract class EmailContactMessageSent extends EmailContactEvent
    implements Built<EmailContactMessageSent, EmailContactMessageSentBuilder> {
  Email get emailForVet;

  EmailContactMessageSent._();
  factory EmailContactMessageSent([void Function(EmailContactMessageSentBuilder) updates]) = _$EmailContactMessageSent;
}
