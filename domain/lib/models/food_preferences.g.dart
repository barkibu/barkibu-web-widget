// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodPreferences _$FoodPreferencesFromJson(Map<String, dynamic> json) {
  return FoodPreferences(
    needsWeightManagementFood: json['needsWeightManagementFood'] as bool,
    isOutdoor: json['isOutdoor'] as bool,
    hasHipJointIssues: json['hasHipJointIssues'] as bool,
    hasDullCoatOrDrySkin: json['hasDullCoatOrDrySkin'] as bool,
    preferedFoodType: json['preferedFoodType'] as String,
    foodSensitivities:
        (json['foodSensitivities'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$FoodPreferencesToJson(FoodPreferences instance) =>
    <String, dynamic>{
      'needsWeightManagementFood': instance.needsWeightManagementFood,
      'isOutdoor': instance.isOutdoor,
      'hasHipJointIssues': instance.hasHipJointIssues,
      'hasDullCoatOrDrySkin': instance.hasDullCoatOrDrySkin,
      'preferedFoodType': instance.preferedFoodType,
      'foodSensitivities': instance.foodSensitivities,
    };
