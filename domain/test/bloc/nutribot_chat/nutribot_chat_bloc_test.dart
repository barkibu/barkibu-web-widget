import 'dart:async';

import 'package:common_barkibu_dart/bloc/nutribot_chat/nutribot_chat.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/nutribot/nutribot.dart';
import 'package:common_barkibu_dart/viewmodels/nutribot/nutribot_chat_message_type.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';
import '../../service_locator.dart' as test_service_locator;
import '../pet_health_chat/pet_health_chat_bloc_test.dart';
import '../utils/view_model_matcher.dart';

class MockNutribotNextStepUseCase extends Mock implements NutribotNextStepUseCase {}

void main() {
  test_service_locator.ServiceLocator.setup();
  final petDefinitionBloc = ServiceLocator.container<PetDefinitionBloc>();
  NutribotNextStepUseCase nutribotNextStepUseCase;
  final configuration = ServiceLocator.container<Configuration>();
  final analyticsService = MockAnalyticsService();

  NutribotChatBloc nutribotChatBloc;

  void initializeBloc({bool setupInitialState = true, bool telehealthEnabled = true}) {
    when(configuration.telehealthEnabled).thenReturn(telehealthEnabled);
    when(configuration.addPetOptionEnabled).thenReturn(true);
    when(configuration.telehealthEmailEnabled).thenReturn(true);
    when(configuration.telehealthChatEnabled).thenReturn(true);
    when(configuration.telehealthPhoneCallEnabled).thenReturn(true);
    nutribotChatBloc?.close();
    if (setupInitialState) {
      ServiceLocator.container.registerSingleton<NutribotChatState>(NutribotChatInitial((b) => b
        // ignore: missing_required_param
        ..user = User(
          firstName: 'Testy',
          lastName: 'Testington',
        )));

      if (!ServiceLocator.container.isRegistered<AnalyticsService>()) {
        ServiceLocator.container.registerSingleton<AnalyticsService>(analyticsService);
      }
    }

    nutribotNextStepUseCase = MockNutribotNextStepUseCase();
    nutribotChatBloc = NutribotChatBloc(nutribotNextStepUseCase, MockAnalyticsService());
  }

  setUp(() {
    initializeBloc();
  });

  tearDown(() async {
    if (ServiceLocator.container.isRegistered<NutribotChatState>()) {
      ServiceLocator.container.unregister<NutribotChatState>();
    }
    await nutribotChatBloc?.close();
  });

  group('NutribotChatBloc', () {
    final foodRecomended1 = FoodRecommended(
      recipe: RecipeOrTreat(productName: 'Product1'),
      treats: [],
    );
    final foodRecomended2 = FoodRecommended(
      recipe: RecipeOrTreat(productName: 'Product2'),
      treats: [],
    );

    final pet = Pet(
        id: 1,
        species: 'Species',
        sex: 'Gender',
        neutered: true,
        breed: 'Breed',
        mixedBreed: true,
        size: 'Size',
        name: 'Name',
        birthdate: '2008-12-31',
        avatarUrl: 'AvatarUrl',
        foodPreferences: null,
        fullAge: 'FullAge');

    test('initial state is correct', () async {
      await nutribotChatBloc.close();
      var stateList = await nutribotChatBloc.toList();
      expect(stateList[0] is NutribotChatInitial, true);
    });

    test('initial state can be provided', () async {
      if (ServiceLocator.container.isRegistered<NutribotChatState>()) {
        ServiceLocator.container.unregister<NutribotChatState>();
      }
      ServiceLocator.container.registerSingleton<NutribotChatState>(NutribotChatFlowUpdated((b) => b
        // ignore: missing_required_param
        ..user = User()
        ..chatViewModels = []
        ..model = NutribotModel()));
      initializeBloc(setupInitialState: false);

      await nutribotChatBloc.close();
      var stateList = await nutribotChatBloc.toList();
      expect(stateList.first is NutribotChatFlowUpdated, true);
    });

    test('throw flow updated after initial state with correct user', () async {
      when(nutribotNextStepUseCase.nextStep(any)).thenAnswer((_) => Stream.fromIterable([NutribotAction.init()]));

      nutribotChatBloc.add(NutribotChatStarted((b) => b
        ..user = User(
          email: 'Email',
          firstName: 'Firstname',
          lastName: 'Lastname',
        )));

      await nutribotChatBloc.close();

      expect(nutribotChatBloc.state.user.email, 'Email');
      expect(nutribotChatBloc.state.user.firstName, 'Firstname');
      expect(nutribotChatBloc.state.user.lastName, 'Lastname');
    });

    test('pet is set in state when PetDefinitionBloc updates and closes', () async {
      final petDefinitionListener = Completer();
      when(petDefinitionBloc.listen(any, onDone: anyNamed('onDone'))).thenAnswer((Invocation invocation) {
        petDefinitionListener.complete(
            CaughtListener(onData: invocation.positionalArguments.first, onDone: invocation.namedArguments[#onDone]));
        return null;
      });
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askWeightManagament()]));

      nutribotChatBloc.add(PetDefinitionStarted());
      final caughtListeners = await petDefinitionListener.future;

      caughtListeners.onData(PetDefinitionState((b) => b..pet = pet));
      caughtListeners.onDone();

      await expectLater(
          nutribotChatBloc,
          emitsThrough(allOf(
            isA<NutribotChatInputRequested>(),
            hasBotMessageMatcher(NutribotChatMessageType.askWeightManagement),
          )));
      expect(nutribotChatBloc.state.model.pet, pet);
    });

    test('ask if the pet needs weight management food', () async {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askWeightManagament()]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askWeightManagement);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });
    test('ask if the cat is an outdoor cat', () async {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askIsOutdoorCat()]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askIsOutdoor);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });

    test('asks if the pet has dull coat or dry skin', () async {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askDullCoatOrDrySkin()]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askDullCoatOrDrySkin);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });

    test('ask if the pet has hip joint issues', () async {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askHipJointsIssues()]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askHipJointsIssues);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });

    test('ask the pets food sensitivities', () async {
      final option = FoodSensitivity(key: null, value: 'No');
      when(nutribotNextStepUseCase.nextStep(any)).thenAnswer((_) => Stream.fromIterable([
            NutribotAction.askFoodSensitivity([option])
          ]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askFoodSensitivity);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });

    test('ask the pets prefered food type', () async {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askPreferedFoodType([])]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askPreferedFoodType);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });

    test('ask feedback', () async {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.askFeedBack()]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);
      final stateList = <NutribotChatState>[];
      final recordedEnough = Completer();

      nutribotChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await recordedEnough.future;
      await nutribotChatBloc.close();

      expect((stateList.last.chatViewModels.last as MessageTypeChatViewModel).messageType,
          NutribotChatMessageType.askFeedback);
      expect(stateList.last.input.type, ChatViewModelType.input);
    });

    test('show message when dont have food recommendations for the pet', () {
      when(nutribotNextStepUseCase.nextStep(any))
          .thenAnswer((_) => Stream.fromIterable([NutribotAction.foodRecommendation([])]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);

      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      expectLater(nutribotChatBloc, emitsThrough(hasBotMessageMatcher(NutribotChatMessageType.noFoodRecommended)));
    });

    test('show results when have food recommendations for the pet', () async {
      when(nutribotNextStepUseCase.nextStep(any)).thenAnswer((_) => Stream.fromIterable([
            NutribotAction.foodRecommendation([foodRecomended1, foodRecomended2])
          ]));
      final petDefinedState = (nutribotChatBloc.state as NutribotChatInitial).rebuild((b) => b..model.pet = pet);

      final isLastRecommendationMessage = predicate((NutribotChatState state) {
        if (state.chatViewModels.isEmpty) {
          return false;
        }
        return state.chatViewModels.last is NutribotRecommendationViewModel &&
            (state.chatViewModels.last as NutribotRecommendationViewModel).titleType ==
                NutribotChatMessageType.foodOtherOptions;
      });

      final isInputRequested = predicate((NutribotChatState state) => state.input is YesNoViewModel);

      nutribotChatBloc.add(NutribotChatSubStateUpdated((b) => b..nutribotChatState = petDefinedState));
      nutribotChatBloc.add(NutribotPetDefinitionEndedEvent());

      await expectLater(nutribotChatBloc, emitsThrough(isLastRecommendationMessage));

      final messages = nutribotChatBloc.state.chatViewModels;
      final firstFoodRecommendation = messages[messages.length - 2] as NutribotRecommendationViewModel;
      final secondFoodRecommendation = messages.last as NutribotRecommendationViewModel;
      expect(firstFoodRecommendation.recipe, foodRecomended1.recipe.productName);
      expect(firstFoodRecommendation.titleType, NutribotChatMessageType.foodTopRecommended);
      expect(secondFoodRecommendation.recipe, foodRecomended2.recipe.productName);
      expect(secondFoodRecommendation.titleType, NutribotChatMessageType.foodOtherOptions);

      when(nutribotNextStepUseCase.nextStep(any)).thenAnswer((_) => Stream.fromIterable([
            NutribotAction.askFeedBack(),
          ]));
      await expectLater(nutribotChatBloc, emitsThrough(isInputRequested));
    });

    test('when NutribotTalkWithAVetPressed event is called, the different communication options are displayed', () {
      final hasCommunicationOptions =
          (List<NutribotChatMessageType> optionMessageTypes) => predicate((NutribotChatState state) {
                final input = state.input;
                if (input is SingleOptionsSelectorViewModel) {
                  return optionMessageTypes
                      .any((messageType) => !input.items.map((item) => item.key).contains(messageType));
                }
                return false;
              }, 'has ${optionMessageTypes.map((m) => m.toString()).join(', ')} communication options');

      expectLater(
        nutribotChatBloc,
        emitsThrough(
          hasCommunicationOptions([
            NutribotChatMessageType.chat,
            NutribotChatMessageType.noThanks,
          ]),
        ),
      );
      nutribotChatBloc.add(NutribotTalkWithAVetPressed());
    });

    test('shows available options at the end of consultation', () async {
      final event = NutribotChatFeedbackPressed((b) => b..feedback = true);
      nutribotChatBloc.add(event);
      await nutribotChatBloc.close();
      var stateList = await nutribotChatBloc.toList();

      ButtonsInputChatViewModel buttonsInputChatViewModel = stateList.last.input;

      expect(buttonsInputChatViewModel.items[0], ChatButtonOptionType.talkWithAVet);
      expect(buttonsInputChatViewModel.items[1], ChatButtonOptionType.askAnotherQuestion);
      expect(buttonsInputChatViewModel.items[2], ChatButtonOptionType.backHome);
    });
  });
}
