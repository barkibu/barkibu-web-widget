import 'package:built_value/built_value.dart';
part 'sign_up_event.g.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

abstract class SingUpCloseError extends SignUpEvent implements Built<SingUpCloseError, SingUpCloseErrorBuilder> {
  SingUpCloseError._();
  factory SingUpCloseError([void Function(SingUpCloseErrorBuilder) updates]) = _$SingUpCloseError;
}

abstract class SingUpFirstNameChanged extends SignUpEvent
    implements Built<SingUpFirstNameChanged, SingUpFirstNameChangedBuilder> {
  String get firstName;

  SingUpFirstNameChanged._();
  factory SingUpFirstNameChanged([void Function(SingUpFirstNameChangedBuilder) updates]) = _$SingUpFirstNameChanged;
}

abstract class SingUpLastNameChanged extends SignUpEvent
    implements Built<SingUpLastNameChanged, SingUpLastNameChangedBuilder> {
  String get lastName;

  SingUpLastNameChanged._();
  factory SingUpLastNameChanged([void Function(SingUpLastNameChangedBuilder) updates]) = _$SingUpLastNameChanged;
}

abstract class SingUpEmailChanged extends SignUpEvent implements Built<SingUpEmailChanged, SingUpEmailChangedBuilder> {
  String get email;

  SingUpEmailChanged._();
  factory SingUpEmailChanged([void Function(SingUpEmailChangedBuilder) updates]) = _$SingUpEmailChanged;
}

abstract class SingUpPhoneNumberPrefixChanged extends SignUpEvent
    implements Built<SingUpPhoneNumberPrefixChanged, SingUpPhoneNumberPrefixChangedBuilder> {
  String get phoneNumberPrefix;

  SingUpPhoneNumberPrefixChanged._();
  factory SingUpPhoneNumberPrefixChanged([void Function(SingUpPhoneNumberPrefixChangedBuilder) updates]) =
      _$SingUpPhoneNumberPrefixChanged;
}

abstract class SingUpPhoneNumberChanged extends SignUpEvent
    implements Built<SingUpPhoneNumberChanged, SingUpPhoneNumberChangedBuilder> {
  String get phoneNumber;

  SingUpPhoneNumberChanged._();
  factory SingUpPhoneNumberChanged([void Function(SingUpPhoneNumberChangedBuilder) updates]) =
      _$SingUpPhoneNumberChanged;
}

abstract class SingUpPasswordChanged extends SignUpEvent
    implements Built<SingUpPasswordChanged, SingUpPasswordChangedBuilder> {
  String get password;

  SingUpPasswordChanged._();
  factory SingUpPasswordChanged([void Function(SingUpPasswordChangedBuilder) updates]) = _$SingUpPasswordChanged;
}

abstract class SingUpPasswordRepeatChanged extends SignUpEvent
    implements Built<SingUpPasswordRepeatChanged, SingUpPasswordRepeatChangedBuilder> {
  String get passwordRepeat;

  SingUpPasswordRepeatChanged._();
  factory SingUpPasswordRepeatChanged([void Function(SingUpPasswordRepeatChangedBuilder) updates]) =
      _$SingUpPasswordRepeatChanged;
}

abstract class SingUpCheckboxChanged extends SignUpEvent
    implements Built<SingUpCheckboxChanged, SingUpCheckboxChangedBuilder> {
  bool get checkboxValue;

  SingUpCheckboxChanged._();
  factory SingUpCheckboxChanged([void Function(SingUpCheckboxChangedBuilder) updates]) = _$SingUpCheckboxChanged;
}

abstract class SignUpSubmitted extends SignUpEvent implements Built<SignUpSubmitted, SignUpSubmittedBuilder> {
  @nullable
  String get firstName;
  @nullable
  String get lastName;
  @nullable
  String get email;
  @nullable
  String get phoneNumberPrefix;
  @nullable
  String get phoneNumber;
  @nullable
  String get password;
  @nullable
  String get passwordRepeat;
  @nullable
  bool get checkboxValue;

  SignUpSubmitted._();
  factory SignUpSubmitted([void Function(SignUpSubmittedBuilder) updates]) = _$SignUpSubmitted;
}
