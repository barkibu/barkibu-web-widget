import 'dart:async';

import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/features.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';
import '../../service_locator.dart' as test_service_locator;
import '../reports/assessment_report_bloc_test.dart';
import '../utils/view_model_matcher.dart';

class MockPetHealthNextStepUseCase extends Mock implements PetHealthNextStepUseCase {}

class MockTwilioChatService extends Mock implements TwilioChatService {}

class MockUpdateUserUseCase extends Mock implements UpdateUserUseCase {}

class MockSearchSymptomUseCase extends Mock implements SearchSymptomUseCase {}

class CaughtListener {
  final onDone;
  final onData;

  CaughtListener({this.onDone, this.onData});
}

void main() {
  test_service_locator.ServiceLocator.setup();
  PetHealthNextStepUseCase petHealthNextStepUseCase;
  GetPetAssessmentReportUseCase getAssessmentReportUseCase;
  AnalyticsService analyticsService;
  final configuration = ServiceLocator.container<Configuration>();

  PetHealthChatBloc petHealthChatBloc;

  void initializeBloc({bool setupInitialState = true, bool telehealthEnabled = true}) {
    when(configuration.telehealthEnabled).thenReturn(telehealthEnabled);
    when(configuration.addPetOptionEnabled).thenReturn(true);
    when(configuration.telehealthEmailEnabled).thenReturn(true);
    when(configuration.telehealthChatEnabled).thenReturn(true);
    when(configuration.telehealthPhoneCallEnabled).thenReturn(true);
    when(configuration.reminderEnabled).thenReturn(true);
    when(configuration.isChatMobileClient).thenReturn(false);
    petHealthChatBloc?.close();

    if (setupInitialState) {
      ServiceLocator.container.registerSingleton<PetHealthChatState>(PetHealthChatInitial((b) => b
        ..user = User(
          firstName: 'Testy',
          lastName: 'Testington',
          email: '',
        )));
    }

    petHealthNextStepUseCase = PetHealthNextStepUseCaseImpl();
    analyticsService = MockAnalyticsService();
    getAssessmentReportUseCase = MockGetPetAssessmentReportUseCase();
    petHealthChatBloc = PetHealthChatBloc(petHealthNextStepUseCase, analyticsService, getAssessmentReportUseCase);
  }

  void _setupWithAnamnesis({bool telehealthEnabled = true}) {
    if (ServiceLocator.container.isRegistered<PetHealthChatState>()) {
      ServiceLocator.container.unregister<PetHealthChatState>();
    }
    ServiceLocator.container.registerSingleton<PetHealthChatState>(PetHealthChatFlowUpdated((b) => b
      ..user = User(
        firstName: 'Testy',
        lastName: 'Testington',
        email: '',
      )
      ..anamnesisResults = Anamnesis(
        consultationId: 'testID',
        conditions: [Condition(key: 'osteoroposis', name: 'Osteo-porosis', article: 'Bad bone disease', score: 0.785)],
        urgency: Urgency.medium,
        shouldStop: true,
      )));

    initializeBloc(setupInitialState: false, telehealthEnabled: telehealthEnabled);
  }

  setUp(() {
    initializeBloc();
  });

  tearDown(() {
    if (ServiceLocator.container.isRegistered<PetHealthChatState>()) {
      ServiceLocator.container.unregister<PetHealthChatState>();
    }
    petHealthChatBloc?.close();
  });

  group('PetHealthChatBloc', () {
    final foodPreferences = FoodPreferences(
        needsWeightManagementFood: true,
        hasHipJointIssues: true,
        preferedFoodType: 'PreferedFood',
        foodSensitivities: []);

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
      foodPreferences: foodPreferences,
      fullAge: 'FullAge',
    );

    final updatePetWithFeatures = () {
      petHealthChatBloc.state.aiVetModel.pet = pet;
      petHealthChatBloc.state.aiVetModel.pet.features = Features(insurance: true, telehealth: true);
    };
    test('initial state is correct', () async {
      await petHealthChatBloc.close();
      var stateList = await petHealthChatBloc.toList();
      expect(stateList[0] is PetHealthChatInitial, true);
    });

    test('initial state can be provided', () async {
      if (ServiceLocator.container.isRegistered<PetHealthChatState>()) {
        ServiceLocator.container.unregister<PetHealthChatState>();
      }
      ServiceLocator.container.registerSingleton<PetHealthChatState>(PetHealthChatFlowUpdated((b) => b
        ..user = User(
          firstName: 'Testy',
          lastName: 'Testington',
          email: '',
        )));
      initializeBloc(setupInitialState: false);

      await petHealthChatBloc.close();
      var stateList = await petHealthChatBloc.toList();
      expect(stateList[0] is PetHealthChatFlowUpdated, true);
    });

    test('throw flow updated after initial state with correct user and question', () async {
      petHealthChatBloc.add(PetHealthChatInitLaunched((b) => b
        ..user = User(email: 'Email', firstName: 'Firstname', lastName: 'Lastname')
        ..question = 'Question'));

      await petHealthChatBloc.close();

      expect(petHealthChatBloc.state.user.email, 'Email');
      expect(petHealthChatBloc.state.user.firstName, 'Firstname');
      expect(petHealthChatBloc.state.user.lastName, 'Lastname');
      expect(petHealthChatBloc.state.userQuestion, 'Question');
    });

    test('Show assessment report messages and actions if anamnesis is finished', () async {
      final stateList = [];
      final recordedEnough = Completer();

      when(getAssessmentReportUseCase.getPetAssessment(any)).thenAnswer((_) => Future.value(Assessment()));
      petHealthChatBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.input != null) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      final petHealthAnamnesisCompletedState = PetHealthChatInitial();
      petHealthAnamnesisCompletedState.aiVetModel.triageCompleted = true;
      petHealthChatBloc
          .add(PetHealthChatSubStateUpdated((b) => b..petHealthChatState = petHealthAnamnesisCompletedState));
      petHealthChatBloc.add(PetHealthTriageEnded());
      await recordedEnough.future;
      await petHealthChatBloc.close();

      final assessmentAdvise = stateList.last.chatViewModels.removeLast() as MessageTypeChatViewModel;
      final assessmentFinished = stateList.last.chatViewModels.removeLast() as MessageTypeChatViewModel;

      expect(assessmentFinished.messageType, PetHealthChatMessageType.assessmentFinished);
      expect(assessmentAdvise.messageType, PetHealthChatMessageType.assessmentAdvise);
      expect(stateList.last.input is ButtonInputChatViewModel, true);
      verify(analyticsService.event.aivet.logAnamnesisFinished(any));
    });

    test('the feedback question is shown when PetHealthAssessmentReportShowed event is called', () async {
      _setupWithAnamnesis();
      var stateList = [];
      petHealthChatBloc.listen((state) {
        stateList.add(state);
      });
      when(getAssessmentReportUseCase.getPetAssessment(any)).thenAnswer((_) => Future.value(Assessment()));

      petHealthChatBloc.state.aiVetModel.pet = pet;
      petHealthChatBloc.state.aiVetModel.triageCompleted = true;

      petHealthChatBloc.add(PetHealthTriageEnded());
      petHealthChatBloc.add(PetHealthAssessmentReportShowed());
      await petHealthChatBloc.close();

      YesNoViewModel yesNoViewModel = stateList.last.input;
      expect(stateList.last.input, isA<YesNoViewModel>());
      expect(yesNoViewModel.chatFlow, isA<AskFeedbackAIVetChatFlow>());
    });

    test('PetHealthChatFeedbackPressed adds the response to the message list', () async {
      _setupWithAnamnesis();
      updatePetWithFeatures();
      petHealthChatBloc.add(PetHealthChatFeedbackPressed((b) => b..isAnswerYes = true));

      await petHealthChatBloc.close();
      final positiveFeedbackPredicate = predicate(
          (ChatViewModel vm) =>
              vm is MessageTypeChatViewModel && vm.messageType == PetHealthChatMessageType.positiveFeedbackAnswer,
          'is positive feedback message');
      expect(petHealthChatBloc.state.chatViewModels, contains(positiveFeedbackPredicate));
    });

    group('Available options at the end of assessment', () {
      final completeAssessment = () async {
        final notMoreSymptomsState = (petHealthChatBloc.state as PetHealthChatFlowUpdated)
            .rebuild((b) => b..lastAssessmentKey = 'Some assessment have been done before');

        petHealthChatBloc.add(PetHealthChatSubStateUpdated((b) => b.petHealthChatState = notMoreSymptomsState));
        petHealthChatBloc.add(PetHealthChatFeedbackPressed((b) => b..isAnswerYes = true));

        await petHealthChatBloc.close();
      };

      test('the different pet health chat options are shown when PetHealthChatFeedbackPressed event is called',
          () async {
        _setupWithAnamnesis();
        updatePetWithFeatures();
        await completeAssessment();

        ButtonsInputChatViewModel buttonsInputChatViewModel = petHealthChatBloc.state.input;
        expect(petHealthChatBloc.state.input, isA<ButtonsInputChatViewModel>());
        expect(buttonsInputChatViewModel.items[0], ChatButtonOptionType.openReport);
        expect(buttonsInputChatViewModel.items[1], ChatButtonOptionType.talkWithAVet);
        expect(buttonsInputChatViewModel.items[2], ChatButtonOptionType.askAnotherQuestion);
        expect(buttonsInputChatViewModel.items[3], ChatButtonOptionType.backHome);
      });

      test('talkWithAVet options are hidden when telehealth is disabled', () async {
        _setupWithAnamnesis(telehealthEnabled: false);
        updatePetWithFeatures();
        await completeAssessment();

        ButtonsInputChatViewModel buttonsInputChatViewModel = petHealthChatBloc.state.input;

        expect(buttonsInputChatViewModel.items[0], ChatButtonOptionType.openReport);
        expect(buttonsInputChatViewModel.items[1], ChatButtonOptionType.askAnotherQuestion);
        expect(buttonsInputChatViewModel.items[2], ChatButtonOptionType.backHome);
      });
    });

    test('PetHealthChatInitial is shown when PetHealthChatAskAnotherQuestionPressed event is called', () async {
      var stateList = [];

      await for (PetHealthChatState state
          in petHealthChatBloc.mapEventToState(PetHealthChatAskAnotherQuestionPressed())) {
        stateList.add(state);
      }

      expect(stateList.first is PetHealthChatInitial, true);
    });

    test('Ask for a way to contact with a vet if symptom definition is skipped', () async {
      final symptomDefinitionSkipped = (petHealthChatBloc.state as PetHealthChatInitial).rebuild((b) => b
        ..aiVetModel.symptomDefinitionSkipped = true
        ..aiVetModel.triageCompleted = true);

      petHealthChatBloc.state.aiVetModel.pet = pet;

      petHealthChatBloc.add(PetHealthChatSubStateUpdated((b) => b.petHealthChatState = symptomDefinitionSkipped));
      petHealthChatBloc.add(PetHealthTriageEnded());

      await expectLater(
          petHealthChatBloc,
          emitsThrough(allOf(
            isA<PetHealthChatInputRequested>(),
            hasBotMessageMatcher(ContactVetMessageType.channelChoice),
          )));
    });
  });
}
