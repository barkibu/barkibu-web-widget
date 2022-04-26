import 'package:common_barkibu_dart/domain/nutribot/nutribot_actioner.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/nutribot/nutribot.dart';
import 'package:common_barkibu_dart/repositories/repositories.dart';

abstract class NutribotNextStepUseCase {
  Stream<NutribotAction> nextStep(NutribotModel model);
}

class NutribotNextStepUseCaseImpl implements NutribotNextStepUseCase {
  final NutribotRepository nutribotRepository;
  List<NutribotActioner> orderedActioners;

  NutribotNextStepUseCaseImpl(
    this.nutribotRepository,
  ) {
    orderedActioners = <NutribotActioner>[
      NutribotInit(),
      NutribotAskFoodSensitivities(nutribotRepository),
      NutribotAskWeightManagement(),
      NutribotAskDullCoatOrDrySkin(),
      NutribotAskHipJointsIssues(),
      NutribotAskPreferedFoodType(nutribotRepository),
      NutribotSaveFoodPreferences(nutribotRepository),
      NutribotShowFoodRecommendation(nutribotRepository),
      NutribotAskFeedback(),
      NutribotTalkAVet(),
    ];
  }

  @override
  Stream<NutribotAction> nextStep(NutribotModel model) async* {
    final actioner = orderedActioners.firstWhere((actioner) => actioner.isActionerRelevant(model));
    yield* actioner.actions(model);
  }
}
