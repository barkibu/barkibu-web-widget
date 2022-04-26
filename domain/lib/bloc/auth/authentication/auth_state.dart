import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/user.dart';

part 'auth_state.g.dart';

abstract class AuthState {
  const AuthState();
}

abstract class AuthUninitialized extends AuthState implements Built<AuthUninitialized, AuthUninitializedBuilder> {
  AuthUninitialized._();
  factory AuthUninitialized([void Function(AuthUninitializedBuilder) updates]) = _$AuthUninitialized;
}

abstract class Authenticated extends AuthState implements Built<Authenticated, AuthenticatedBuilder> {
  User get user;

  Authenticated._();
  factory Authenticated([void Function(AuthenticatedBuilder) updates]) = _$Authenticated;
}

abstract class Unauthenticated extends AuthState implements Built<Unauthenticated, UnauthenticatedBuilder> {
  Unauthenticated._();
  factory Unauthenticated([void Function(UnauthenticatedBuilder) updates]) = _$Unauthenticated;
}

abstract class AuthLoading extends AuthState implements Built<AuthLoading, AuthLoadingBuilder> {
  AuthLoading._();
  factory AuthLoading([void Function(AuthLoadingBuilder) updates]) = _$AuthLoading;
}

abstract class AuthLoadingFailure extends AuthState implements Built<AuthLoadingFailure, AuthLoadingFailureBuilder> {
  AuthLoadingFailure._();
  factory AuthLoadingFailure([void Function(AuthLoadingFailureBuilder) updates]) = _$AuthLoadingFailure;
}
