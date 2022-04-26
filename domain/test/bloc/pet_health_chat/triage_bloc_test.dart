import 'dart:async';

import 'package:common_barkibu_dart/bloc/pet_health_chat/triage/triage.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/aivet/triage_next_step_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_features_use_case.dart';
import 'package:common_barkibu_dart/models/aivet/triage_actions.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';
import '../../service_locator.dart' as test_service_locator;

class MockTriageNextStepUseCase extends Mock implements TriageNextStepUseCase {}

class MockTwilioChatService extends Mock implements TwilioChatService {}

class MockSearchSymptomUseCase extends Mock implements SearchSymptomUseCase {}

class MockUpdateUserUseCase extends Mock implements UpdateUserUseCase {}

class MockGetPetFeaturesUseCase extends Mock implements GetPetFeaturesUseCase {}

class CaughtListener {
  final onDone;
  final onData;

  CaughtListener({this.onDone, this.onData});
}

void main() {
  test_service_locator.ServiceLocator.setup();
  final petDefinitionBloc = ServiceLocator.container<PetDefinitionBloc>();
  TriageNextStepUseCase triageNextStepUseCase;
  AnalyticsService analyticsService;
  SearchSymptomUseCase searchSymptomUseCase;

  final configuration = ServiceLocator.container<Configuration>();

  TriageBloc triageBloc;
  SymptomDefinitionBloc symptomDefinitionBloc;

  void initializeBloc({bool setupInitialState = true, bool telehealthEnabled = true}) {
    when(configuration.telehealthEnabled).thenReturn(telehealthEnabled);
    when(configuration.addPetOptionEnabled).thenReturn(true);
    when(configuration.telehealthEmailEnabled).thenReturn(true);
    when(configuration.telehealthPhoneCallEnabled).thenReturn(true);
    triageBloc?.close();
    symptomDefinitionBloc?.close();

    triageNextStepUseCase = MockTriageNextStepUseCase();
    analyticsService = MockAnalyticsService();
    triageBloc = TriageBloc(triageNextStepUseCase, analyticsService);
    symptomDefinitionBloc = SymptomDefinitionBloc(searchSymptomUseCase, analyticsService);
  }

  setUp(() {
    initializeBloc();
  });

  tearDown(() {
    if (ServiceLocator.container.isRegistered<TriageState>()) {
      ServiceLocator.container.unregister<TriageState>();
    }
    triageBloc?.close();
  });

  group('TriageBloc', () {
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
      fullAge: 'FullAge',
    );

    TriageInitial petDefinedState() =>
        (triageBloc.state as TriageInitial).rebuild((b) => b..aiVetModel = (AiVetModel()..pet = pet));

    test('TriageInitLaunched launch logEntersFirstInput with AIVet type on analytics', () async {
      when(triageNextStepUseCase.nextStep(any, any))
          .thenAnswer((_) => Stream.fromIterable([TriageAction.finishTriage()]));

      triageBloc.add(TriageInitLaunched((b) => b..toHandOver = false));
      await triageBloc.close();
      verify(analyticsService.event.aivet.logEntersFirstInputAIVet());
    });

    test('pet is set in state when PetDefinitionBloc updates and closes', () async {
      final petDefinitionListener = Completer();
      when(petDefinitionBloc.listen(any, onDone: anyNamed('onDone'))).thenAnswer((Invocation invocation) {
        petDefinitionListener.complete(
            CaughtListener(onData: invocation.positionalArguments.first, onDone: invocation.namedArguments[#onDone]));
        return null;
      });
      when(triageNextStepUseCase.nextStep(any, any))
          .thenAnswer((_) => Stream.fromIterable([TriageAction.mainSymptom()]));

      triageBloc.add(PetDefinitionStarted());
      final caughtListeners = await petDefinitionListener.future;

      caughtListeners.onData(PetDefinitionState((b) => b..pet = pet));
      caughtListeners.onDone();

      expect(triageBloc.state.aiVetModel.pet, pet);
    });

    test('Set the consultationId on aivetModel and emit updated state when nextStep emits bindConsultationId',
        () async {
      final consultationId = 'aivet_consultation_id';
      final symptom = Symptom(duration: null, frequency: null, name: 'Broken Leg', key: 'broken_leg');
      final unknownSymptoms = ['my dog does breakdance'];

      when(triageNextStepUseCase.nextStep(any, any))
          .thenAnswer((_) => Stream.fromIterable([TriageAction.bindConsultationId(consultationId)]));
      triageBloc.add(TriageSubStateUpdated((b) => b..triageState = petDefinedState()));
      triageBloc.add(TriageSymptomDefinitionEnded((b) => b
        ..symptom = symptom
        ..unknownSymptoms = unknownSymptoms));
      await triageBloc.close();
      expect(triageBloc.state.aiVetModel.consultationId, consultationId);
    });

    test('Ask for another symptom once symptom is defined and nextStep says so', () async {
      final anamnesis = Anamnesis(conditions: [], shouldStop: false);
      final symptom = Symptom(duration: null, frequency: null, name: 'Broken Leg', key: 'broken_leg');
      final unknownSymptoms = ['my dog does breakdance'];
      when(triageNextStepUseCase.nextStep(any, any))
          .thenAnswer((_) => Stream.fromIterable([TriageAction.symptomsSecondCycle(anamnesis)]));
      final stateList = <TriageState>[];
      final recordedEnough = Completer();

      triageBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.viewModel is MessageTypeChatViewModel) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });

      triageBloc.add(TriageSubStateUpdated((b) => b..triageState = petDefinedState()));
      triageBloc.add(TriageSymptomDefinitionEnded((b) => b
        ..symptom = symptom
        ..unknownSymptoms = unknownSymptoms));
      await recordedEnough.future;
      await triageBloc.close();

      final lastTriageState = stateList.last;

      expect(lastTriageState.aiVetModel.unknownSymptoms, unknownSymptoms);
      expect((lastTriageState.viewModel as MessageTypeChatViewModel).messageType,
          PetHealthChatMessageType.askSymptomQuestion);
    });

    test('Ask for more symptom if anamnesis is over', () async {
      final anamnesis = Anamnesis(
          conditions: [Condition(key: 'osteoroposis', name: 'Osteo-porosis', article: 'Bad bone disease', score: 8.9)],
          shouldStop: true);
      final symptom = Symptom(duration: null, frequency: null, name: 'Broken Leg', key: 'broken_leg');
      when(triageNextStepUseCase.nextStep(any, any))
          .thenAnswer((_) => Stream.fromIterable([TriageAction.symptomsSecondCycle(anamnesis)]));
      final stateList = [];
      final recordedEnough = Completer();

      triageBloc.listen((state) {
        if (!recordedEnough.isCompleted && state.viewModel is MessageTypeChatViewModel) {
          recordedEnough.complete();
        }
        stateList.add(state);
      });
      triageBloc.add(TriageSubStateUpdated((b) => b.triageState = petDefinedState()));
      triageBloc.add(TriageSymptomDefinitionEnded((b) => b.symptom = symptom));
      await recordedEnough.future;
      await triageBloc.close();

      expect((triageBloc.state.viewModel as YesNoViewModel).chatFlow, isA<AddMoreSymptomsAIVetChatFlow>());
    });
  });

  test('when error happens on aivet, the error message is showed and different communication options are displayed',
      () async {
    when(triageNextStepUseCase.nextStep(any, any))
        .thenAnswer((_) => Stream.fromIterable([TriageAction.unexpectedError()]));

    final symptom = Symptom(key: 'key', name: 'Name');
    final symptomFound = SymptomFound(symptom: symptom);
    triageBloc.add(TriageSubStateUpdated((b) => b.triageState = triageBloc.state.rebuild((b) => b
      ..aiVetModel = (AiVetModel()
        ..symptomFound = symptomFound
        ..symptoms = [symptom]))));

    var stateList = [];
    triageBloc.listen((s) => stateList.add(s));

    triageBloc.add(TriageSymptomDefinitionEnded((b) => b..symptom = symptom));
    await triageBloc.close();

    MessageTypeChatViewModel errorMessageChatViewModel = stateList[stateList.length - 2].viewModel;
    ButtonsInputChatViewModel singleOptionsSelectorViewModel = stateList.last.viewModel;

    expect(errorMessageChatViewModel.messageType, PetHealthChatMessageType.unexpectedError);
    expect(singleOptionsSelectorViewModel is ButtonsInputChatViewModel, true);
    expect(singleOptionsSelectorViewModel.items[0], ChatButtonOptionType.askAnotherQuestion);
    expect(singleOptionsSelectorViewModel.items[1], ChatButtonOptionType.backHome);
  });
}
