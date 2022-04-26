import 'package:chopper/chopper.dart';

part 'food_recommendations_api.chopper.dart';

abstract class FoodRecommendationsApi {
  Future<Response> getFoodRecommendation(int petId);
}

@ChopperApi(baseUrl: 'food_recommendations')
abstract class FoodRecommendationsApiImpl extends ChopperService implements FoodRecommendationsApi {
  static FoodRecommendationsApi create([ChopperClient client]) => _$FoodRecommendationsApiImpl(client);

  @Get()
  @override
  Future<Response> getFoodRecommendation(@Query() int petId);
}
