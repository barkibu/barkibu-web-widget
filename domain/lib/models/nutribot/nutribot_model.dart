import 'package:common_barkibu_dart/models/models.dart';

class NutribotModel {
  Pet pet;

  bool needsWeightManagementFood;
  bool isOutdoor;
  bool hasHipJointIssues;
  bool hasDullCoatOrDrySkin;
  FoodType preferedFoodType;
  List<FoodSensitivity> foodSensitivities;

  bool feedback;
  bool talkToAVet = false;
  bool showFoodRecommendation = true;
  bool foodTypeWasChoosen = false;
  bool foodPreferencesSaved = false;
}
