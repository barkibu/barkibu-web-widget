import 'package:built_value/built_value.dart';

part 'sign_in_state.g.dart';

abstract class SignInState {
  const SignInState();
}

abstract class SignInInitial extends SignInState implements Built<SignInInitial, SignInInitialBuilder> {
  SignInInitial._();
  factory SignInInitial([void Function(SignInInitialBuilder) updates]) = _$SignInInitial;
}

abstract class SignInLoading extends SignInState implements Built<SignInLoading, SignInLoadingBuilder> {
  SignInLoading._();
  factory SignInLoading([void Function(SignInLoadingBuilder) updates]) = _$SignInLoading;
}

abstract class SignInFailure extends SignInState implements Built<SignInFailure, SignInFailureBuilder> {
  String get error;

  SignInFailure._();
  factory SignInFailure([void Function(SignInFailureBuilder) updates]) = _$SignInFailure;
}
