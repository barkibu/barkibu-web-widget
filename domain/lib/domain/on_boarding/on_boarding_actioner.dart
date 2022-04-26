import 'dart:async';

import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_model.dart';

abstract class OnBoardingAction {
  bool canGoBack(Map<String, dynamic> partialModel) => false;

  FutureOr<Map<String, dynamic>> processAnswer(Map<String, dynamic> partialModel, dynamic answer);

  factory OnBoardingAction.stepToNextActioner() = StepToNextActionerAction;
}

class StepToNextActionerAction implements OnBoardingAction {
  @override
  bool canGoBack(Map<String, dynamic> partialModel) => false;

  @override
  FutureOr<Map<String, dynamic>> processAnswer(Map<String, dynamic> partialModel, dynamic answer) => partialModel;
}

abstract class OnBoardingActioner {
  String get key;
  FutureOr<bool> isActionerRelevant(OnBoardingModel model);
  Stream<OnBoardingAction> actions(Map<String, dynamic> partialModel);
  FutureOr<int> remainingSteps(Map<String, dynamic> model);
}
