import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/domain/nutribot/nutribot_next_step_use_case.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/nutribot/nutribot.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/services.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:common_barkibu_dart/viewmodels/nutribot/nutribot_chat_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

class NutribotChatBloc extends Bloc<NutribotChatEvent, NutribotChatState> {
  final AnalyticsService _analyticsService;
  final NutribotNextStepUseCase _nutribotNextStepUseCase;

  NutribotChatBloc(
    this._nutribotNextStepUseCase,
    this._analyticsService,
  ) {
    actionsChat = ActionsChat<NutribotChatFlow>();
    _analyticsService.screen.logNutribotChat();
  }

  final configuration = ServiceLocator.container<Configuration>();

  bool _disposed = false;
  ActionsChat actionsChat;
  NutribotChatState currentState;
  PetDefinitionBloc _petDefinitionBloc;
  ContactVetBloc _contactVetBloc;

  @override
  NutribotChatState get initialState {
    if (ServiceLocator.container.isRegistered<NutribotChatState>()) {
      return ServiceLocator.container<NutribotChatState>();
    } else {
      return NutribotChatInitial();
    }
  }

  @override
  Stream<NutribotChatState> mapEventToState(NutribotChatEvent event) async* {
    currentState = state;

    if (event is NutribotChatStarted) {
      _analyticsService.event.nutribot.logNutribotStart();
      currentState = currentState.rebuild((builder) => builder
        ..user = event.user
        ..model.pet = event.pet
        ..model.feedback = event.shouldAskFeedback ? null : true);

      yield* _launchProcess();
    }

    if (event is NutribotChatSubStateUpdated) {
      currentState = event.nutribotChatState;
      yield currentState;
      return;
    }

    if (event is PetDefinitionEvent) {
      _addToSubBloc(event);
      return;
    }

    if (event is NutribotPetDefinitionEndedEvent) {
      yield* _addChatViewModelStreamToFlowState(
          actionsChat.botMessageType(NutribotChatMessageType.askQuestionsProbeStart, data: _petNameData));
      yield* _launchProcess();
    }

    if (event is NutribotTalkWithAVetPressed) {
      _addToSubBloc<ContactVetEvent>(ContactVetStarted((b) => b
        ..user = currentState.user
        ..pet = currentState.model?.pet
        ..type = Flow.nutribot
        ..withQuestion = event.showQuestion));
      return;
    }

    if (event is ContactVetEvent) {
      _addToSubBloc(event);
      return;
    }

    if (event is NutribotContactVetEnded) {
      yield* _askHelpNext();
    }

    if (event is NutribotChatWeightManagementPressed) {
      currentState =
          currentState.rebuild((builder) => builder..model.needsWeightManagementFood = event.needsWeightManagementFood);

      yield _messageYesNo(event.needsWeightManagementFood);
      yield* _launchProcess();
    }

    if (event is NutribotChatIsOutdoorCatPressed) {
      currentState = currentState.rebuild((builder) => builder..model.isOutdoor = event.isOutdoor);

      yield _messageYesNo(event.isOutdoor);
      yield* _launchProcess();
    }

    if (event is NutribotDullCoatOrDrySkinPressed) {
      currentState =
          currentState.rebuild((builder) => builder..model.hasDullCoatOrDrySkin = event.hasDullCoatOrDrySkin);

      yield _messageYesNo(event.hasDullCoatOrDrySkin);
      yield* _launchProcess();
    }

    if (event is NutribotChatHipJointsPressed) {
      currentState = currentState.rebuild((builder) => builder..model.hasHipJointIssues = event.hasHipJointIssues);

      yield _messageYesNo(event.hasHipJointIssues);
      yield* _launchProcess();
    }

    if (event is NutribotChatFoodSensitivitiesPressed) {
      final foodSensitivities = event.foodSensitivityOptions.map((food) => food.key as FoodSensitivity).toList();
      final isOneOption = foodSensitivities.length == 1;
      final isNoOption = isOneOption && foodSensitivities.first.key == null;

      currentState = currentState.rebuild((builder) => builder..model.foodSensitivities = foodSensitivities);

      if (isNoOption) {
        yield _addChatViewModelToFlowState(actionsChat.ownMessageType(
          NutribotChatMessageType.responseNoFoodSensitivity,
          data: _petNameData,
        ));
      } else {
        yield _addChatViewModelToFlowState(actionsChat.ownMessageType(
          isOneOption
              ? NutribotChatMessageType.responseFoodSensitivity
              : NutribotChatMessageType.responseFoodSensitivities,
          data: _getFoodSensitivitiesData(foodSensitivities),
        ));
      }
      yield* _launchProcess();
    }

    if (event is NutribotChatPreferedFoodTypePressed) {
      final preferedFoodType = event.preferedFoodTypeOption.key;

      currentState = currentState.rebuild((builder) => builder
        ..model.preferedFoodType = preferedFoodType
        ..model.foodTypeWasChoosen = true);

      yield _addChatViewModelToFlowState(actionsChat.ownMessage(preferedFoodType.value));
      yield* _launchProcess();
    }

    if (event is NutribotFoodRecommendationsRequested) {
      yield* _launchProcess();
    }

    if (event is NutribotFoodRecommendationsDisplayed) {
      yield* _launchProcess();
    }

    if (event is NutribotChatFeedbackPressed) {
      _analyticsService.event.nutribot.logNutribotHelpful(event.feedback);
      currentState = currentState.rebuild((builder) => builder..model.feedback = event.feedback);

      yield _messageYesNo(event.feedback);
      if (event.feedback) {
        yield* _addChatViewModelStreamToFlowState(actionsChat.botMessageType(NutribotChatMessageType.feedbackPositive));
        yield* _askHelpNext();
      } else {
        currentState = currentState.rebuild((builder) => builder..model.talkToAVet = true);

        yield* _addChatViewModelStreamToFlowState(actionsChat.botMessageType(NutribotChatMessageType.feedbackNegative));
        add(NutribotTalkWithAVetPressed());
      }
    }

    if (event is NutribotAnotherQuestionPressed) {
      currentState = NutribotChatInitial((b) => b
        ..chatViewModels = const <ChatViewModel>[]
        ..input = null
        ..user = null
        ..model = NutribotModel());
      yield currentState;
    }

    //// Events that should navigate or show modal on the screen
    // if (event is NutribotLearnMoreRecommendationPressed) {}
    // if (event is NutribotPersonalRecommendationsPressed) {}
  }

  Stream<NutribotChatState> _askHelpNext() async* {
    yield* _addChatViewModelStreamToFlowState(actionsChat.botMessageType(NutribotChatMessageType.helpNext));
    yield _addChatViewModelToFlowState(_menuOptions());
  }

  Builder _builderFromCurrentState(
    builder, {
    User user,
    ChatViewModel input,
    NutribotModel model,
    List<ChatViewModel> chatViewModels,
  }) =>
      builder
        ..chatViewModels = chatViewModels ?? currentState.chatViewModels
        ..input = input
        ..user = user ?? currentState.user
        ..model = model ?? currentState.model;

  Stream<NutribotChatState> _launchProcess() async* {
    await for (NutribotAction nutritionAction in _nutribotNextStepUseCase.nextStep(currentState.model)) {
      yield* _addChatViewModelStreamToFlowState(_mapActionToViewModels(nutritionAction));
    }
  }

  Stream<NutribotChatState> _addChatViewModelStreamToFlowState(Stream<ChatViewModel> chatViewModelStream) async* {
    await for (ChatViewModel chatViewModel in chatViewModelStream) {
      yield _addChatViewModelToFlowState(chatViewModel);
    }
  }

  NutribotChatState _addChatViewModelToFlowState(ChatViewModel chatViewModel) {
    if (chatViewModel is EmptyChatViewModel) {
      return currentState;
    }

    if (chatViewModel.type == ChatViewModelType.input) {
      currentState = NutribotChatInputRequested((builder) => _builderFromCurrentState(builder, input: chatViewModel));
    } else {
      final list = List<ChatViewModel>.from([...currentState.chatViewModels, chatViewModel]);
      currentState = NutribotChatFlowUpdated((builder) => _builderFromCurrentState(builder, chatViewModels: list));
    }

    return currentState;
  }

  Stream<ChatViewModel> _mapActionToViewModels(NutribotAction action) async* {
    if (action is InitNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.init, data: _userNameData);
    } else if (action is PatientDefinitionNutribotAction) {
      if (currentState.model.pet != null) {
        add(PetConfirmed((b) => b.pet = currentState.model.pet));
      } else {
        add(PetDefinitionStarted((b) => b.pet = currentState.model.pet));
      }
    } else if (action is AskWeightManagementNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askWeightManagement, data: _petNameData);
      yield actionsChat.yesNo(NutribotChatFlow.askWeightManagement());
    } else if (action is AskIsOutdoorCatNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askIsOutdoor, data: _petNameData);
      yield actionsChat.yesNo(NutribotChatFlow.askIsOutdoorCat());
    } else if (action is AskDullCoatOrDrySkinNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askDullCoatOrDrySkin, data: _petNameData);
      yield actionsChat.yesNo(NutribotChatFlow.askDullCoatOrDrySkin());
    } else if (action is AskHipJointsIssuesNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askHipJointsIssues, data: _petNameData);
      yield actionsChat.yesNo(NutribotChatFlow.askHipJointsIssues());
    } else if (action is AskFoodSensitivityNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askFoodSensitivity, data: _petNameData);
      final options = _mapFoodSensitivitiesToViewModel(action.foods);
      final clearAllItemIndex = options.indexWhere((OptionViewModel option) => option.key.key == null);
      yield actionsChat.multipleOptions(NutribotChatFlow.askFoodSensitivity(), options, clearAllItemIndex);
    } else if (action is AskPreferedFoodTypeNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askPreferedFoodType, data: _petNameData);
      yield actionsChat.singleOptions(NutribotChatFlow.askPreferedFoodType(), _mapPreferedFoodTypes(action.foodTypes));
    } else if (action is RetrieveFoodRecommendations) {
      currentState = currentState.rebuild((builder) => builder..model.foodPreferencesSaved = true);
      add(NutribotFoodRecommendationsRequested());
    } else if (action is AskFeedBackNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.askFeedback);
      yield actionsChat.yesNo(NutribotChatFlow.askFeedback());
    } else if (action is ChannelChoiceNutribotAction) {
      _addIfNotDisposed(NutribotTalkWithAVetPressed(showQuestion: true));
    } else if (action is FoodsRecommendedNutribotAction) {
      currentState = currentState.rebuild((b) => b.model.showFoodRecommendation = false);

      if (action.foods.isEmpty) {
        currentState = currentState.rebuild((b) => b.model.feedback = false);
        yield* actionsChat.botMessageType(NutribotChatMessageType.noFoodRecommended, data: _petNameData);
        _addIfNotDisposed(NutribotTalkWithAVetPressed(showQuestion: true));
      } else {
        _analyticsService.event.nutribot.logNutribotShowRecommendation(action.foods.length);
        yield* actionsChat.botMessageType(NutribotChatMessageType.resultsSummary, data: _petNameData);
        yield* actionsChat.botMessageType(NutribotChatMessageType.resultsWarning);
        yield* Stream.fromIterable(actionsChat.nutribotRecommendations(action.foods, currentState.model?.pet));
        _addIfNotDisposed(NutribotFoodRecommendationsDisplayed());
      }
    } else if (action is UnexpectedErrorNutribotAction) {
      yield* actionsChat.botMessageType(NutribotChatMessageType.unexpectedError);
      yield _menuOptionsOnError();
    }
  }

  PetDefinitionBloc _setUpPetDefinitionSubBloc() {
    _petDefinitionBloc = ServiceLocator.container<PetDefinitionBloc>();
    return _petDefinitionBloc
      ..listen((PetDefinitionState subState) {
        final nutribotChatState = (subState.viewModel != null
            ? _addChatViewModelToFlowState(subState.viewModel)
            : currentState)
          ..model.pet = subState.pet;
        _addIfNotDisposed(NutribotChatSubStateUpdated((b) => b.nutribotChatState = nutribotChatState));
      }, onDone: () {
        _addIfNotDisposed(NutribotPetDefinitionEndedEvent());
        _petDefinitionBloc = null;
      });
  }

  ContactVetBloc _setUpContactVetSubBloc() {
    _contactVetBloc = ServiceLocator.container<ContactVetBloc>();
    return _contactVetBloc
      ..listen((ContactVetState subState) {
        final nutribotChatState =
            (subState.viewModel != null ? _addChatViewModelToFlowState(subState.viewModel) : currentState);
        _addIfNotDisposed(NutribotChatSubStateUpdated((b) => b.nutribotChatState = nutribotChatState));
      }, onDone: () {
        _addIfNotDisposed(NutribotContactVetEnded());
        _contactVetBloc = null;
      });
  }

  List<OptionViewModel> _mapFoodSensitivitiesToViewModel(List<FoodSensitivity> foods) => foods
      .map((food) => OptionViewModel<FoodSensitivity>((b) => b
        ..key = food
        ..description = food.value))
      .toList();

  List<OptionViewModel> _mapPreferedFoodTypes(List<FoodType> foodTypes) => foodTypes
      .map((foodType) => OptionViewModel<FoodType>((b) => b
        ..key = foodType
        ..description = foodType.value))
      .toList();

  ChatViewModel _menuOptions() {
    final options = configuration.telehealthEnabled ? [ChatButtonOptionType.talkWithAVet] : [];
    options.addAll(_errorStateMenuOptions);

    currentState = currentState.rebuild((builder) => builder..model.talkToAVet = false);

    return actionsChat.menuOptions(options, _petNameData);
  }

  ChatViewModel _menuOptionsOnError() => actionsChat.menuOptions(_errorStateMenuOptions, _petNameData);

  List<ChatButtonOptionType> get _errorStateMenuOptions {
    return [ChatButtonOptionType.askAnotherQuestion, ChatButtonOptionType.backHome];
  }

  NutribotChatState _messageYesNo(bool positive) => _addChatViewModelToFlowState(
      actionsChat.ownMessageType(positive ? NutribotChatMessageType.yes : NutribotChatMessageType.no));

  Map<String, String> get _petNameData => ({'petName': currentState.model?.pet?.name ?? ''});
  Map<String, String> get _userNameData => ({'userName': currentState.user.firstName});

  Map<String, String> _getFoodSensitivitiesData(List<FoodSensitivity> elements) => elements.length == 1
      ? ({
          'foodSensitivity': elements.first.value.toString(),
          'petName': currentState.model?.pet?.name ?? '',
        })
      : ({
          'lastFood': elements.last.value,
          'foodSensitivities': elements.take(elements.length - 1).map((e) => e.value).toList().join(', '),
          'petName': currentState.model?.pet?.name ?? '',
        });

  @override
  Future<void> close() async {
    _disposed = true;
    await super.close();
    await _petDefinitionBloc?.close();
    await _contactVetBloc?.close();
  }

  void _addIfNotDisposed(NutribotChatEvent event) {
    if (!_disposed) {
      add(event);
    }
  }

  void _addToSubBloc<E extends NutribotChatEvent>(E event) {
    assert([SymptomDefinitionEvent, PetDefinitionEvent, ContactVetEvent].contains(E));
    Bloc<E, dynamic> subBloc;
    if (E == ContactVetEvent) {
      subBloc = _contactVetBloc ?? _setUpContactVetSubBloc() as Bloc<E, dynamic>;
    } else if (E == PetDefinitionEvent) {
      subBloc = _petDefinitionBloc ?? _setUpPetDefinitionSubBloc() as Bloc<E, dynamic>;
    }
    subBloc.add(event);
  }
}
