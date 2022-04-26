import 'package:json_annotation/json_annotation.dart';

part 'reset_password.g.dart';

@JsonSerializable()
class SendEmailRequest {
  final String email;

  SendEmailRequest(this.email);

  factory SendEmailRequest.fromJson(Map<String, dynamic> json) => _$SendEmailRequestFromJson(json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{'user': _$SendEmailRequestToJson(this)};
}

@JsonSerializable()
class ResetPasswordRequest {
  final String email;
  final String passwordResetCode;
  final String password;

  ResetPasswordRequest(this.email, this.passwordResetCode, this.password);

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) => _$ResetPasswordRequestFromJson(json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{'user': _$ResetPasswordRequestToJson(this)};
}
