import 'package:json_annotation/json_annotation.dart';

part 'phone_sign_in.g.dart';

@JsonSerializable()
class PhoneVerificationRequest {
  final String phoneNumber;
  final String phoneNumberPrefix;

  PhoneVerificationRequest(this.phoneNumber, this.phoneNumberPrefix);

  factory PhoneVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneVerificationRequestFromJson(json['phone_sign_in']);

  Map<String, dynamic> toJson() => <String, dynamic>{'phone_sign_in': _$PhoneVerificationRequestToJson(this)};
}

@JsonSerializable()
class PhoneSignInRequest {
  final String phoneNumber;
  final String phoneNumberPrefix;
  final String code;

  PhoneSignInRequest(this.phoneNumber, this.phoneNumberPrefix, this.code);

  factory PhoneSignInRequest.fromJson(Map<String, dynamic> json) => _$PhoneSignInRequestFromJson(json['phone_sign_in']);

  Map<String, dynamic> toJson() => <String, dynamic>{'phone_sign_in': _$PhoneSignInRequestToJson(this)};
}

class PhoneVerificationResponse {}

class PhoneSignInResponse {
  final String accessToken;

  PhoneSignInResponse(this.accessToken);
}
