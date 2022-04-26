import 'dart:async';

import 'package:common_barkibu_dart/bloc/pet_health_chat/symptom_definition/symptom_definition_bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_health_chat/symptom_definition/symptom_definition_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/aivet/patient_definition_next_step_use_case.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';
import '../../service_locator.dart' as test_service_locator;
import '../utils/view_model_matcher.dart';

class MockPatientDefinitionNextStepUseCase extends Mock implements PatientDefinitionNextStepUseCase {}

class MockPetProfileBloc extends Mock implements PetProfileBloc {}

class MockSearchSymptomUseCase extends Mock implements SearchSymptomUseCase {}

void main() {
  test_service_locator.ServiceLocator.setup();
  SymptomDefinitionBloc symptomDefinitionBloc;
  AnalyticsService analyticsService;
  SearchSymptomUseCase searchSymptomUseCase;
  final symptom = Symptom(key: 'broken-leg', name: 'Broken leg');
  final configuration = ServiceLocator.container<Configuration>();

  void initializeBloc({bool setupInitialState = true}) {
    symptomDefinitionBloc?.close();
    analyticsService = MockAnalyticsService();
    searchSymptomUseCase = MockSearchSymptomUseCase();
    symptomDefinitionBloc = SymptomDefinitionBloc(searchSymptomUseCase, analyticsService);
  }

  setUp(() {
    initializeBloc();
  });

  tearDown(() {
    symptomDefinitionBloc?.close();
  });

  group('SymptomDefinitionBloc', () {
    test('PetHealthChatSymptomDefinitionStarted ask for a symptom if not passed any', () {
      final pet = Pet(name: 'Carotter');
      final event = PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = pet
        ..isMainSymptom = true);

      expectLater(
        symptomDefinitionBloc,
        emitsInOrder([
          isA<SymptomDefinitionState>(), // Initial State
          botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
          predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
        ]),
      );
      symptomDefinitionBloc.add(event);
    });

    test('PetHealthChatSkipSymptomPressed closes block with skipped flag', () async {
      final event = PetHealthChatSkipSymptomPressed();
      symptomDefinitionBloc.add(event);
      final state = (await symptomDefinitionBloc.toList()).last;
      expect(state.symptom, isNotNull); // Empty dummy symptom
      expect(state.skipped, isTrue);
    });

    group('skiping primary symptom definition', () {
      final hasTwoUnkownSymptoms = predicate((SymptomDefinitionState state) => state.unknownSymptoms.length >= 2);
      final hasInput = predicate((SymptomDefinitionState state) => state.viewModel.type == ChatViewModelType.input);

      void setUpBloc({bool skipPrimarySymptomEnabled}) async {
        final pet = Pet(id: 1, name: 'Carotte');
        final petParentRequest = 'Something unknown';
        when(configuration.skipPrimarySymptomEnabled).thenReturn(skipPrimarySymptomEnabled);
        when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.value([]));
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = pet
          ..isMainSymptom = true);
        final searchSymptomEvent = PetHealthChatSymptomNameSent((b) => b..symptom = petParentRequest);

        symptomDefinitionBloc.add(startEvent);
        symptomDefinitionBloc.add(searchSymptomEvent);
        symptomDefinitionBloc.add(searchSymptomEvent);
        await expectLater(symptomDefinitionBloc, emitsThrough(allOf(hasTwoUnkownSymptoms, hasInput)));
      }

      test('allows user to skip a symptom after two failed attempts', () async {
        await setUpBloc(skipPrimarySymptomEnabled: true);
        expect(symptomDefinitionBloc.state.viewModel, isA<TextInputAndSingleOptionsSelectorViewModel>());
      });

      test('does not allow to skip symptom if skipPrimarySymptomEnabled is false', () async {
        await setUpBloc(skipPrimarySymptomEnabled: false);
        expect(symptomDefinitionBloc.state.viewModel, isA<TextInputSimpleChatViewModel>());
      });
    });

    test('PetHealthChatSymptomDefinitionStarted ask for presence if passed a symptom', () {
      final pet = Pet(name: 'Carotter');
      final question = 'Is your pet hurting?';
      final nextQuestion = NextQuestion(symptomKey: 'sympt', question: question, answersType: AnswersType.YesNoUnknown);
      final event = PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = pet
        ..nextQuestion = nextQuestion);

      expectLater(
        symptomDefinitionBloc,
        emitsInOrder([
          isA<SymptomDefinitionState>(), // Initial State
          predicate((state) =>
              state.viewModel is MessageChatViewModel && (state.viewModel as MessageChatViewModel).message == question),
          predicate((state) => state.viewModel is YesNoUnknownViewModel),
        ]),
      );
      symptomDefinitionBloc.add(event);
    });

    test('PetHealthChatSymptomDefinitionStarted look for a symptom if passed a text', () {
      final pet = Pet(id: 1, name: 'Carotte');
      final petParentRequest = 'Carotte is limping';
      final symptomFound = SymptomFound(duration: true, frequency: true, symptom: symptom);
      when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.value([symptomFound]));
      final event = PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = pet
        ..userQuestion = petParentRequest
        ..isMainSymptom = true);

      expectLater(
        symptomDefinitionBloc,
        emitsInOrder([
          isA<SymptomDefinitionState>(), // Initial State
          botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
          ownMessageMatcher(petParentRequest),
          botMessageMatcher(PetHealthChatMessageType.askSymptomConfirmation),
          predicate((state) => state.viewModel is SingleOptionsSelectorViewModel),
        ]),
      );
      symptomDefinitionBloc.add(event);
    });

    group('PetHealthChatSymptomNameSent', () {
      test('look for a symptom', () async {
        final pet = Pet(id: 1, name: 'Carotte');
        final petParentRequest = 'Carotte is limping';
        final symptom = Symptom(key: 'broken-leg', name: 'Broken leg');
        final symptomFound = SymptomFound(duration: true, frequency: true, symptom: symptom);
        when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.value([symptomFound]));
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = pet
          ..isMainSymptom = true);
        final event = PetHealthChatSymptomNameSent((b) => b..symptom = petParentRequest);

        expect(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
            predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
            ownMessageMatcher(petParentRequest),
            botMessageMatcher(PetHealthChatMessageType.askSymptomConfirmation),
            predicate((state) => state.viewModel is SingleOptionsSelectorViewModel),
          ]),
        );
        symptomDefinitionBloc.add(startEvent);
        symptomDefinitionBloc.add(event);
        await symptomDefinitionBloc.close();

        verify(searchSymptomUseCase.findSymptoms(1, petParentRequest)).called(1);
      });

      test('display symptoms to choose from', () {
        final pet = Pet(id: 1, name: 'Carotte');
        final petParentRequest = 'Carotte is limping';
        final symptomFound = SymptomFound(duration: true, frequency: true, symptom: symptom);
        when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.value([symptomFound]));
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = pet
          ..isMainSymptom = true);
        final event = PetHealthChatSymptomNameSent((b) => b..symptom = petParentRequest);

        expectLater(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
            predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
            ownMessageMatcher(petParentRequest),
            botMessageMatcher(PetHealthChatMessageType.askSymptomConfirmation),
            predicate((state) => state.viewModel is SingleOptionsSelectorViewModel),
          ]),
        );
        symptomDefinitionBloc.add(startEvent);
        symptomDefinitionBloc.add(event);
      });

      test('ask again if symptom is not understood', () {
        final pet = Pet(id: 1, name: 'Carotte');
        final petParentRequest = 'Carotte is limping';
        when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.value([]));
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = pet
          ..isMainSymptom = true);
        final event = PetHealthChatSymptomNameSent((b) => b..symptom = petParentRequest);

        expectLater(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
            predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
            ownMessageMatcher(petParentRequest),
            botMessageMatcher(PetHealthChatMessageType.symptomIsEmpty),
            predicate((state) =>
                state.viewModel is TextInputSimpleChatViewModel && state.unknownSymptoms.contains(petParentRequest)),
          ]),
        );
        symptomDefinitionBloc.add(startEvent);
        symptomDefinitionBloc.add(event);
      });

      test('inform of error if symptom search fails', () {
        final pet = Pet(id: 1, name: 'Carotte');
        final petParentRequest = 'Carotte is limping';
        when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.error('error'));
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = pet
          ..isMainSymptom = true);
        final event = PetHealthChatSymptomNameSent((b) => b..symptom = petParentRequest);

        expectLater(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
            predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
            ownMessageMatcher(petParentRequest),
            botMessageMatcher(PetHealthChatMessageType.symptomHasError),
            predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
          ]),
        );
        symptomDefinitionBloc.add(startEvent);
        symptomDefinitionBloc.add(event);
      });
    });

    group('PetHealthChatConfirmSymptomPressed', () {
      final symptomFound = SymptomFound(duration: true, frequency: true, symptom: symptom);

      test('set the symptom', () async {
        final event = PetHealthChatConfirmSymptomPressed((b) => b..symptomFoundViewModel.key = symptomFound);

        symptomDefinitionBloc.add(event);
        await symptomDefinitionBloc.close();
        final state = (await symptomDefinitionBloc.toList()).last;
        expect(state.symptom.presence, 'yes');
        expect(state.symptom.key, symptom.key);
        expect(state.symptom.name, symptom.name);
      });

      test('ask duration if required', () {
        final event = PetHealthChatConfirmSymptomPressed((b) => b..symptomFoundViewModel.key = symptomFound);

        expectLater(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            ownMessageMatcher(symptom.name),
            botMessageMatcher(PetHealthChatMessageType.symptomFound),
            botMessageMatcher(PetHealthChatMessageType.askSymptomDuration),
            predicate((state) => state.viewModel is SingleOptionsSelectorViewModel),
          ]),
        );

        symptomDefinitionBloc.add(event);
      });

      test('ask frequency if required and duration not required', () {
        final symptomFoundNoDurationRequired = SymptomFound(duration: false, frequency: true, symptom: symptom);
        final event =
            PetHealthChatConfirmSymptomPressed((b) => b..symptomFoundViewModel.key = symptomFoundNoDurationRequired);

        expectLater(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            ownMessageMatcher(symptom.name),
            botMessageMatcher(PetHealthChatMessageType.symptomFound),
            botMessageMatcher(PetHealthChatMessageType.askSymptomFrequency),
            predicate((state) => state.viewModel is SingleOptionsSelectorViewModel),
          ]),
        );

        symptomDefinitionBloc.add(event);
      });

      test('close the bloc if nothing required', () async {
        final symptomFoundNothingRequired = SymptomFound(duration: false, frequency: false, symptom: symptom);
        final event =
            PetHealthChatConfirmSymptomPressed((b) => b..symptomFoundViewModel.key = symptomFoundNothingRequired);

        symptomDefinitionBloc.add(event);
        final state = (await symptomDefinitionBloc.toList()).last;
        expect(state.symptom.key, symptom.key);
      });

      test('asks to re-enter symptom query if "None of these" is selected', () {
        final pet = Pet(id: 1, name: 'Carotte');
        final petParentRequest = 'Carotte is limping';
        final symptomFound = SymptomFound(duration: true, frequency: true, symptom: symptom);
        when(searchSymptomUseCase.findSymptoms(1, petParentRequest)).thenAnswer((_) => Future.value([symptomFound]));
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = pet
          ..isMainSymptom = true);
        final typeSearchEvent = PetHealthChatSymptomNameSent((b) => b..symptom = petParentRequest);
        final selectEvent = PetHealthChatConfirmSymptomPressed((b) => b..symptomFoundViewModel.key = null);

        expectLater(
          symptomDefinitionBloc,
          emitsInOrder([
            isA<SymptomDefinitionState>(), // Initial State
            botMessageMatcher(PetHealthChatMessageType.askSymptomQuestion),
            predicate((state) => state.viewModel is TextInputSimpleChatViewModel),
            ownMessageMatcher(petParentRequest),
            botMessageMatcher(PetHealthChatMessageType.askSymptomConfirmation),
            predicate((state) => state.viewModel is SingleOptionsSelectorViewModel),
            ownMessageTypeMatcher(PetHealthChatMessageType.noneOfThese),
            botMessageMatcher(PetHealthChatMessageType.symptomIsEmpty),
            predicate((state) =>
                state.viewModel is TextInputSimpleChatViewModel && state.unknownSymptoms.contains(petParentRequest)),
          ]),
        );
        symptomDefinitionBloc.add(startEvent);
        symptomDefinitionBloc.add(typeSearchEvent);
        symptomDefinitionBloc.add(selectEvent);
      });
    });

    group('PetHealthChatSetSymptomDurationCyclePressed', () {
      test('close the bloc if frequency is not required', () async {
        final nextQuestion = NextQuestion(
            symptomKey: 'symptom-key', question: 'Is Carotter hurting?', answersType: AnswersType.YesNoUnknown);
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = Pet(name: 'Carotte')
          ..nextQuestion = nextQuestion);
        final symptomDuration = SymptomDurationCycle(key: 'a_lot', label: 'A lot');
        final event = PetHealthChatSetSymptomDurationCyclePressed((b) => b..optionDuration = symptomDuration);

        symptomDefinitionBloc.add(startEvent);

        symptomDefinitionBloc.add(event);
        final state = (await symptomDefinitionBloc.toList()).last;
        expect(state.symptom.key, 'symptom-key');
      });

      test('ask the frequency if required', () {
        final question = 'Is Carotte hurting?';
        final nextQuestion = NextQuestion(
            symptomKey: 'symptom-key', question: question, answersType: AnswersType.YesNoUnknown, frequency: true);
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = Pet(name: 'Carotte')
          ..nextQuestion = nextQuestion);
        final symptomDuration = SymptomDurationCycle(key: 'a_lot', label: 'A lot');
        final event = PetHealthChatSetSymptomDurationCyclePressed((b) => b..optionDuration = symptomDuration);

        symptomDefinitionBloc.add(startEvent);

        expectLater(
            symptomDefinitionBloc,
            emitsInOrder([
              isA<SymptomDefinitionState>(), // Initial State
              predicate((state) =>
                  state.viewModel is MessageChatViewModel &&
                  (state.viewModel as MessageChatViewModel).message == question),
              predicate((state) => state.viewModel is YesNoUnknownViewModel),
              ownMessageMatcher(symptomDuration.label),
              botMessageMatcher(PetHealthChatMessageType.askSymptomFrequency),
              predicate((state) => state.viewModel is SingleOptionsSelectorViewModel)
            ]));
        symptomDefinitionBloc.add(event);
      });
    });

    test('PetHealthChatSetSymptomFrequencyCyclePressed close the bloc', () async {
      final nextQuestion = NextQuestion(
          symptomKey: 'symptom-key', question: 'Is Carotter hurting?', answersType: AnswersType.YesNoUnknown);
      final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = Pet(name: 'Carotte')
        ..nextQuestion = nextQuestion);
      final symptomFrequency = SymptomFrequencyCycle(key: 'often', label: 'Often');
      final event = PetHealthChatSetSymptomFrequencyCyclePressed((b) => b..optionFrequency = symptomFrequency);

      symptomDefinitionBloc.add(startEvent);

      symptomDefinitionBloc.add(event);
      final state = (await symptomDefinitionBloc.toList()).last;
      expect(state.symptom.frequency, symptomFrequency);
    });

    test('PetHealthChatSymptomDefinitionStarted with a question with hint generate a message with help', () async {
      final question = 'Is Carotter hurting?';
      final symptomName = 'symptom-name';
      final hint = 'question-hint';

      final nextQuestion = NextQuestion(
          symptomKey: 'symptom-key',
          question: question,
          answersType: AnswersType.YesNoUnknown,
          symptomName: symptomName,
          hint: hint);
      final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
        ..pet = Pet(name: 'Carotte')
        ..nextQuestion = nextQuestion);
      symptomDefinitionBloc.add(startEvent);

      await expectLater(
        symptomDefinitionBloc,
        emitsInOrder([
          isA<SymptomDefinitionState>(),
          botMessageWithHelpMatcher(message: question, helpContent: hint, helpTitle: symptomName),
          predicate((state) => state.viewModel is YesNoUnknownViewModel)
        ]),
      );
    });

    group('PetHealthChatSymptomPresencePressed', () {
      test('close the bloc if no', () async {
        final nextQuestion = NextQuestion(
            symptomKey: 'symptom-key', question: 'Is Carotter hurting?', answersType: AnswersType.YesNoUnknown);
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = Pet(name: 'Carotte')
          ..nextQuestion = nextQuestion);
        final event = PetHealthChatSymptomPresencePressed((b) => b..presence = false);

        symptomDefinitionBloc.add(startEvent);

        symptomDefinitionBloc.add(event);
        final state = (await symptomDefinitionBloc.toList()).last;
        expect(state.symptom.presence, 'no');
      });

      test('ask duration if yes and required', () {
        final question = 'Is Carotte hurting?';
        final nextQuestion = NextQuestion(
            symptomKey: 'symptom-key', question: question, answersType: AnswersType.YesNoUnknown, duration: true);
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = Pet(name: 'Carotte')
          ..nextQuestion = nextQuestion);
        final event = PetHealthChatSymptomPresencePressed((b) => b..presence = true);

        symptomDefinitionBloc.add(startEvent);
        expectLater(
            symptomDefinitionBloc,
            emitsInOrder([
              isA<SymptomDefinitionState>(), // Initial State
              predicate((state) =>
                  state.viewModel is MessageChatViewModel &&
                  (state.viewModel as MessageChatViewModel).message == question),
              predicate((state) => state.viewModel is YesNoUnknownViewModel),
              ownMessageTypeMatcher(PetHealthChatMessageType.yes),
              botMessageMatcher(PetHealthChatMessageType.askSymptomDuration),
              predicate((state) => state.viewModel is SingleOptionsSelectorViewModel)
            ]));
        symptomDefinitionBloc.add(event);
      });

      test('ask frequency if yes and duration not required', () {
        final question = 'Is Carotte hurting?';
        final nextQuestion = NextQuestion(
            symptomKey: 'symptom-key', question: question, answersType: AnswersType.YesNoUnknown, frequency: true);
        final startEvent = PetHealthChatSymptomDefinitionStarted((b) => b
          ..pet = Pet(name: 'Carotte')
          ..nextQuestion = nextQuestion);
        final event = PetHealthChatSymptomPresencePressed((b) => b..presence = true);

        symptomDefinitionBloc.add(startEvent);
        expectLater(
            symptomDefinitionBloc,
            emitsInOrder([
              isA<SymptomDefinitionState>(), // Initial State
              predicate((state) =>
                  state.viewModel is MessageChatViewModel &&
                  (state.viewModel as MessageChatViewModel).message == question),
              predicate((state) => state.viewModel is YesNoUnknownViewModel),
              ownMessageTypeMatcher(PetHealthChatMessageType.yes),
              botMessageMatcher(PetHealthChatMessageType.askSymptomFrequency),
              predicate((state) => state.viewModel is SingleOptionsSelectorViewModel)
            ]));
        symptomDefinitionBloc.add(event);
      });
    });
  });
}
