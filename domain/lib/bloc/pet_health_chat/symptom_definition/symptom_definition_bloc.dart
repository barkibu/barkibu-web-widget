import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/pet_health_chat_event.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/symptom_definition/symptom_definition_state.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/aivet/search_symptom_use_case.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/services.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:common_barkibu_dart/viewmodels/pet_health/pet_health_chat_flow.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:pedantic/pedantic.dart';

class SymptomDefinitionBloc extends Bloc<SymptomDefinitionEvent, SymptomDefinitionState> {
  SymptomDefinitionState currentState;
  ActionsChat actionsChat;
  final SearchSymptomUseCase _searchSymptomUseCase;
  final AnalyticsService _analyticsService;
  int timesSymptomIsNotUnderstanded = 0;
  final configuration = ServiceLocator.container<Configuration>();

  SymptomDefinitionBloc(this._searchSymptomUseCase, this._analyticsService) {
    actionsChat = ActionsChat<PetHealthChatFlow>();
  }

  @override
  SymptomDefinitionState get initialState => SymptomDefinitionState();

  @override
  Stream<SymptomDefinitionState> mapEventToState(SymptomDefinitionEvent event) async* {
    currentState = state;
    if (event is PetHealthChatSymptomDefinitionStarted) {
      currentState = currentState.rebuild((b) => b..pet = event.pet);
      if (event.nextQuestion != null) {
        final symptom = Symptom(
          key: event.nextQuestion.symptomKey,
          name: event.nextQuestion.symptomName,
        );
        final symptomFound = SymptomFound(
            duration: event.nextQuestion.duration ?? false,
            frequency: event.nextQuestion.frequency ?? false,
            symptom: symptom);
        currentState = currentState.rebuild((b) => b
          ..symptom = symptom
          ..symptomFound = symptomFound);
        yield* _doNextQuestion(event);
        yield _addChatViewModelToState(
            actionsChat.answersTypeInput(PetHealthChatFlow.askNextQuestion(), event.nextQuestion.answersType));
      } else if (!event.isMainSymptom) {
        yield* _addChatViewModelStreamToState(actionsChat.botMessageType(
            PetHealthChatMessageType.askOtherSymptomQuestion,
            data: {'petName': currentState.pet.name}));
        yield _addChatViewModelToState(_inputSymptom());
      } else if (event.userQuestion != null && event.userQuestion != '') {
        yield* _addChatViewModelStreamToState(actionsChat
            .botMessageType(PetHealthChatMessageType.askSymptomQuestion, data: {'petName': currentState.pet.name}));
        add(PetHealthChatSymptomNameSent((b) => b.symptom = event.userQuestion));
      } else {
        yield* _addChatViewModelStreamToState(actionsChat
            .botMessageType(PetHealthChatMessageType.askSymptomQuestion, data: {'petName': currentState.pet.name}));
        yield _addChatViewModelToState(_inputSymptom());
      }
    }

    if (event is PetHealthChatSymptomNameSent) {
      currentState = currentState.rebuild((b) => b..symptomQuery = event.symptom);
      yield _addChatViewModelToState(actionsChat.ownMessage(event.symptom));
      yield* _addChatViewModelStreamToState(_lookForSymptoms(event.symptom));
    }

    if (event is PetHealthChatConfirmSymptomPressed) {
      final symptomFound = event.symptomFoundViewModel.key;
      if (event.symptomFoundViewModel.key != null) {
        currentState = currentState.rebuild(
          (builder) => builder
            ..symptomFound = symptomFound
            ..symptom = Symptom(
              key: symptomFound.symptom.key,
              name: symptomFound.symptom.name,
              presence: 'yes',
            ),
        );

        yield _addChatViewModelToState(actionsChat.ownMessage(symptomFound.symptom.name));
        yield* _addChatViewModelStreamToState(actionsChat
            .botMessageType(PetHealthChatMessageType.symptomFound, data: {'symptom': symptomFound.symptom.name}));

        if (symptomFound.duration) {
          yield* _addChatViewModelStreamToState(_askSymptomDurationCycle());
        } else if (symptomFound.frequency) {
          yield* _addChatViewModelStreamToState(_askSymptomFrequencyCycle());
        } else {
          yield _addChatViewModelToState(EmptyChatViewModel()); // We are not setting symptom and should!
          unawaited(close());
        }
      } else {
        final unknownSymptom = currentState.symptomQuery;
        final unknownSymptoms = List<String>.from(currentState.unknownSymptoms);
        currentState = currentState.rebuild((b) => b.unknownSymptoms = unknownSymptoms..add(unknownSymptom));
        yield _addChatViewModelToState(actionsChat.ownMessageType(PetHealthChatMessageType.noneOfThese));
        yield* _addChatViewModelStreamToState(actionsChat.botMessageType(PetHealthChatMessageType.symptomIsEmpty));
        yield _addChatViewModelToState(_inputSymptom());
      }
    }

    if (event is PetHealthChatSetSymptomDurationCyclePressed) {
      currentState = currentState.rebuild((builder) => builder..symptom.duration = event.optionDuration);

      yield _addChatViewModelToState(actionsChat.ownMessage(event.optionDuration.label));

      if (currentState.symptomFound?.frequency ?? false) {
        yield* _addChatViewModelStreamToState(_askSymptomFrequencyCycle());
      } else {
        unawaited(close());
      }
    }

    if (event is PetHealthChatSetSymptomFrequencyCyclePressed) {
      currentState = currentState.rebuild((builder) => builder..symptom.frequency = event.optionFrequency);

      yield _addChatViewModelToState(actionsChat.ownMessage(event.optionFrequency.label));
      unawaited(close());
    }

    if (event is PetHealthChatSymptomPresencePressed) {
      var presence = '';
      if (event.presence == null) {
        presence = 'unknown';
        yield _addChatViewModelToState(actionsChat.ownMessageType(PetHealthChatMessageType.unknown));
      } else if (event.presence) {
        presence = 'yes';
        yield _addChatViewModelToState(actionsChat.ownMessageType(PetHealthChatMessageType.yes));
      } else {
        presence = 'no';
        yield _addChatViewModelToState(actionsChat.ownMessageType(PetHealthChatMessageType.no));
      }

      currentState = currentState.rebuild((b) => b..symptom.presence = presence);
      var symptomIsPresent = event.presence != null && event.presence;
      _analyticsService.event.aivet.logVirtualVetNextQuestionPresence(presence);

      if (symptomIsPresent && currentState.symptomFound.duration) {
        yield* _addChatViewModelStreamToState(_askSymptomDurationCycle());
      } else if (symptomIsPresent && !currentState.symptomFound.duration && currentState.symptomFound.frequency) {
        yield* _addChatViewModelStreamToState(_askSymptomFrequencyCycle());
      } else {
        currentState.rebuild((b) => b.symptom.duration = SymptomDurationCycle(key: 'unknown'));
        yield _addChatViewModelToState(EmptyChatViewModel());
        unawaited(close());
      }
    }

    if (event is PetHealthChatSkipSymptomPressed) {
      currentState = currentState.rebuild((builder) => builder
        ..symptom = Symptom(name: '')
        ..skipped = true);
      yield _addChatViewModelToState(actionsChat.ownMessageType(PetHealthChatMessageType.skipPrimarySymptom));
      unawaited(close());
    }
  }

  SymptomDefinitionState _addChatViewModelToState(ChatViewModel viewModel) {
    return currentState.rebuild((b) => b..viewModel = viewModel);
  }

  Stream<SymptomDefinitionState> _addChatViewModelStreamToState(Stream<ChatViewModel> viewModelStream) {
    return viewModelStream.map((ChatViewModel viewModel) => _addChatViewModelToState(viewModel));
  }

  Stream<ChatViewModel> _lookForSymptoms(String query) async* {
    yield* await _searchSymptomUseCase
        .findSymptoms(currentState.pet.id, query)
        .then(_onLookForSymptomsSuccess, onError: _onLookForSymptomsError)
        .catchError(_onLookForSymptomsError);
  }

  Stream<ChatViewModel> _onLookForSymptomsSuccess(List<SymptomFound> symptomsFound) async* {
    if (symptomsFound.isEmpty) {
      final unknownSymptom = currentState.symptomQuery;
      final unknownSymptoms = List<String>.from(currentState.unknownSymptoms);
      currentState = currentState.rebuild((b) => b.unknownSymptoms = unknownSymptoms..add(unknownSymptom));
      timesSymptomIsNotUnderstanded++;
      _analyticsService.event.aivet.logVirtualVetDoesNotUnderstandSymptom(timesSymptomIsNotUnderstanded);
      yield* actionsChat.botMessageType(PetHealthChatMessageType.symptomIsEmpty);
      yield _inputSymptom();
    } else {
      yield* actionsChat.botMessageType(
        PetHealthChatMessageType.askSymptomConfirmation,
        data: {'petName': currentState.pet.name},
      );
      var symptomsFoundList = _mapSymptomsToViewModel(symptomsFound).take(7).toList()
        ..add(OptionViewModel<SymptomFound>((b) => b
          ..key = null
          ..description = ServiceLocator.container<LocaleService>().messagesModel().sharedMessages.noneOfThese));
      yield actionsChat.singleOptions(PetHealthChatFlow.confirmSymptom(), symptomsFoundList);
    }
  }

  Stream<ChatViewModel> _onLookForSymptomsError(dynamic error) async* {
    yield* actionsChat.botMessageType(PetHealthChatMessageType.symptomHasError);
    yield _inputSymptom();
  }

  ChatViewModel _inputSymptom() {
    if (currentState.unknownSymptoms.length > 1 && configuration.skipPrimarySymptomEnabled) {
      final skipOption =
          OptionViewModel<PetHealthChatMessageType>((b) => b.key = PetHealthChatMessageType.skipPrimarySymptom);
      return actionsChat.textInputAndSingleOptions(PetHealthChatFlow.inputSymptom(), [skipOption]);
    } else {
      return actionsChat.textInputSimple(PetHealthChatFlow.inputSymptom());
    }
  }

  Stream<SymptomDefinitionState> _doNextQuestion(PetHealthChatSymptomDefinitionStarted event) async* {
    if (event.nextQuestion.hint == null) {
      yield* _addChatViewModelStreamToState(actionsChat.botMessage(event.nextQuestion.question));
    } else {
      yield* _addChatViewModelStreamToState(actionsChat.botMessageWithHelp(
          text: event.nextQuestion.question,
          helpTitle: event.nextQuestion.symptomName,
          helpContent: event.nextQuestion.hint));
    }
  }

  List<OptionViewModel> _mapSymptomsToViewModel(List<SymptomFound> symptomsFound) => symptomsFound
      .map((symptomFound) => OptionViewModel<SymptomFound>((b) => b
        ..key = symptomFound
        ..description = symptomFound.symptom.name))
      .toList();

  Stream<ChatViewModel> _askSymptomDurationCycle() async* {
    yield* actionsChat.botMessageType(PetHealthChatMessageType.askSymptomDuration);
    yield actionsChat.singleOptions(
        PetHealthChatFlow.askSymptomDurationCycle(), _mapSymptomDurationsCycleToViewModel());
  }

  Stream<ChatViewModel> _askSymptomFrequencyCycle() async* {
    yield* actionsChat.botMessageType(PetHealthChatMessageType.askSymptomFrequency);
    yield actionsChat.singleOptions(
        PetHealthChatFlow.askSymptomFrequencyCycle(), _mapSymptomFrequenciesCycleToViewModel());
  }

  List<OptionViewModel> _mapSymptomDurationsCycleToViewModel() => List.of([
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'unknown'
          ..key = PetHealthChatMessageType.unknown),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'short'
          ..key = PetHealthChatMessageType.shortDuration),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'medium'
          ..key = PetHealthChatMessageType.mediumDuration),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'long'
          ..key = PetHealthChatMessageType.longDuration),
      ]);

  List<OptionViewModel> _mapSymptomFrequenciesCycleToViewModel() => List.of([
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'unknown'
          ..key = PetHealthChatMessageType.unknown),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'low'
          ..key = PetHealthChatMessageType.lowFrequency),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'medium'
          ..key = PetHealthChatMessageType.mediumFrequency),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..description = 'high'
          ..key = PetHealthChatMessageType.highFrequency),
      ]);
}
