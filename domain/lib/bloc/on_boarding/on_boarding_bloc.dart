import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:common_barkibu_dart/bloc/on_boarding/on_boarding.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_actioner.dart';
import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_model.dart';
import 'package:common_barkibu_dart/domain/on_boarding/on_boarding_storage.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final List<OnBoardingActioner> _actioners;
  final OnBoardingStorage storage;
  int stepsCompleted = 0;
  int stepsTotal = 0;

  OnBoardingBloc(
    SecureStorage secureStorage,
    this._actioners,
  ) : storage = OnBoardingStorage(secureStorage);

  @override
  OnBoardingState get initialState => OnBoardingInitial();

  Future<OnBoardingActioner> _getNextActioner(OnBoardingModel model, [int currentIndex = 0]) async {
    for (final actioner in _actioners.skip(currentIndex)) {
      if (await actioner.isActionerRelevant(model)) {
        return actioner;
      } else {
        stepsCompleted += await actioner.remainingSteps({}) + 1;
      }
    }
    return null;
  }

  @override
  Stream<OnBoardingState> mapEventToState(OnBoardingEvent event) async* {
    final currentState = state;
    var model = currentState.model;

    if (currentState is OnBoardingInitial) {
      stepsTotal = await _getStepsTotal();
    }

    if (event is OnBoardingStarted) {
      try {
        storage.identifier = event.userIdentifier;
        model = await storage.fetchModel(event.initState);
      } catch (e) {
        ServiceLocator.container<MonitoringService>().capture(event: e, severityLevel: SeverityLevel.ERROR);
      }
    }

    var actioner = currentState is OnBoardingFlowUpdateSuccess ? currentState.actioner : await _getNextActioner(model);

    if (event is OnBoardingNextActionerTriggered) {
      await storage.persistModel(model);
      actioner = await _getNextActioner(model, _actioners.indexOf(actioner) + 1);
    }

    if (event is OnBoardingActionAnswer && currentState is OnBoardingFlowUpdateSuccess) {
      final partialModelCopy = Map.of(await model.getStateFor(actioner) ?? <String, dynamic>{});
      final partialModel = await currentState.action.processAnswer(partialModelCopy, event.answer);
      await model.setStateFor(actioner, partialModel);
    }

    if (event is OnBoardingBackPressed && currentState is OnBoardingFlowUpdateSuccess) {
      final allowed = currentState.action.canGoBack(await model.getStateFor(actioner));
      yield allowed ? currentState.previousState : currentState;
      return;
    }

    if (actioner == null) {
      yield OnBoardingProcessSuccess(model);
      return;
    }
    yield* _nextOnBoardingAction(actioner, model);
  }

  Stream<OnBoardingState> _nextOnBoardingAction(OnBoardingActioner actioner, OnBoardingModel model) async* {
    final partialModel = await model.getStateFor(actioner);
    await for (final action in actioner.actions(partialModel)) {
      yield* _mapActionToState(actioner, action, model);
    }
  }

  Stream<OnBoardingState> _mapActionToState(
      OnBoardingActioner actioner, OnBoardingAction action, OnBoardingModel model) async* {
    final actionerState = await model.getStateFor(actioner);
    final currentState = state;
    if (action is StepToNextActionerAction) {
      add(OnBoardingNextActionerTriggered());
      return;
    }
    yield OnBoardingFlowUpdateSuccess(
        action: action,
        actioner: actioner,
        model: model.clone(),
        canGoBack: action.canGoBack(actionerState),
        stepCount: stepsTotal,
        stepIndex: stepIndex + 1,
        previousState: currentState);
  }

  int get stepIndex {
    final currentState = state;
    return currentState is OnBoardingFlowUpdateSuccess ? currentState.stepIndex : stepsCompleted;
  }

  Future<int> _getStepsTotal() async {
    var totalSteps = 0;

    for (final actioner in _actioners) {
      final partialModel = await state.model.getStateFor(actioner);
      final remaingStepsForAction = await actioner.remainingSteps(partialModel);
      totalSteps += remaingStepsForAction;
    }
    ;

    return totalSteps;
  }
}
