import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/bloc/concierge/concierge.dart';
import 'package:common_barkibu_dart/bloc/contact_vet/contact_vet.dart';
import 'package:common_barkibu_dart/bloc/contact_vet/contact_vet_bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/pet_health_chat.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/symptom_definition/symptom_definition_bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:common_barkibu_dart/shared/chat/aivet_chat_title.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:uuid/uuid.dart';

import 'pet_health_chat_event.dart';
import 'pet_health_chat_state.dart';

enum AnalyticsEvents { feedBack, nextNavigation }

typedef StreamCallback = Stream<ChatViewModel> Function();

class PetHealthChatBloc extends Bloc<PetHealthChatEvent, PetHealthChatState> {
  bool _disposed = false;
  PetDefinitionBloc _petDefinitionBloc;
  SymptomDefinitionBloc _symptomDefinitionBloc;
  TriageBloc _triageBloc;
  ContactVetBloc _contactVetBloc;
  ConciergeBloc _conciergeBloc;
  PetHealthChatState currentState;
  String conversationId;

  final PetHealthNextStepUseCase _petHealthNextStepUseCase;
  final GetPetAssessmentReportUseCase _getAssessmentReportUseCase;
  final AnalyticsService _analyticsService;
  final configuration = ServiceLocator.container<Configuration>();

  ActionsChat actionsChat;
  ActionsChat conciergeActionsChat;
  bool _isFirstConciergeInput = true;

  PetHealthChatBloc(
    this._petHealthNextStepUseCase,
    this._analyticsService,
    this._getAssessmentReportUseCase,
  ) {
    actionsChat = ActionsChat<PetHealthChatFlow>();
  }

  @override
  PetHealthChatState get initialState {
    if (ServiceLocator.container.isRegistered<PetHealthChatState>()) {
      return ServiceLocator.container<PetHealthChatState>();
    } else {
      return PetHealthChatInitial();
    }
  }

  @override
  Stream<PetHealthChatState> mapEventToState(PetHealthChatEvent event) async* {
    currentState = state;

    if (event is PetHealthChatInitLaunched) {
      conversationId = Uuid().v4();
      yield PetHealthChatFlowUpdated((builder) => builder
        ..type = event.type
        ..user = event.user
        ..userQuestion = event.question
        ..aiVetModel.pet = event.pet);

      if (event.type == PetHealthChatType.concierge) {
        if (configuration.conciergeUrl != null) {
          _addIfNotDisposed(ConciergeStarted());
        } else {
          _addIfNotDisposed(PetHealthChatProcessStarted(PetHealthChatType.virtualVet));
        }
      } else {
        _addIfNotDisposed(PetHealthChatProcessStarted(event.type));
      }
    }

    if (event is PetHealthChatProcessStarted) {
      if (event.petHealthChatType == PetHealthChatType.virtualVet) {
        _analyticsService.screen.logVirtualVetChat();
      } else {
        _analyticsService.screen.logAskAVetChat();
      }
      currentState = currentState.rebuild((b) => b
        ..type = event.petHealthChatType
        ..aiVetModel.triageCompleted = false);
      if (event.userQuestion != null) {
        currentState = currentState.rebuild((b) => b..userQuestion = event.userQuestion);
      }
      yield* _launchProcess(init: true);
    }

    /// SubBlocs State Update Event
    if (event is PetHealthChatSubStateUpdated) {
      currentState = event.petHealthChatState;
      yield currentState;
      return;
    }
    if (event is PetHealthChatViewModelAdded) {
      yield _addChatViewModelToFlowState(event.viewModel);
      return;
    }

    /// START Triage Section
    if (event is TriageEvent) {
      _addToSubBloc(event);
      return;
    }

    /// Exiting events are processed. If the triage, we can share the report
    if (event is PetHealthTriageEnded) {
      yield* _launchProcess();
    }

    /// END Triage Section

    /// START CONTACT WITH VET SECTION
    if (event is PetHealthChatTalkWithAVetPressed) {
      _analyticsService.event.aivet.logVirtualVetNextAskAVet();
      _addToSubBloc<ContactVetEvent>(ContactVetStarted((b) => b
        ..user = currentState.user
        ..pet = currentState.aiVetModel?.pet
        ..withQuestion = event.showQuestion
        ..type = currentState.type == PetHealthChatType.askAVet ? Flow.askAVetDirectly : Flow.virtualVet
        ..symptoms = currentState.aiVetModel?.symptoms ?? []));
      return;
    }

    if (event is ContactVetEvent) {
      _addToSubBloc(event);
      return;
    }

    if (event is PetHealthContactVetEnded) {
      yield* _addChatViewModelStreamToFlowState(_menuOptions());
    }

    /// END CONTACT WITH VET SECTION

    if (event is ConciergeEvent) {
      _addToSubBloc(event);
      return;
    }

    if (event is PetHealthChatAskAnotherQuestionPressed) {
      if (currentState.type == PetHealthChatType.virtualVet) {
        _analyticsService.event.aivet.logVirtualVetAnotherQuestion();
      } else {
        _analyticsService.event.askAVet.logAskAVetAnotherQuestion();
      }
      currentState = PetHealthChatInitial(
        (builder) => builder
          ..userQuestion = ''
          ..user = currentState.user,
      );
      yield currentState;
    }

    if (event is PetHealthChatGoHomePressed) {
      _analyticsService.event.aivet.logVirtualVetNextHome();
    }

    if (event is PetHealthAssessmentReportShowed) {
      final currentInput = currentState.input;
      if (currentInput is ButtonInputChatViewModel && currentInput.action == ChatViewModelAction.openReport) {
        yield _addChatViewModelToFlowState(ButtonOutputChatViewModel((b) => b
          ..me = true
          ..action = ChatViewModelAction.reOpenReport
          ..dataResolver = currentInput.dataResolver));
        if (configuration.reminderEnabled) {
          yield* _addChatViewModelStreamToFlowState(actionsChat.botMessageType(
              PetHealthChatMessageType.assessmentReminder,
              data: {'petName': currentState.aiVetModel.pet.name}));
        }
        yield* _addChatViewModelStreamToFlowState(_askForFeedback());
      }
    }

    if (event is PetHealthChatPersonalRecommendationsPressed) {
      _analyticsEvents(AnalyticsEvents.nextNavigation, 'Recommended for you');
    }

    if (event is PetHealthChatFeedbackPressed) {
      _analyticsEvents(AnalyticsEvents.feedBack, event.isAnswerYes);
      if (event.isAnswerYes) {
        yield _addChatViewModelToFlowState(actionsChat.ownMessageType(PetHealthChatMessageType.yes));
        yield* _addChatViewModelStreamToFlowState(
            actionsChat.botMessageType(PetHealthChatMessageType.positiveFeedbackAnswer));
      } else {
        yield _addChatViewModelToFlowState(actionsChat.ownMessageType(PetHealthChatMessageType.no));
        yield* _addChatViewModelStreamToFlowState(
            actionsChat.botMessageType(PetHealthChatMessageType.negativeFeedbackAnswer));
      }
      yield* _addChatViewModelStreamToFlowState(_menuOptions());
    }
  }

  TriageBloc _setUpTriageSubBloc() {
    _triageBloc = ServiceLocator.container<TriageBloc>();
    return _triageBloc
      ..listen((TriageState subState) {
        final petHealthChatState =
            (subState.viewModel != null ? _addChatViewModelToFlowState(subState.viewModel) : currentState)
                .rebuild((builder) => builder
                  ..aiVetModel = subState.aiVetModel ?? currentState.aiVetModel
                  ..anamnesisResults = subState.anamnesisResults ?? currentState.anamnesisResults);
        _addIfNotDisposed(PetHealthChatSubStateUpdated((b) => b.petHealthChatState = petHealthChatState));
      }, onDone: () {
        final triageState = _triageBloc.state;
        if (_triageBloc.state.toHandOver) {
          switch (triageState.flow) {
            case TriageFlow.petDefinition:
              _addIfNotDisposed(ConciergeHandoverCompleted<Pet>(state.aiVetModel.pet));
              break;
            case TriageFlow.full:
            default:
              _addIfNotDisposed(
                  ConciergeHandoverCompleted<Map<String, String>>({'consultationId': state.aiVetModel.consultationId}));
              break;
          }
        } else {
          _addIfNotDisposed(PetHealthTriageEnded());
        }
        _triageBloc = null;
      });
  }

  ContactVetBloc _setUpContactVetSubBloc() {
    _contactVetBloc = ServiceLocator.container<ContactVetBloc>();
    return _contactVetBloc
      ..listen((ContactVetState subState) {
        if (subState.viewModel != null) {
          _addIfNotDisposed(PetHealthChatViewModelAdded((b) => b.viewModel = subState.viewModel));
        }
      }, onDone: () {
        _addIfNotDisposed(PetHealthContactVetEnded());
        _contactVetBloc = null;
      });
  }

  ConciergeBloc _setUpConciergeSubBloc() {
    _conciergeBloc = ServiceLocator.container<ConciergeBloc>();
    return _conciergeBloc
      ..listen((ConciergeState subState) {
        if (subState.viewModel != null) {
          _addIfNotDisposed(PetHealthChatViewModelAdded((b) => b.viewModel = subState.viewModel));
        }
        if (subState is ConciergeHandoverSuccessful) {
          switch (subState.type) {
            case HandoverType.virtualVet:
              _addIfNotDisposed(
                  PetHealthChatProcessStarted(PetHealthChatType.virtualVet, userQuestion: subState.payload));
              break;
            case HandoverType.petDefinition:
              if (_isFirstConciergeInput) {
                _isFirstConciergeInput = false;
                _analyticsService.event.aivet.logEntersFirstInputConcierge();
              }
              _addIfNotDisposed((TriageInitLaunched((b) => b
                ..question = currentState.userQuestion
                ..toHandOver = true
                ..flow = TriageFlow.petDefinition)));
              break;
            case HandoverType.triage:
              _addIfNotDisposed((TriageInitLaunched((b) => b
                ..question = currentState.userQuestion
                ..pet = currentState.aiVetModel.pet
                ..toHandOver = true
                ..flow = TriageFlow.full)));
              break;
            case HandoverType.petParentIdentification:
              _addIfNotDisposed(ConciergeHandoverCompleted(UserResponse.fromUser(currentState.user)));
          }
        } else if (subState is ConciergeConnectionFailure) {
          _addIfNotDisposed(PetHealthChatProcessStarted(PetHealthChatType.virtualVet));
        }
      }, onDone: () {
        _conciergeBloc = null;
      });
  }

  PetHealthChatState _addChatViewModelToFlowState(ChatViewModel chatViewModel) {
    if (chatViewModel is EmptyChatViewModel) {
      return currentState;
    }

    if (chatViewModel.type == ChatViewModelType.input) {
      currentState = PetHealthChatInputRequested((builder) => _builderFromCurrentState(builder, input: chatViewModel));
    } else {
      final list = List<ChatViewModel>.from([...currentState.chatViewModels, chatViewModel]);
      currentState = PetHealthChatFlowUpdated((builder) => _builderFromCurrentState(builder, chatViewModels: list));
    }
    _analyticsService.event.aivet.logChatInteraction(conversationId, chatViewModel);

    return currentState;
  }

  Builder _builderFromCurrentState(
    builder, {
    List<ChatViewModel> chatViewModels,
    ChatViewModel input,
    PetHealthChatType type,
    ChannelType channelType,
    User user,
    String userQuestion,
    bool isAskAVetComplete,
    bool isVirtualVetComplete,
    bool isVideoCallAvailable,
    int notHappyWithAnswerCount,
    Anamnesis anamnesisResults,
    AiVetModel aiVetModel,
    String lastAssessmentKey,
    int conditionsShown,
    int symptomArticlesShown,
  }) =>
      builder
        ..chatViewModels = chatViewModels ?? currentState.chatViewModels
        ..input = input
        ..type = type ?? currentState.type
        ..channelType = channelType ?? currentState.channelType
        ..user = user ?? currentState.user
        ..userQuestion = userQuestion ?? currentState.userQuestion
        ..isAskAVetComplete = isAskAVetComplete ?? currentState.isAskAVetComplete
        ..isVirtualVetComplete = isVirtualVetComplete ?? currentState.isVirtualVetComplete
        ..isVideoCallAvailable = isVideoCallAvailable ?? currentState.isVideoCallAvailable
        ..notHappyWithAnswerCount = notHappyWithAnswerCount ?? currentState.notHappyWithAnswerCount
        ..anamnesisResults = anamnesisResults ?? currentState.anamnesisResults
        ..aiVetModel = aiVetModel ?? currentState.aiVetModel
        ..lastAssessmentKey = lastAssessmentKey ?? currentState.lastAssessmentKey
        ..conditionsShown = conditionsShown ?? currentState.conditionsShown
        ..symptomArticlesShown = symptomArticlesShown ?? currentState.symptomArticlesShown;

  Stream<PetHealthChatState> _addChatViewModelStreamToFlowState(Stream<ChatViewModel> chatViewModelStream) async* {
    await for (ChatViewModel chatViewModel in chatViewModelStream) {
      yield _addChatViewModelToFlowState(chatViewModel);
    }
  }

  Stream<PetHealthChatState> _launchProcess({bool init = false}) async* {
    final actionStream = _petHealthNextStepUseCase.nextStep(currentState.aiVetModel, currentState.type, init: init);
    await for (AiVetAction aivetAction in actionStream) {
      yield* _addChatViewModelStreamToFlowState(_mapActionToViewModels(aivetAction));
    }
  }

  Stream<ChatViewModel> _mapActionToViewModels(AiVetAction action) async* {
    if (action is InitAiVetAction) {
      yield* actionsChat.botMessageType(currentState.type == PetHealthChatType.virtualVet
          ? PetHealthChatMessageType.initBot
          : PetHealthChatMessageType.initVet);
    } else if (action is ShowReportAiVetAction) {
      yield* _showAnamnesisResults(currentState.anamnesisResults);
    } else if (action is TalkToAVetChoiceAiVetAction) {
      add(PetHealthChatTalkWithAVetPressed(showQuestion: true));
    } else if (action is TriageInitAiVetAction) {
      _addIfNotDisposed(TriageInitLaunched((b) => b
        ..question = currentState.userQuestion
        ..pet = currentState.aiVetModel.pet
        ..flow = action.triageFlow));
    } else if (action is UnexpectedErrorAiVetAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.unexpectedError);
      yield _menuOptionsOnError();
    }
  }

  Stream<ChatViewModel> _showAnamnesisResults(Anamnesis anamnesis) async* {
    if (configuration.isChatMobileClient) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.assessmentReady);
      yield* actionsChat.botMessageType(PetHealthChatMessageType.assessmentReadyNoMoreQuestions);
      yield* actionsChat.botMessageType(PetHealthChatMessageType.assessmentReadyInProgress);
    } else {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.assessmentFinished);
      yield* actionsChat.botMessageType(PetHealthChatMessageType.assessmentAdvise);
    }

    final assessment = await _getAssessmentReportUseCase.getPetAssessment(anamnesis.consultationId);

    _analyticsService.event.aivet.logAnamnesisFinished(assessment);

    currentState = currentState.rebuild((builder) => builder
      ..lastAssessmentKey = anamnesis.consultationId
      ..conditionsShown = assessment.conditions?.length ?? 0
      ..symptomArticlesShown =
          assessment.symptoms?.withArticle()?.where((symptom) => symptom.presence == 'yes')?.length ?? 0);

    yield actionsChat.buttonInput(
      action: ChatViewModelAction.openReport,
      dataResolver: () => AssessmentIdentificationViewModel(currentState.aiVetModel.pet, anamnesis.consultationId),
    );
  }

  Stream<ChatViewModel> _askForFeedback() async* {
    yield* actionsChat.botMessageType(PetHealthChatMessageType.askFeedback);
    yield actionsChat.yesNo(PetHealthChatFlow.askFeedback());
  }

  Stream<ChatViewModel> _menuOptions() async* {
    // ignore: omit_local_variable_types
    final List<ChatButtonOptionType> options =
        configuration.telehealthEnabled ? [ChatButtonOptionType.talkWithAVet] : [];
    options.addAll(_errorStateMenuOptions);

    if (currentState.lastAssessmentKey != null) {
      options.insert(0, ChatButtonOptionType.openReport);
    }
    yield* actionsChat.botMessageType(PetHealthChatMessageType.helpNext);
    yield actionsChat.menuOptions(options, {'petName': currentState.aiVetModel?.pet?.name ?? ''});
  }

  ChatViewModel _menuOptionsOnError() {
    return actionsChat.menuOptions(_errorStateMenuOptions, {'petName': currentState.aiVetModel?.pet?.name ?? ''});
  }

  List<ChatButtonOptionType> get _errorStateMenuOptions {
    return [ChatButtonOptionType.askAnotherQuestion, ChatButtonOptionType.backHome];
  }

  void _analyticsEvents<A>(AnalyticsEvents event, A argument) {
    switch (event) {
      case AnalyticsEvents.feedBack:
        _analyticsEventForType(
          askAVet: () => {},
          virtualVet: () => _analyticsService.event.aivet.logVirtualVetHelpful(argument as bool),
        );
        break;
      case AnalyticsEvents.nextNavigation:
        _analyticsEventForType(
          askAVet: () => {},
          virtualVet: () => _analyticsEventNextNavigationForType(
            next: argument as String,
            askAVet: () => _analyticsService.event.aivet.logVirtualVetNextAskAVet(),
            home: () => _analyticsService.event.aivet.logVirtualVetNextHome(),
          ),
        );
        break;
    }
  }

  void _analyticsEventForType({Function askAVet, Function virtualVet}) {
    if (currentState.type == PetHealthChatType.virtualVet) {
      virtualVet();
    } else {
      askAVet();
    }
  }

  void _analyticsEventNextNavigationForType({String next, Function askAVet, Function home}) {
    if (next == 'Ask A Vet') {
      askAVet();
    } else {
      home();
    }
  }

  @override
  Future<void> close() async {
    _disposed = true;
    await super.close();
    await _petDefinitionBloc?.close();
    await _symptomDefinitionBloc?.close();
    await _triageBloc?.close();
    await _contactVetBloc?.close();
    await _conciergeBloc?.close();
  }

  void _addIfNotDisposed(PetHealthChatEvent event) {
    if (!_disposed) {
      add(event);
    }
  }

  void _addToSubBloc<E extends PetHealthChatEvent>(E event) {
    assert([SymptomDefinitionEvent, PetDefinitionEvent, TriageEvent, ContactVetEvent, ConciergeEvent].contains(E));
    Bloc<E, dynamic> subBloc;
    if (E == TriageEvent) {
      subBloc = _triageBloc ?? _setUpTriageSubBloc() as Bloc<E, dynamic>;
    } else if (E == ContactVetEvent) {
      subBloc = _contactVetBloc ?? _setUpContactVetSubBloc() as Bloc<E, dynamic>;
    } else if (E == ConciergeEvent) {
      subBloc = _conciergeBloc ?? _setUpConciergeSubBloc() as Bloc<E, dynamic>;
    }

    subBloc.add(event);
  }
}
