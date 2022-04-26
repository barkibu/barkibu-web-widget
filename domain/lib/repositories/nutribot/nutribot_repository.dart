import 'package:common_barkibu_dart/datasources/datasources.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation.dart';

abstract class NutribotRepository {
  Future<List<FoodSensitivity>> getFoodSensitivity();
  Future<List<FoodType>> getPreferedFoodTypes();
  Future<List<FoodRecommended>> getFoodRecommendation(int petId);
  Future<bool> updateFoodPreferences(Pet pet, FoodPreferences foodPreferences);
  Future<List<NutribotConsultation>> getConsultations(int petId);
}

class NutribotRepositoryImpl implements NutribotRepository {
  final PetDatasource _petDatasource;
  final FoodRecommendationsDatasource _foodRecommendationsDatasource;
  final NutribotConsultationsDatasource _nutribotConsultationsDatasource;
  static const unknownLabel = "I don't know";

  NutribotRepositoryImpl(
    this._foodRecommendationsDatasource,
    this._petDatasource,
    this._nutribotConsultationsDatasource,
  );

  @override
  Future<List<FoodSensitivity>> getFoodSensitivity() {
    var foods = [
      FoodSensitivity(key: 'poultry', value: 'Poultry'),
      FoodSensitivity(key: 'seafood', value: 'Seafood'),
      FoodSensitivity(key: 'grain', value: 'Grain'),
      FoodSensitivity(key: 'dairy', value: 'Dairy'),
      FoodSensitivity(key: 'pork', value: 'Pork'),
      FoodSensitivity(key: 'wildgame', value: 'Wild Game'),
      FoodSensitivity(key: 'beef', value: 'Beef'),
      FoodSensitivity(key: 'lamb', value: 'Lamb'),
      FoodSensitivity(key: null, value: 'No'),
    ];

    return Future.value(foods);
  }

  @override
  Future<List<FoodType>> getPreferedFoodTypes() {
    var foodTypes = [
      FoodType(value: 'Wet', key: 'canned'),
      FoodType(value: 'Dry', key: 'dry'),
      FoodType(value: 'No Preference'),
    ];

    return Future.value(foodTypes);
  }

  @override
  Future<bool> updateFoodPreferences(Pet pet, FoodPreferences foodPreferences) =>
      _petDatasource.updateFoodPreferences(pet, foodPreferences);

  @override
  Future<List<FoodRecommended>> getFoodRecommendation(int petId) =>
      _foodRecommendationsDatasource.getFoodRecommendation(petId);

  @override
  Future<List<NutribotConsultation>> getConsultations(int petId) {
    return _nutribotConsultationsDatasource.getConsultations(petId);
  }
}
