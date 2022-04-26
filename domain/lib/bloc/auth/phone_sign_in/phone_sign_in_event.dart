import 'package:built_value/built_value.dart';
part 'phone_sign_in_event.g.dart';

abstract class PhoneSignInEvent {}

abstract class PhoneSignInStarted extends PhoneSignInEvent
    implements Built<PhoneSignInStarted, PhoneSignInStartedBuilder> {
  String get phoneNumberPrefix;
  String get phoneNumber;

  PhoneSignInStarted._();
  factory PhoneSignInStarted([void Function(PhoneSignInStartedBuilder) updates]) = _$PhoneSignInStarted;
}

abstract class PhoneSignInCodeResendRequested extends PhoneSignInEvent
    implements Built<PhoneSignInCodeResendRequested, PhoneSignInCodeResendRequestedBuilder> {
  PhoneSignInCodeResendRequested._();
  factory PhoneSignInCodeResendRequested([void Function(PhoneSignInCodeResendRequestedBuilder) updates]) =
      _$PhoneSignInCodeResendRequested;
}

abstract class PhoneSignInCodeEntered extends PhoneSignInEvent
    implements Built<PhoneSignInCodeEntered, PhoneSignInCodeEnteredBuilder> {
  String get code;

  PhoneSignInCodeEntered._();
  factory PhoneSignInCodeEntered([void Function(PhoneSignInCodeEnteredBuilder) updates]) = _$PhoneSignInCodeEntered;
}
