import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_actioner.dart';
import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_model.dart';

abstract class OnBoardingState {
  OnBoardingModel get model;
}

class OnBoardingInitial extends OnBoardingState {
  @override
  OnBoardingModel model = OnBoardingModel();
}

class OnBoardingFlowUpdateSuccess extends OnBoardingState {
  @override
  final OnBoardingModel model;
  final OnBoardingAction action;
  final OnBoardingActioner actioner;
  final OnBoardingState previousState;
  final int stepCount;
  final int stepIndex;
  final bool canGoBack;

  OnBoardingFlowUpdateSuccess({
    this.actioner,
    this.model,
    this.action,
    this.previousState,
    this.stepCount,
    this.stepIndex,
    this.canGoBack,
  });
}

class OnBoardingProcessSuccess extends OnBoardingState {
  @override
  final OnBoardingModel model;

  OnBoardingProcessSuccess(this.model);
}
