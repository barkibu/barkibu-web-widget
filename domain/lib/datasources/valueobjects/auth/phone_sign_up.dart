import 'package:json_annotation/json_annotation.dart';

part 'phone_sign_up.g.dart';

@JsonSerializable()
class PhoneVerificationRequest {
  final String phoneNumber;
  final String phoneNumberPrefix;

  PhoneVerificationRequest(this.phoneNumber, this.phoneNumberPrefix);

  factory PhoneVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneVerificationRequestFromJson(json['phone_registration']);

  Map<String, dynamic> toJson() => <String, dynamic>{'phone_registration': _$PhoneVerificationRequestToJson(this)};
}

@JsonSerializable()
class PhoneSignUpRequest {
  final String phoneNumber;
  final String phoneNumberPrefix;
  final String name;
  final String code;

  PhoneSignUpRequest(this.phoneNumber, this.phoneNumberPrefix, this.name, this.code);

  factory PhoneSignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneSignUpRequestFromJson(json['phone_registration']);

  Map<String, dynamic> toJson() => <String, dynamic>{'phone_registration': _$PhoneSignUpRequestToJson(this)};
}

class PhoneVerificationResponse {}

class PhoneSignUpResponse {
  final String accessToken;

  PhoneSignUpResponse(this.accessToken);
}
