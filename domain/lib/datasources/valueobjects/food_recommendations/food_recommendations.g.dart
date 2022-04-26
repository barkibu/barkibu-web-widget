// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_recommendations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodRecommendationResponse _$FoodRecommendationResponseFromJson(
    Map<String, dynamic> json) {
  return FoodRecommendationResponse(
    recipe: json['recipe'] == null
        ? null
        : RecipeOrTreatResponse.fromJson(
            json['recipe'] as Map<String, dynamic>),
    treats: json['treats'] as List,
  );
}

Map<String, dynamic> _$FoodRecommendationResponseToJson(
        FoodRecommendationResponse instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
      'treats': instance.treats,
    };

RecipeOrTreatResponse _$RecipeOrTreatResponseFromJson(
    Map<String, dynamic> json) {
  return RecipeOrTreatResponse(
    id: json['id'] as String,
    productName: json['productName'] as String,
    ingredients: json['ingredients'] as String,
    description: json['description'] as String,
    mainImage: json['mainImage'] == null
        ? null
        : FoodRecommendationImageResponse.fromJson(
            json['mainImage'] as Map<String, dynamic>),
    backImage: json['backImage'] == null
        ? null
        : FoodRecommendationImageResponse.fromJson(
            json['backImage'] as Map<String, dynamic>),
    buyUrl: json['buyUrl'] as String,
    productId: json['productId'] as String,
  );
}

Map<String, dynamic> _$RecipeOrTreatResponseToJson(
        RecipeOrTreatResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'ingredients': instance.ingredients,
      'description': instance.description,
      'mainImage': instance.mainImage,
      'backImage': instance.backImage,
      'buyUrl': instance.buyUrl,
      'productId': instance.productId,
    };

FoodRecommendationImageResponse _$FoodRecommendationImageResponseFromJson(
    Map<String, dynamic> json) {
  return FoodRecommendationImageResponse(
    json['full'] as String,
  );
}

Map<String, dynamic> _$FoodRecommendationImageResponseToJson(
        FoodRecommendationImageResponse instance) =>
    <String, dynamic>{
      'full': instance.full,
    };
