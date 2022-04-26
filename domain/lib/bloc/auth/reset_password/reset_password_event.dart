import 'package:built_value/built_value.dart';

part 'reset_password_event.g.dart';

abstract class ResetPasswordEvent {
  const ResetPasswordEvent();
}

abstract class ResetPasswordStarted
    implements Built<ResetPasswordStarted, ResetPasswordStartedBuilder>, ResetPasswordEvent {
  String get email;

  ResetPasswordStarted._();
  factory ResetPasswordStarted([void Function(ResetPasswordStartedBuilder) updates]) = _$ResetPasswordStarted;
}

abstract class ResetPasswordCodeSent
    implements Built<ResetPasswordCodeSent, ResetPasswordCodeSentBuilder>, ResetPasswordEvent {
  ResetPasswordCodeSent._();
  factory ResetPasswordCodeSent([void Function(ResetPasswordCodeSentBuilder) updates]) = _$ResetPasswordCodeSent;
}

abstract class ResetPasswordSubmitted
    implements Built<ResetPasswordSubmitted, ResetPasswordSubmittedBuilder>, ResetPasswordEvent {
  ResetPasswordSubmitted._();
  factory ResetPasswordSubmitted([void Function(ResetPasswordSubmittedBuilder) updates]) = _$ResetPasswordSubmitted;
}

abstract class ResetPasswordPasswordChanged
    implements Built<ResetPasswordPasswordChanged, ResetPasswordPasswordChangedBuilder>, ResetPasswordEvent {
  String get password;

  ResetPasswordPasswordChanged._();
  factory ResetPasswordPasswordChanged([void Function(ResetPasswordPasswordChangedBuilder) updates]) =
      _$ResetPasswordPasswordChanged;
}

abstract class ResetPasswordPasswordRepeatChanged
    implements
        Built<ResetPasswordPasswordRepeatChanged, ResetPasswordPasswordRepeatChangedBuilder>,
        ResetPasswordEvent {
  String get passwordRepeat;

  ResetPasswordPasswordRepeatChanged._();
  factory ResetPasswordPasswordRepeatChanged([void Function(ResetPasswordPasswordRepeatChangedBuilder) updates]) =
      _$ResetPasswordPasswordRepeatChanged;
}

abstract class ResetPasswordCodeChanged
    implements Built<ResetPasswordCodeChanged, ResetPasswordCodeChangedBuilder>, ResetPasswordEvent {
  String get code;

  ResetPasswordCodeChanged._();
  factory ResetPasswordCodeChanged([void Function(ResetPasswordCodeChangedBuilder) updates]) =
      _$ResetPasswordCodeChanged;
}
