import 'package:common_barkibu_dart/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()
class UserRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String phoneNumberPrefix;
  final String password;
  final String avatarUrl;
  final String country;

  UserRequest({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
    this.phoneNumber,
    this.phoneNumberPrefix,
    this.avatarUrl,
    this.country,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) => _$UserRequestFromJson(json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{'user': _$UserRequestToJson(this)};
}

@JsonSerializable()
class UserResponse {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String phoneNumberPrefix;
  final String country;
  final String avatarUrl;
  final String twilioIdentity;

  UserResponse(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.twilioIdentity,
    this.phoneNumber,
    this.phoneNumberPrefix,
    this.avatarUrl,
    this.country,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{'user': _$UserResponseToJson(this)};

  User toUser() => User(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      twilioIdentity: twilioIdentity,
      phoneNumber: phoneNumber,
      country: country,
      phoneNumberPrefix: phoneNumberPrefix);

  factory UserResponse.fromUser(User user) => UserResponse(
        user.id,
        user.email,
        user.firstName,
        user.lastName,
        user.twilioIdentity,
        user.phoneNumber,
        user.phoneNumberPrefix,
        user.avatarUrl,
        user.country,
      );
}
