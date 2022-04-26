import 'package:common_barkibu_dart/models/features.dart';
import 'package:json_annotation/json_annotation.dart';
part 'features.g.dart';

@JsonSerializable()
class FeaturesResponse {
  final bool telehealth;
  final bool insurance;

  const FeaturesResponse(
    this.telehealth,
    this.insurance,
  );

  factory FeaturesResponse.fromJson(Map<String, dynamic> json) => _$FeaturesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturesResponseToJson(this);

  Features toFeatures() => Features(insurance: insurance, telehealth: telehealth);
}
