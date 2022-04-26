import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/symptom_definition/symptom_definition.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:pedantic/pedantic.dart';

class TriageBloc extends Bloc<TriageEvent, TriageState> {
  TriageState currentState;

  PetDefinitionBloc _petDefinitionBloc;
  SymptomDefinitionBloc _symptomDefinitionBloc;
  final TriageNextStepUseCase _triageNextStepUseCase;
  final AnalyticsService _analyticsService;

  ActionsChat actionsChat;

  bool _disposed = false;

  TriageBloc(this._triageNextStepUseCase, this._analyticsService) {
    actionsChat = ActionsChat<PetHealthChatFlow>();
  }

  @override
  TriageState get initialState => TriageInitial();

  @override
  Stream<TriageState> mapEventToState(TriageEvent event) async* {
    currentState = state;
    if (event is TriageInitLaunched) {
      currentState = TriageInitSuccess((b) => _builderFromCurrentState(b,
          userQuestion: event.question,
          aiVetModel: (AiVetModel()..pet = event.pet),
          toHandOver: event.toHandOver,
          flow: event.flow ?? TriageFlow.full));

      yield currentState;
      if (!event.toHandOver) {
        _analyticsService.event.aivet.logEntersFirstInputAIVet();
      }
      yield* _launchProcess();
    }

    if (event is TriageSubStateUpdated) {
      yield event.triageState;
    }

    /// START PatientDefinition Section
    if (event is PetDefinitionEvent) {
      _addToSubBloc(event);
    }

    /// Exiting events are processed. If the definition is actually complete, we can go on with the AiVet process!
    if (event is TriagePetDefinitionEnded) {
      yield* _launchProcess();
    }

    /// END PatientDefinition Section

    /// START SymptomDefinition Section
    if (event is SymptomDefinitionEvent) {
      _addToSubBloc(event);
    }

    if (event is TriageSymptomDefinitionEnded) {
      final symptomList = currentState.aiVetModel.symptoms..add(event.symptom);
      final unknownSymptoms = currentState.aiVetModel.unknownSymptoms..addAll(List.from(event.unknownSymptoms));
      currentState = currentState.rebuild((b) => b
        ..aiVetModel.symptoms = symptomList
        ..aiVetModel.unknownSymptoms = unknownSymptoms
        ..aiVetModel.symptomDefinitionSkipped = event.skipped);
      yield currentState;
      yield* _launchProcess();
    }

    if (event is PetHealthChatAddMoreSymptomsPressed) {
      currentState = currentState.rebuild((builder) => builder
        ..aiVetModel.addMoreSymptoms = event.userWantsToAddMoreSymptoms
        ..viewModel = EmptyChatViewModel());

      yield _addChatViewModelToFlowState(actionsChat.ownMessageType(
          event.userWantsToAddMoreSymptoms ? PetHealthChatMessageType.yes : PetHealthChatMessageType.no));

      if (event.userWantsToAddMoreSymptoms) {
        currentState = currentState.rebuild(
          (builder) => builder
            ..userQuestion = null
            ..aiVetModel.symptomFound = null
            ..aiVetModel.shouldStopAnamnesis = false,
        );
      }
      yield currentState;
      yield* _launchProcess();
    }

    if (event is TriageProcessCompleted) {
      currentState = currentState.rebuild((b) => b.aiVetModel.triageCompleted = true);
      if (currentState.aiVetModel.symptomDefinitionSkipped) {
        yield TriageSymptomDefinitionSkippedSuccess(_builderFromCurrentState);
      } else if (currentState.flow == TriageFlow.petDefinition && currentState.toHandOver) {
        yield TriagePetDefinitionHandOverSuccess(_builderFromCurrentState);
      } else {
        yield TriageDiagnoseSuccess(_builderFromCurrentState);
      }
      unawaited(close());
    }
  }

  @override
  Future<void> close() async {
    _disposed = true;
    await super.close();
    await _petDefinitionBloc?.close();
    await _symptomDefinitionBloc?.close();
  }

  void _addIfNotDisposed(PetHealthChatEvent event) {
    if (!_disposed) {
      add(event);
    }
  }

  PetDefinitionBloc _setUpPetDefinitionSubBloc() {
    _petDefinitionBloc = ServiceLocator.container<PetDefinitionBloc>();
    return _petDefinitionBloc
      ..listen((PetDefinitionState subState) {
        final triageState =
            (subState.viewModel != null ? _addChatViewModelToFlowState(subState.viewModel) : currentState)
                .rebuild((b) => b..aiVetModel.pet = subState.pet);
        _addIfNotDisposed(TriageSubStateUpdated((b) => b.triageState = triageState));
      }, onDone: () {
        _addIfNotDisposed(TriagePetDefinitionEnded());
        _petDefinitionBloc = null;
      });
  }

  SymptomDefinitionBloc _setUpSymptomDefinitionSubBloc() {
    _symptomDefinitionBloc = ServiceLocator.container<SymptomDefinitionBloc>();

    return _symptomDefinitionBloc
      ..listen((SymptomDefinitionState subState) {
        final triageState =
            (subState.viewModel != null ? _addChatViewModelToFlowState(subState.viewModel) : currentState)
                .rebuild((b) => b..aiVetModel.symptomFound = subState.symptomFound);
        _addIfNotDisposed(TriageSubStateUpdated((b) => b.triageState = triageState));
      }, onDone: () {
        _addIfNotDisposed(TriageSymptomDefinitionEnded((b) => b
          ..symptom = _symptomDefinitionBloc.state.symptom
          ..unknownSymptoms = _symptomDefinitionBloc.state.unknownSymptoms
          ..skipped = _symptomDefinitionBloc.state.skipped));
        _symptomDefinitionBloc = null;
      });
  }

  Stream<TriageState> _launchProcess() async* {
    final actionStream = _triageNextStepUseCase.nextStep(currentState.aiVetModel, currentState.flow);
    await for (final aivetAction in actionStream) {
      yield* _addChatViewModelStreamToFlowState(_mapActionToViewModels(aivetAction));
    }
  }

  Stream<TriageState> _addChatViewModelStreamToFlowState(Stream<ChatViewModel> chatViewModelStream) async* {
    await for (ChatViewModel chatViewModel in chatViewModelStream) {
      yield _addChatViewModelToFlowState(chatViewModel);
    }
  }

  Builder _builderFromCurrentState(builder,
          {String userQuestion, Anamnesis anamnesisResults, AiVetModel aiVetModel, TriageFlow flow, bool toHandOver}) =>
      builder
        ..userQuestion = userQuestion ?? currentState.userQuestion
        ..anamnesisResults = anamnesisResults ?? currentState.anamnesisResults
        ..aiVetModel = aiVetModel ?? currentState.aiVetModel
        ..flow = flow ?? currentState.flow
        ..toHandOver = toHandOver ?? currentState.toHandOver;

  TriageState _addChatViewModelToFlowState(ChatViewModel viewModel) {
    return currentState.rebuild((b) => b..viewModel = viewModel);
  }

  Stream<ChatViewModel> _mapActionToViewModels(TriageAction action) async* {
    if (action is PatientDefinition) {
      _addIfNotDisposed(PetDefinitionStarted((b) => b.pet = currentState.aiVetModel.pet));
    } else if (action is MainSymptomTriageAction) {
      _addIfNotDisposed(PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = currentState.aiVetModel.pet
        ..userQuestion = currentState.userQuestion
        ..isMainSymptom = true));
    } else if (action is OtherSymptomTriageAction) {
      _addIfNotDisposed(PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = currentState.aiVetModel.pet
        ..isMainSymptom = false));
    } else if (action is FinishTriageAction) {
      _addIfNotDisposed(TriageProcessCompleted());
    } else if (action is BindConsultationIdTriageAction) {
      currentState = currentState.rebuild((builder) => builder..aiVetModel.consultationId = action.consultationId);
      yield ChatViewModel.emptyViewModel();
    } else if (action is SymptomsSecondCycleTriageAction) {
      yield* _nextQuestion(action.anamnesis);
    } else if (action is UnexpectedErrorTriageAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.unexpectedError);
      yield _menuOptionsOnError();
    }
  }

  Stream<ChatViewModel> _nextQuestion(Anamnesis anamnesis) async* {
    if (anamnesis == null) return;
    currentState = currentState.rebuild((builder) => builder
      ..anamnesisResults = anamnesis
      ..aiVetModel.shouldStopAnamnesis = anamnesis.shouldStop ?? false);

    if (anamnesis.shouldStop ?? false) {
      if (currentState.aiVetModel.addMoreSymptoms ?? false) {
        add(TriageProcessCompleted());
      } else {
        yield* actionsChat.botMessageType(PetHealthChatMessageType.addMoreSymptoms,
            data: {'petName': currentState.aiVetModel.pet.name});
        yield actionsChat.yesNo(PetHealthChatFlow.addMoreSymptoms());
      }
    } else {
      _addIfNotDisposed(PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = currentState.aiVetModel.pet
        ..isMainSymptom = true
        ..nextQuestion = anamnesis.nextQuestion));
    }
  }

  ChatViewModel _menuOptionsOnError() {
    return actionsChat.menuOptions(_errorStateMenuOptions, {'petName': currentState.aiVetModel?.pet?.name ?? ''});
  }

  List<ChatButtonOptionType> get _errorStateMenuOptions {
    return [ChatButtonOptionType.askAnotherQuestion, ChatButtonOptionType.backHome];
  }

  void _addToSubBloc<E extends TriageEvent>(E event) {
    assert([SymptomDefinitionEvent, PetDefinitionEvent].contains(E));
    Bloc<E, dynamic> subBloc;
    if (E == SymptomDefinitionEvent) {
      subBloc = _symptomDefinitionBloc ?? _setUpSymptomDefinitionSubBloc() as Bloc<E, dynamic>;
    } else if (E == PetDefinitionEvent) {
      subBloc = _petDefinitionBloc ?? _setUpPetDefinitionSubBloc() as Bloc<E, dynamic>;
    }

    subBloc.add(event);
  }
}
