import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/user.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {
  const AuthEvent();
}

abstract class AppStarted extends AuthEvent implements Built<AppStarted, AppStartedBuilder> {
  @nullable
  String get token;

  @nullable
  String get otpToken;

  AppStarted._();
  factory AppStarted([void Function(AppStartedBuilder) updates]) = _$AppStarted;
}

abstract class SignedIn extends AuthEvent implements Built<SignedIn, SignedInBuilder> {
  String get token;

  SignedIn._();
  factory SignedIn([void Function(SignedInBuilder) updates]) = _$SignedIn;
}

abstract class SignedOut extends AuthEvent implements Built<SignedOut, SignedOutBuilder> {
  SignedOut._();
  factory SignedOut([void Function(SignedOutBuilder) updates]) = _$SignedOut;
}

abstract class UserUpdated extends AuthEvent implements Built<UserUpdated, UserUpdatedBuilder> {
  User get user;

  UserUpdated._();
  factory UserUpdated([void Function(UserUpdatedBuilder) updates]) = _$UserUpdated;
}
