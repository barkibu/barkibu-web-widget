import 'package:common_barkibu_dart/datasources/api/food_recommendations_api.dart';
import 'package:common_barkibu_dart/datasources/valueobjects/food_recommendations/food_recommendations.dart';
import 'package:common_barkibu_dart/models/models.dart';

abstract class FoodRecommendationsDatasource {
  Future<List<FoodRecommended>> getFoodRecommendation(int petId);
}

class FoodRecommendationsDatasourceImpl implements FoodRecommendationsDatasource {
  final FoodRecommendationsApi _foodRecommendationsApi;

  FoodRecommendationsDatasourceImpl(this._foodRecommendationsApi);

  @override
  Future<List<FoodRecommended>> getFoodRecommendation(int petId) async {
    var response = await _foodRecommendationsApi.getFoodRecommendation(petId);

    return response.isSuccessful
        ? FoodRecommendationsResponse.fromJson(response.body)
            .map((FoodRecommendationResponse food) => food.toFoodRecommended())
            .toList()
        : [];
  }
}
