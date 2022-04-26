import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/nutribot/nutribot.dart';
import 'package:common_barkibu_dart/repositories/repositories.dart';

abstract class NutribotActioner {
  bool isActionerRelevant(NutribotModel model);
  Stream<NutribotAction> actions(NutribotModel model);
}

class NutribotInit implements NutribotActioner {
  NutribotInit();

  @override
  bool isActionerRelevant(NutribotModel model) => model.pet == null;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.init();
    yield NutribotAction.patientDefinition();
  }
}

class NutribotAskFoodSensitivities implements NutribotActioner {
  final NutribotRepository _nutribotRepository;

  NutribotAskFoodSensitivities(this._nutribotRepository);

  @override
  bool isActionerRelevant(NutribotModel model) => model.foodSensitivities == null;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askFoodSensitivity(await _nutribotRepository.getFoodSensitivity());
  }
}

class NutribotAskWeightManagement implements NutribotActioner {
  NutribotAskWeightManagement();

  @override
  bool isActionerRelevant(NutribotModel model) => model.needsWeightManagementFood == null;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askWeightManagament();
  }
}

class NutribotAskIsOutdoorCat implements NutribotActioner {
  NutribotAskIsOutdoorCat();

  @override
  bool isActionerRelevant(NutribotModel model) => model.isOutdoor == null && model.pet?.species == 'cat';

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askIsOutdoorCat();
  }
}

class NutribotAskHipJointsIssues implements NutribotActioner {
  NutribotAskHipJointsIssues();

  @override
  bool isActionerRelevant(NutribotModel model) => model.hasHipJointIssues == null;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askHipJointsIssues();
  }
}

class NutribotAskDullCoatOrDrySkin implements NutribotActioner {
  NutribotAskDullCoatOrDrySkin();

  @override
  bool isActionerRelevant(NutribotModel model) => model.hasDullCoatOrDrySkin == null;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askDullCoatOrDrySkin();
  }
}

class NutribotAskPreferedFoodType implements NutribotActioner {
  final NutribotRepository _nutribotRepository;
  NutribotAskPreferedFoodType(this._nutribotRepository);

  @override
  bool isActionerRelevant(NutribotModel model) => !model.foodTypeWasChoosen;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askPreferedFoodType(await _nutribotRepository.getPreferedFoodTypes());
  }
}

class NutribotSaveFoodPreferences implements NutribotActioner {
  final NutribotRepository _nutribotRepository;

  NutribotSaveFoodPreferences(this._nutribotRepository);

  @override
  bool isActionerRelevant(NutribotModel model) => model.foodPreferencesSaved == false;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    final result = await _nutribotRepository.updateFoodPreferences(
        model.pet,
        FoodPreferences(
          hasHipJointIssues: model.hasHipJointIssues,
          hasDullCoatOrDrySkin: model.hasDullCoatOrDrySkin,
          needsWeightManagementFood: model.needsWeightManagementFood,
          isOutdoor: model.isOutdoor,
          preferedFoodType: model.preferedFoodType.key,
          foodSensitivities: model.foodSensitivities.map((food) => food.key).toList(),
        ));
    if (result) {
      yield NutribotAction.retrieveFoodRecommendation();
    } else {
      yield NutribotAction.unexpectedError();
    }
  }
}

class NutribotShowFoodRecommendation implements NutribotActioner {
  final NutribotRepository _nutribotRepository;

  NutribotShowFoodRecommendation(this._nutribotRepository);

  @override
  bool isActionerRelevant(NutribotModel model) => model.showFoodRecommendation;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.foodRecommendation(await _nutribotRepository.getFoodRecommendation(model.pet.id));
  }
}

class NutribotAskFeedback implements NutribotActioner {
  NutribotAskFeedback();

  @override
  bool isActionerRelevant(NutribotModel model) => model.feedback == null;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.askFeedBack();
  }
}

class NutribotTalkAVet implements NutribotActioner {
  NutribotTalkAVet();

  @override
  bool isActionerRelevant(NutribotModel model) => model.talkToAVet;

  @override
  Stream<NutribotAction> actions(NutribotModel model) async* {
    yield NutribotAction.channelChoice();
  }
}
