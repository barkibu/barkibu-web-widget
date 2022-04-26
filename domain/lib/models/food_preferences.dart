import 'package:json_annotation/json_annotation.dart';

part 'food_preferences.g.dart';

@JsonSerializable()
class FoodPreferences {
  final bool needsWeightManagementFood;
  final bool isOutdoor;
  final bool hasHipJointIssues;
  final bool hasDullCoatOrDrySkin;
  final String preferedFoodType;
  final List<String> foodSensitivities;

  const FoodPreferences({
    this.needsWeightManagementFood,
    this.isOutdoor,
    this.hasHipJointIssues,
    this.hasDullCoatOrDrySkin,
    this.preferedFoodType,
    this.foodSensitivities,
  });

  Map<String, dynamic> toJson() => _$FoodPreferencesToJson(this);
  factory FoodPreferences.fromJson(Map<String, dynamic> json) => _$FoodPreferencesFromJson(json);
}
