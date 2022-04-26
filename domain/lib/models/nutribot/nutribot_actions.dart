import 'package:common_barkibu_dart/models/models.dart';

abstract class NutribotAction {
  factory NutribotAction.init() = InitNutribotAction;
  factory NutribotAction.patientDefinition() = PatientDefinitionNutribotAction;
  factory NutribotAction.askCeliac() = AskCeliacNutribotAction;
  factory NutribotAction.askWeightManagament() = AskWeightManagementNutribotAction;
  factory NutribotAction.askIsOutdoorCat() = AskIsOutdoorCatNutribotAction;
  factory NutribotAction.askDullCoatOrDrySkin() = AskDullCoatOrDrySkinNutribotAction;
  factory NutribotAction.askHipJointsIssues() = AskHipJointsIssuesNutribotAction;
  factory NutribotAction.askFoodSensitivity(List<FoodSensitivity> foods) => AskFoodSensitivityNutribotAction(foods);
  factory NutribotAction.askPreferedFoodType(List<FoodType> foodTypes) => AskPreferedFoodTypeNutribotAction(foodTypes);
  factory NutribotAction.askFeedBack() = AskFeedBackNutribotAction;
  factory NutribotAction.channelChoice() = ChannelChoiceNutribotAction;
  factory NutribotAction.retrieveFoodRecommendation() = RetrieveFoodRecommendations;
  factory NutribotAction.foodRecommendation(List<FoodRecommended> foods) => FoodsRecommendedNutribotAction(foods);
  factory NutribotAction.unexpectedError() = UnexpectedErrorNutribotAction;
}

class InitNutribotAction implements NutribotAction {}

class PatientDefinitionNutribotAction implements NutribotAction {}

class AskCeliacNutribotAction implements NutribotAction {}

class AskWeightManagementNutribotAction implements NutribotAction {}

class AskIsOutdoorCatNutribotAction implements NutribotAction {}

class AskDullCoatOrDrySkinNutribotAction implements NutribotAction {}

class AskHipJointsIssuesNutribotAction implements NutribotAction {}

class AskFoodSensitivityNutribotAction implements NutribotAction {
  final List<FoodSensitivity> foods;

  AskFoodSensitivityNutribotAction(this.foods);
}

class AskPreferedFoodTypeNutribotAction implements NutribotAction {
  final List<FoodType> foodTypes;

  AskPreferedFoodTypeNutribotAction(this.foodTypes);
}

class RetrieveFoodRecommendations implements NutribotAction {}

class AskFeedBackNutribotAction implements NutribotAction {}

class ChannelChoiceNutribotAction implements NutribotAction {}

class FoodsRecommendedNutribotAction implements NutribotAction {
  final List<FoodRecommended> foods;

  FoodsRecommendedNutribotAction(this.foods);
}

class UnexpectedErrorNutribotAction implements NutribotAction {}
