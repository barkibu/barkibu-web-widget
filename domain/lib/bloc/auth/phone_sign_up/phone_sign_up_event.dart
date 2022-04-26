import 'package:built_value/built_value.dart';
part 'phone_sign_up_event.g.dart';

abstract class PhoneSignUpEvent {}

abstract class PhoneSignUpStarted extends PhoneSignUpEvent
    implements Built<PhoneSignUpStarted, PhoneSignUpStartedBuilder> {
  String get phoneNumberPrefix;
  String get phoneNumber;
  @nullable
  String get name;
  @nullable
  String get lastName;
  bool get checkboxValue;

  PhoneSignUpStarted._();
  factory PhoneSignUpStarted([void Function(PhoneSignUpStartedBuilder) updates]) = _$PhoneSignUpStarted;
}

abstract class PhoneSignUpCodeResendRequested extends PhoneSignUpEvent
    implements Built<PhoneSignUpCodeResendRequested, PhoneSignUpCodeResendRequestedBuilder> {
  PhoneSignUpCodeResendRequested._();
  factory PhoneSignUpCodeResendRequested([void Function(PhoneSignUpCodeResendRequestedBuilder) updates]) =
      _$PhoneSignUpCodeResendRequested;
}

abstract class PhoneSignUpCodeEntered extends PhoneSignUpEvent
    implements Built<PhoneSignUpCodeEntered, PhoneSignUpCodeEnteredBuilder> {
  String get code;

  PhoneSignUpCodeEntered._();
  factory PhoneSignUpCodeEntered([void Function(PhoneSignUpCodeEnteredBuilder) updates]) = _$PhoneSignUpCodeEntered;
}
