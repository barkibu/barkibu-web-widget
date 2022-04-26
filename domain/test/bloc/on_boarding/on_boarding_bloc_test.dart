import 'dart:async';
import 'dart:convert';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/on_boarding/on_boarding.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../utils/map_matcher.dart';

class MockOnBoardingActioner extends Mock implements OnBoardingActioner {}

class MockOnBoardingAction extends Mock implements OnBoardingAction {}

class MockSecureStorage extends Mock implements SecureStorage {}

class SpyOnBoardingBloc extends OnBoardingBloc {
  final eventStreamController = StreamController<OnBoardingEvent>();

  SpyOnBoardingBloc(SecureStorage secureStorage, List<OnBoardingActioner> actioners) : super(secureStorage, actioners);

  @override
  void add(OnBoardingEvent event) {
    super.add(event);
    eventStreamController.add(event);
  }
}

void main() {
  SecureStorage secureStorage;
  OnBoardingBloc onBoardingBloc;
  OnBoardingActioner onBoardingActionerA;
  OnBoardingActioner onBoardingActionerB;
  OnBoardingAction onBoardingAction;
  OnBoardingAction onBoardingActionBis;
  final key = 'AnyUserIdentifier';

  setUp(() {
    secureStorage = MockSecureStorage();
    onBoardingAction = MockOnBoardingAction();
    onBoardingActionBis = MockOnBoardingAction();
    onBoardingActionerA = MockOnBoardingActioner();
    onBoardingActionerB = MockOnBoardingActioner();
    onBoardingBloc = SpyOnBoardingBloc(secureStorage, [onBoardingActionerA, onBoardingActionerB]);
  });

  tearDown(() async {
    await onBoardingBloc?.close();
  });

  group('OnBoardingBloc', () {
    group('OnBoardingStarted event', () {
      final overrides = {
        'actionerB': {'foo': 'bar'}
      };
      final startedEvent = OnBoardingStarted(key, overrides);

      setUp(() {
        when(secureStorage.read('$key.OnBoarding')).thenAnswer((_) async => jsonEncode({
              'actionerB': {'hasStoredState': true}
            }));
        when(onBoardingActionerB.key).thenReturn('actionerB');
        when(onBoardingActionerA.isActionerRelevant(any)).thenAnswer((_) async => false);
        when(onBoardingActionerB.isActionerRelevant(any)).thenAnswer((_) async => true);
        when(onBoardingActionerB.actions(any)).thenAnswer((_) async* {
          yield onBoardingAction;
        });
        when(onBoardingAction.canGoBack(any)).thenReturn(true);
        when(onBoardingActionerA.remainingSteps(any)).thenAnswer((_) async => 1);
        when(onBoardingActionerB.remainingSteps(any)).thenAnswer((_) async => 1);
      });

      test('bloc underlying onBoardingModel is initialized with what\'s stored in SecureStorage', () async {
        onBoardingBloc.add(startedEvent);
        await expectLater(
          onBoardingBloc,
          emitsThrough(isA<OnBoardingFlowUpdateSuccess>()),
        );
        verify(onBoardingActionerB.actions(argThat(mapContains({'hasStoredState': true}))));
      });

      test('bloc underlying onBoardingModel is initialized with the overriden arguments', () async {
        onBoardingBloc.add(startedEvent);
        await expectLater(
          onBoardingBloc,
          emitsThrough(isA<OnBoardingFlowUpdateSuccess>()),
        );
        verify(onBoardingActionerB.actions(argThat(mapContains({'foo': 'bar'}))));
      });

      test('bloc emits a OnBoardingFlowUpdateSuccess', () {
        onBoardingBloc.add(startedEvent);
        expectLater(
          onBoardingBloc,
          emitsThrough(isA<OnBoardingFlowUpdateSuccess>()),
        );
      });

      test('bloc emits the first action of the relevant Actioner', () async {
        onBoardingBloc.add(startedEvent);
        await expectLater(
          onBoardingBloc,
          emitsThrough(
            allOf([
              isA<OnBoardingFlowUpdateSuccess>(),
              hasAction(onBoardingAction),
              hasActioner(onBoardingActionerB),
            ]),
          ),
        );

        verify(onBoardingActionerA.isActionerRelevant(any));
        verify(onBoardingActionerB.isActionerRelevant(any));
        verify(onBoardingActionerB.actions(any));
        verifyNever(onBoardingActionerA.actions(any));
      });

      group('OnBoardingActionAnswer event', () {
        final answerEvent = OnBoardingActionAnswer(10);

        setUp(() {
          when(onBoardingAction.processAnswer(any, any))
              .thenAnswer((realInvocation) => Future.value(realInvocation.positionalArguments[0]));
        });

        test('bloc calls the processAnswer on the previously emitted action', () async {
          onBoardingBloc.add(startedEvent);
          onBoardingBloc.add(answerEvent);
          await onBoardingBloc.close();
          verify(onBoardingAction.processAnswer(any, 10));
        });
      });

      group('when the actioner triggers StepToNextActionerAction', () {
        setUp(() {
          when(onBoardingActionerB.actions(any)).thenAnswer((_) async* {
            yield StepToNextActionerAction();
          });
        });

        test('bloc initiates the process of moving on to the next actioner', () {
          onBoardingBloc.add(startedEvent);
          final addedEventStream = (onBoardingBloc as SpyOnBoardingBloc).eventStreamController.stream;

          expectLater(
            addedEventStream,
            emitsThrough(
              isA<OnBoardingNextActionerTriggered>(),
            ),
          );
        });
      });

      group('OnBoardingNextActionerTriggered event', () {
        setUp(() {
          when(onBoardingActionerA.isActionerRelevant(any)).thenAnswer((_) async => true);
          when(onBoardingActionerA.actions(any)).thenAnswer((_) async* {
            yield onBoardingActionBis;
          });
        });

        test('bloc emits action of the next relevant actioner skipping the current one, and step indicator is correct',
            () {
          onBoardingBloc.add(startedEvent);
          onBoardingBloc.add(OnBoardingNextActionerTriggered());

          expectLater(
            onBoardingBloc,
            emitsInOrder([
              isA<OnBoardingInitial>(),
              allOf([
                isA<OnBoardingFlowUpdateSuccess>(),
                hasAction(onBoardingActionBis),
                hasActioner(onBoardingActionerA),
                hasCorrectRemainingSteps(onBoardingActionerA, 2, 1)
              ]),
              allOf([
                isA<OnBoardingFlowUpdateSuccess>(),
                hasAction(onBoardingAction),
                hasActioner(onBoardingActionerB),
                hasCorrectRemainingSteps(onBoardingActionerB, 2, 2)
              ]),
            ]),
          );
        });
      });

      group('OnBoardingBackPressed event', () {
        group('when the current action allows back navigation', () {
          setUp(() {
            when(onBoardingAction.canGoBack(any)).thenReturn(true);
          });

          test('bloc emits the previous state', () {
            onBoardingBloc.add(startedEvent);
            onBoardingBloc.add(OnBoardingBackPressed());

            expectLater(
              onBoardingBloc,
              emitsInOrder([
                isA<OnBoardingInitial>(),
                isA<OnBoardingFlowUpdateSuccess>(),
                isA<OnBoardingInitial>(),
              ]),
            );
          });
        });
        group('when the current action does not allow back navigation', () {
          setUp(() {
            when(onBoardingAction.canGoBack(any)).thenReturn(false);
          });

          test('it does not emit a new state', () {
            onBoardingBloc.add(startedEvent);
            onBoardingBloc.add(OnBoardingBackPressed());
            onBoardingBloc.close();

            expectLater(
              onBoardingBloc,
              emitsInOrder([
                isA<OnBoardingInitial>(),
                isA<OnBoardingFlowUpdateSuccess>(),
                emitsDone,
              ]),
            );
          });
        });
      });

      group('When no `actioner` remains', () {
        test('bloc emits an OnBoardingProcessSuccess event', () {
          onBoardingBloc.add(startedEvent);
          onBoardingBloc.add(OnBoardingNextActionerTriggered());

          expectLater(
            onBoardingBloc,
            emitsInOrder([
              isA<OnBoardingInitial>(),
              isA<OnBoardingFlowUpdateSuccess>(),
              isA<OnBoardingProcessSuccess>(),
            ]),
          );
        });
      });
    });
  });
}

Matcher hasAction<T extends OnBoardingAction>([T action]) {
  return predicate((OnBoardingFlowUpdateSuccess state) {
    return state.action is T && (action == null || state.action == action);
  }, 'has an action ${action == null ? 'of type $T' : '$action'}');
}

Matcher hasActioner<T extends OnBoardingActioner>([T actioner]) {
  return predicate((OnBoardingFlowUpdateSuccess state) {
    return state.actioner is T && (actioner == null || state.actioner == actioner);
  }, 'has an actioner ${actioner == null ? 'of type $T' : '$actioner'}');
}

Matcher hasCorrectRemainingSteps<T extends OnBoardingActioner>([T actioner, int totalSteps, int currentStep]) {
  return predicate((OnBoardingFlowUpdateSuccess state) {
    return state.stepCount == totalSteps && state.stepIndex == currentStep;
  }, 'has correct remaining steps');
}
