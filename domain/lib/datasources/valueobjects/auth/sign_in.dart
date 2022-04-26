import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/repositories/data/sign_in_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class SignInRequest {
  final String email;
  final String password;

  SignInRequest(this.email, this.password);

  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

@JsonSerializable()
class SignInResponse {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String phoneNumberPrefix;
  final String twilioIdentity;

  SignInResponse(this.id, this.firstName, this.lastName, this.email, this.phoneNumber, this.phoneNumberPrefix,
      this.twilioIdentity);

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{'user': _$SignInResponseToJson(this)};

  SignInData toSignInData(String accessToken) => SignInData(
        User(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            phoneNumberPrefix: phoneNumberPrefix,
            twilioIdentity: twilioIdentity),
        accessToken,
      );
}
