import 'package:common_barkibu_dart/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_recommendations.g.dart';

@JsonSerializable()
class FoodRecommendationResponse {
  final RecipeOrTreatResponse recipe;
  final List<dynamic> treats;

  FoodRecommendationResponse({this.recipe, this.treats});

  factory FoodRecommendationResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodRecommendationResponseFromJson(json['foodRecommendation']);

  Map<String, dynamic> toJson() => <String, dynamic>{'foodRecommendation': _$FoodRecommendationResponseToJson(this)};

  FoodRecommended toFoodRecommended() => FoodRecommended(
        recipe: recipe.toRecipeOrTreat(),
        treats: TreatsResponse.fromJson(treats).map((treat) => treat.toRecipeOrTreat()).toList(),
      );
}

@JsonSerializable()
class RecipeOrTreatResponse {
  final String id;
  final String productName;
  final String ingredients;
  final String description;
  final FoodRecommendationImageResponse mainImage;
  final FoodRecommendationImageResponse backImage;
  final String buyUrl;
  final String productId;

  RecipeOrTreatResponse({
    this.id,
    this.productName,
    this.ingredients,
    this.description,
    this.mainImage,
    this.backImage,
    this.buyUrl,
    this.productId,
  });

  factory RecipeOrTreatResponse.fromJson(Map<String, dynamic> json) => _$RecipeOrTreatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeOrTreatResponseToJson(this);

  RecipeOrTreat toRecipeOrTreat() => RecipeOrTreat(
        id: id,
        productName: productName,
        ingredients: ingredients,
        description: description,
        mainImage: mainImage.toFoodRecommendedImage(),
        backImage: backImage.toFoodRecommendedImage(),
        buyUrl: buyUrl ?? 'https://www.google.com/search?q=${productName.replaceAll(' ', '+')}',
        productId: productId,
      );
}

class TreatsResponse {
  static List<RecipeOrTreatResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic treat) => RecipeOrTreatResponse.fromJson(treat['treat']))?.toList() ?? [];
}

class FoodRecommendationsResponse {
  static List<FoodRecommendationResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic food) => FoodRecommendationResponse.fromJson(food))?.toList() ?? [];
}

@JsonSerializable()
class FoodRecommendationImageResponse {
  final String full;

  FoodRecommendationImageResponse(this.full);

  factory FoodRecommendationImageResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodRecommendationImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodRecommendationImageResponseToJson(this);

  FoodRecommendedImage toFoodRecommendedImage() => FoodRecommendedImage(full: full);
}
