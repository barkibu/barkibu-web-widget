import 'package:built_value/built_value.dart';

part 'sign_up_state.g.dart';

abstract class SignUpState {
  const SignUpState();
}

abstract class SignUpInitial extends SignUpState implements Built<SignUpInitial, SignUpInitialBuilder> {
  SignUpInitial._();

  factory SignUpInitial([void Function(SignUpInitialBuilder) updates]) = _$SignUpInitial;
}

abstract class SignUpLoading extends SignUpState implements Built<SignUpLoading, SignUpLoadingBuilder> {
  SignUpLoading._();

  factory SignUpLoading([void Function(SignUpLoadingBuilder) updates]) = _$SignUpLoading;
}

abstract class SignUpFailure extends SignUpState implements Built<SignUpFailure, SignUpFailureBuilder> {
  String get error;

  SignUpFailure._();
  factory SignUpFailure([void Function(SignUpFailureBuilder) updates]) = _$SignUpFailure;
}
