class NutritionOptions {
  final List<FoodSensitivity> foodSensitivities;

  NutritionOptions({
    this.foodSensitivities,
  });
}

class FoodSensitivity {
  final String key;
  final String value;

  FoodSensitivity({this.key, this.value});
}

class FoodType {
  final String key;
  final String value;

  FoodType({this.key, this.value});
}
