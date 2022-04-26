import 'dart:async';

import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/viewmodels/contact_vet/contact_vet_message_type.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';
import '../../service_locator.dart' as test_service_locator;
import '../profile/profile_bloc_test.dart';
import '../utils/view_model_matcher.dart';

Matcher hasStatus(ContactVetStatus status) {
  return predicate((ContactVetState state) {
    return state.status == status;
  }, 'has status $status');
}

Matcher hasChannelType(ChannelType channelType) {
  return predicate((ContactVetState state) {
    return state.channelType == channelType;
  }, 'has channelType $channelType');
}

Matcher hasCorrectEmailData(String emailAccount, String subject) {
  return predicate((ContactVetState state) {
    final buttonViewModel = state.viewModel as ButtonsInputChatViewModel;
    return buttonViewModel.data['to'] == emailAccount &&
        buttonViewModel.data['subject'] == subject &&
        buttonViewModel.data['body'].isNotEmpty;
  }, 'has correct email data');
}

class MockUser extends Mock implements User {
  @override
  String email = 'my@test.com';
  @override
  String firstName = 'Jmj';

  @override
  String lastName = 'Oxygene';

  @override
  String get fullName => 'Jmj Oxygene';
}

void main() {
  test_service_locator.ServiceLocator.setup();
  Configuration configuration;
  AnalyticsService analyticsService;
  MonitoringService monitoringService;
  ContactVetBloc contactVetBloc;
  UpdateUserUseCase _updateUserUseCase;

  final user = MockUser();
  final pet = Pet(name: 'Johnny');
  final emailAccount = 'vet@help.com';

  void initializeBloc() {
    contactVetBloc?.close();
    configuration = ServiceLocator.container<Configuration>();
    _updateUserUseCase = MockUpdateUserUseCase();
    when(user.fullPhoneNumber).thenReturn('+34 124395');
    when(configuration.telehealthEnabled).thenReturn(true);
    when(configuration.emailNewLineFormat).thenReturn('CRLF');
    when(configuration.chatOnPhoneCallUrl).thenReturn('http://CalendlyUrl.com');
    when(configuration.telehealthEmailEnabled).thenReturn(false);
    when(configuration.telehealthChatEnabled).thenReturn(true);
    when(configuration.emailAccount).thenReturn(emailAccount);
    when(configuration.telehealthPhoneCallEnabled).thenReturn(false);
    contactVetBloc = ContactVetBloc(configuration, _updateUserUseCase);
    if (!ServiceLocator.container.isRegistered<AnalyticsService>()) {
      analyticsService = MockAnalyticsService();
      ServiceLocator.container.registerSingleton<AnalyticsService>(analyticsService);
    }
    if (!ServiceLocator.container.isRegistered<MonitoringService>()) {
      monitoringService = MockMonitoringService();
      ServiceLocator.container.registerSingleton<MonitoringService>(monitoringService);
    }
  }

  setUp(() {
    initializeBloc();
  });

  tearDown(() {
    contactVetBloc?.close();
  });

  test('Initial State is ContactVetState', () {
    final initialState = contactVetBloc.state;
    expect(initialState, hasStatus(ContactVetStatus.initial));
  });

  final startedEvent = ContactVetStarted((b) => b
    ..user = user
    ..type = Flow.virtualVet
    ..symptoms = []
    ..pet = pet);

  group('ContactVetStarted', () {
    test('Shows question when withQuestion is set to true', () {
      expectLater(
          contactVetBloc,
          emitsInOrder([
            hasStatus(ContactVetStatus.initial),
            allOf(
              hasStatus(ContactVetStatus.presentChoiceInProgress),
              botMessageMatcher(ContactVetMessageType.channelChoice),
            ),
            hasStatus(ContactVetStatus.presentChoiceSuccess),
          ]));
      contactVetBloc.add(startedEvent.rebuild((b) => b..withQuestion = true));
    });

    group('with email enabled', () {
      setUp(() {
        when(configuration.telehealthEmailEnabled).thenReturn(true);
        when(configuration.telehealthChatEnabled).thenReturn(true);
        when(configuration.telehealthPhoneCallEnabled).thenReturn(false);
      });

      test('ContactVetStarted shows the contact options', () {
        expectLater(
            contactVetBloc,
            emitsInOrder([
              hasStatus(ContactVetStatus.initial),
              hasStatus(ContactVetStatus.presentChoiceInProgress),
              allOf(
                hasStatus(ContactVetStatus.presentChoiceSuccess),
                hasSingleOption(ContactVetMessageType.email),
                hasSingleOption(ContactVetMessageType.chat),
                isNot(hasSingleOption(ContactVetMessageType.phoneCall)),
                hasSingleOption(ContactVetMessageType.noThanks),
              )
            ]));
        contactVetBloc.add(startedEvent);
      });
    });

    group('with phone enabled', () {
      setUp(() {
        when(configuration.telehealthEmailEnabled).thenReturn(false);
        when(configuration.telehealthPhoneCallEnabled).thenReturn(true);
      });
      test('ContactVetStarted shows the contact options', () {
        expectLater(
            contactVetBloc,
            emitsInOrder([
              hasStatus(ContactVetStatus.initial),
              hasStatus(ContactVetStatus.presentChoiceInProgress),
              allOf(
                hasStatus(ContactVetStatus.presentChoiceSuccess),
                isNot(hasSingleOption(ContactVetMessageType.email)),
                hasSingleOption(ContactVetMessageType.phoneCall),
                hasSingleOption(ContactVetMessageType.noThanks),
              )
            ]));
        contactVetBloc.add(startedEvent);
      });
    });
    group('with all enabled', () {
      setUp(() {
        when(configuration.telehealthEmailEnabled).thenReturn(true);
        when(configuration.telehealthPhoneCallEnabled).thenReturn(true);
      });
      test('ContactVetStarted shows the contact options', () {
        expectLater(
            contactVetBloc,
            emitsInOrder([
              hasStatus(ContactVetStatus.initial),
              hasStatus(ContactVetStatus.presentChoiceInProgress),
              allOf(
                hasStatus(ContactVetStatus.presentChoiceSuccess),
                hasSingleOption(ContactVetMessageType.email),
                hasSingleOption(ContactVetMessageType.phoneCall),
                hasSingleOption(ContactVetMessageType.noThanks),
              )
            ]));
        contactVetBloc.add(startedEvent);
      });
    });
  });

  group('Initialized ContactVetBloc', () {
    setUp(() async {
      final startEvent = ContactVetStarted((b) => b
        ..user = user
        ..type = Flow.virtualVet
        ..symptoms = []
        ..pet = pet);
      contactVetBloc.add(startEvent);
    });

    group('Phone Consultation', () {
      final phoneOptionPressed = ContactVetPhoneCallOptionPressed();
      group('ContactVetPhoneCallOptionPressed', () {
        test('sets phone as channelType', () {
          expectLater(
              contactVetBloc,
              emitsThrough(allOf(
                hasStatus(ContactVetStatus.channelChoiceSuccess),
                hasChannelType(ChannelType.phone),
              )));
          contactVetBloc.add(phoneOptionPressed);
        });

        group('With phone defined on pet parent', () {
          setUp(() {
            user.phoneNumber = '+3412345678';
            contactVetBloc.add(ContactVetStarted((b) => b
              ..user = user
              ..type = Flow.virtualVet
              ..symptoms = []
              ..pet = pet));
          });
          test('asks to check the phone defined', () async {
            scheduleMicrotask(() {
              contactVetBloc.add(phoneOptionPressed);
            });
            final expectations = [
              allOf(
                hasStatus(ContactVetStatus.verifyPhoneInProgress),
                botMessageMatcher(ContactVetMessageType.checkPhoneNumber),
              ),
              hasViewModel<YesNoViewModel>(),
            ];
            await expectLater(contactVetBloc, emitsThrough(expectations.first));
            await expectLater(contactVetBloc, emitsInOrder(expectations));
          });
        });

        group('Without phone defined on pet parent', () {
          setUp(() {
            when(user.fullPhoneNumber).thenReturn(' ');
          });

          test('warns no phone is defined', () {
            expectLater(
              contactVetBloc,
              emitsThrough(
                allOf(
                  hasStatus(ContactVetStatus.verifyPhoneInProgress),
                  botMessageMatcher(ContactVetMessageType.emptyPhoneNumber),
                ),
              ),
            );
            contactVetBloc.add(phoneOptionPressed);
          });

          test('asks for a phone number', () {
            expectLater(
              contactVetBloc,
              emitsThrough(allOf(
                hasStatus(ContactVetStatus.askPhoneInProgress),
                hasViewModel<PhoneNumberInputChatViewModel>(),
              )),
            );
            contactVetBloc.add(phoneOptionPressed);
          });
        });
      });
      group('ContactVetCheckPhoneNumberPressed', () {
        test('isPhoneNumberCorrect -> true returns calendlyUrl', () async {
          final event = ContactVetCheckPhoneNumberPressed((b) => b..isPhoneNumberCorrect = true);
          scheduleMicrotask(() {
            contactVetBloc.add(event);
          });
          final expectations = [
            allOf(
              hasStatus(ContactVetStatus.verifyPhoneSuccess),
              ownMessageTypeMatcher(ContactVetMessageType.yes),
            ),
            botMessageMatcher(ContactVetMessageType.letsConnectVideoOrPhone),
            botMessageMatcher(ContactVetMessageType.letsConnectVideoOrPhoneInformation),
            allOf(
              hasStatus(ContactVetStatus.schedulePhoneInProgress),
              hasViewModel<ButtonsInputChatViewModel>(),
            )
          ];
          await expectLater(contactVetBloc, emitsThrough(expectations.first));
          await expectLater(contactVetBloc, emitsInOrder(expectations));
        });

        test('isPhoneNumberCorrect -> false asks for phone number', () async {
          final event = ContactVetCheckPhoneNumberPressed((b) => b..isPhoneNumberCorrect = false);
          scheduleMicrotask(() {
            contactVetBloc.add(event);
          });
          final expectations = [
            allOf(
              ownMessageTypeMatcher(ContactVetMessageType.no),
              hasStatus(ContactVetStatus.verifyPhoneFailure),
            ),
            botMessageMatcher(ContactVetMessageType.changePhoneNumber),
            allOf(
              hasStatus(ContactVetStatus.askPhoneInProgress),
              hasViewModel<PhoneNumberInputChatViewModel>(),
            )
          ];
          await expectLater(contactVetBloc, emitsThrough(expectations.first));
          await expectLater(contactVetBloc, emitsInOrder(expectations));
        });
      });

      group('ContactVetAddPhoneNumberPressed', () {
        setUp(() {
          when(user.fullPhoneNumber).thenReturn('+34 124395');
        });
        final event = ContactVetAddPhoneNumberPressed((b) => b..phoneNumber = '+1 2345678');
        final expectations = [
          hasStatus(ContactVetStatus.askPhoneSuccess),
          allOf(
            hasStatus(ContactVetStatus.schedulePhoneInProgress),
            botMessageMatcher(ContactVetMessageType.letsConnectVideoOrPhone),
          ),
          botMessageMatcher(ContactVetMessageType.letsConnectVideoOrPhoneInformation),
          allOf(
            hasStatus(ContactVetStatus.schedulePhoneInProgress),
            hasViewModel<ButtonsInputChatViewModel>(),
          )
        ];
        group('with no phone number defined on pet parent profile', () {
          setUp(() {
            when(user.fullPhoneNumber).thenReturn(' ');
            when(_updateUserUseCase.update(any)).thenAnswer((_) => Future.value(user));
          });
          test('updates the user profile', () async {
            scheduleMicrotask(() {
              contactVetBloc.add(event);
            });

            await expectLater(contactVetBloc, emitsThrough(expectations.first));
            verify(_updateUserUseCase.update(any));
          });

          test('continues the process when user update has failed', () async {
            final exception = Exception('boom');
            when(_updateUserUseCase.update(any)).thenThrow(exception);
            scheduleMicrotask(() {
              contactVetBloc.add(event);
            });

            await expectLater(contactVetBloc, emitsThrough(expectations.first));
            await expectLater(contactVetBloc, emitsInOrder(expectations));
            verify(monitoringService.capture(
                event: exception, severityLevel: SeverityLevel.ERROR, stackTrace: anyNamed('stackTrace')));
          });
        });

        group('with a phone number defined on pet parent profile', () {
          setUp(() {
            when(user.fullPhoneNumber).thenReturn('+34 124395');
          });

          test('does not update user profile', () async {
            scheduleMicrotask(() {
              contactVetBloc.add(event);
            });

            await expectLater(contactVetBloc, emitsThrough(expectations.last));
            verifyNever(_updateUserUseCase.update(any));
          });
        });

        test('returns calendlyUrl', () async {
          scheduleMicrotask(() {
            contactVetBloc.add(event);
          });

          await expectLater(contactVetBloc, emitsThrough(expectations.first));
          await expectLater(contactVetBloc, emitsInOrder(expectations));
        });
      });

      test('ContactVetPhoneAppointmentScheduled closes the bloc', () async {
        final event = ContactVetPhoneAppointmentScheduled();
        scheduleMicrotask(() {
          contactVetBloc.add(event);
        });

        final expectations = [
          allOf(
            ownMessageTypeMatcher(ContactVetMessageType.ok),
            hasStatus(ContactVetStatus.schedulePhoneSuccess),
          ),
          emitsDone
        ];
        await expectLater(contactVetBloc, emitsThrough(expectations.first));
        await expectLater(contactVetBloc, emitsInOrder(expectations));
      });
    });

    group('Email Consultation', () {
      final emailOptionPressed = ContactVetEmailOptionPressed();
      test('ContactVetEmaillOptionPressed sets email as channelType', () async {
        scheduleMicrotask(() {
          contactVetBloc.add(emailOptionPressed);
        });

        final expectations = [
          allOf(
            hasStatus(ContactVetStatus.channelChoiceSuccess),
            hasChannelType(ChannelType.email),
            ownMessageTypeMatcher(ContactVetMessageType.email),
          ),
          botMessageMatcher(ContactVetMessageType.letsConnectEmail),
          allOf(hasViewModel<ButtonsInputChatViewModel>())
        ];
        await expectLater(contactVetBloc, emitsThrough(expectations.first));
        await expectLater(contactVetBloc, emitsInOrder(expectations));
      });

      test('ContactVetEmailRedirectionPressed closes the bloc', () async {
        final emailRedirectionPressed = ContactVetEmailRedirectionPressed();

        scheduleMicrotask(() {
          contactVetBloc.add(emailOptionPressed);
          contactVetBloc.add(emailRedirectionPressed);
        });
        final expectations = [
          allOf(
            hasStatus(ContactVetStatus.channelChoiceSuccess),
            hasChannelType(ChannelType.email),
            ownMessageTypeMatcher(ContactVetMessageType.email),
          ),
          botMessageMatcher(ContactVetMessageType.letsConnectEmail),
          hasViewModel<ButtonsInputChatViewModel>(),
          hasStatus(ContactVetStatus.emailRedirectionSuccess),
          emitsDone,
        ];
        await expectLater(contactVetBloc, emitsThrough(expectations.first));
        await expectLater(contactVetBloc, emitsInOrder(expectations));
      });
    });
  });

  test('ContactVetNoThanks closes the bloc', () {
    expectLater(contactVetBloc, emitsThrough(emitsDone));
    contactVetBloc.add(ContactVetNoThanksPressed());
  });
}
