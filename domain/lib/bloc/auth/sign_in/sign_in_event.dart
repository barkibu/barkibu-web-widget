import 'package:built_value/built_value.dart';

part 'sign_in_event.g.dart';

abstract class SignInEvent {
  const SignInEvent();
}

abstract class SingInEmailChanged extends SignInEvent implements Built<SingInEmailChanged, SingInEmailChangedBuilder> {
  String get email;

  SingInEmailChanged._();
  factory SingInEmailChanged([void Function(SingInEmailChangedBuilder) updates]) = _$SingInEmailChanged;
}

abstract class SignInPasswordChanged extends SignInEvent
    implements Built<SignInPasswordChanged, SignInPasswordChangedBuilder> {
  String get password;

  SignInPasswordChanged._();
  factory SignInPasswordChanged([void Function(SignInPasswordChangedBuilder) updates]) = _$SignInPasswordChanged;
}

abstract class SingInResetPasswordPressed extends SignInEvent
    implements Built<SingInResetPasswordPressed, SingInResetPasswordPressedBuilder> {
  SingInResetPasswordPressed._();
  factory SingInResetPasswordPressed([void Function(SingInResetPasswordPressedBuilder) updates]) =
      _$SingInResetPasswordPressed;
}

abstract class SingInSignInSubmitted extends SignInEvent
    implements Built<SingInSignInSubmitted, SingInSignInSubmittedBuilder> {
  @nullable
  String get email;
  @nullable
  String get password;

  SingInSignInSubmitted._();
  factory SingInSignInSubmitted([void Function(SingInSignInSubmittedBuilder) updates]) = _$SingInSignInSubmitted;
}
