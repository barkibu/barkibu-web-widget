import 'package:common_barkibu_dart/models/user_properties.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/user/pet_properties.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_properties.g.dart';

@JsonSerializable()
class UserPropertiesResponse {
  final int userId;
  final String userKBKey;
  final int catsCount;
  final int dogsCount;
  final int consultationsCount;
  final String createdAt;
  final String phone;
  final String email;
  final List<PetPropertiesResponse> pets;

  UserPropertiesResponse(this.userId, this.userKBKey, this.catsCount, this.dogsCount, this.consultationsCount,
      this.createdAt, this.phone, this.email, this.pets);

  factory UserPropertiesResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPropertiesResponseFromJson(json['userProperties']);

  Map<String, dynamic> toJson() => <String, dynamic>{'userProperties': _$UserPropertiesResponseToJson(this)};

  UserProperties toUserProperties() => UserProperties(
      userId: userId,
      userKBKey: userKBKey,
      catsCount: catsCount,
      dogsCount: dogsCount,
      consultationsCount: consultationsCount,
      createdAt: createdAt,
      phone: phone,
      email: email,
      pets: pets.map((p) => p.toPetProperties()).toList());
}
