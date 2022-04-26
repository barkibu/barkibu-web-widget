import 'package:json_annotation/json_annotation.dart';

part 'features.g.dart';

@JsonSerializable()
class Features {
  bool telehealth = false;
  bool insurance = false;

  Features({
    this.telehealth,
    this.insurance,
  });

  Map<String, dynamic> toJson() => _$FeaturesToJson(this);
  factory Features.fromJson(Map<String, dynamic> json) => _$FeaturesFromJson(json);
}
