import 'package:common_barkibu_dart/bloc/auth/sign_in/sign_in.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:common_barkibu_dart/domain/auth/reset_password_use_case.dart';
import 'package:common_barkibu_dart/bloc/auth/reset_password/reset_password_bloc.dart';

import '../../mocks/mocks.dart';

class MockResetPasswordUseCase extends Mock implements ResetPasswordUseCase {}

class MockSignInBloc extends Mock implements SignInBloc {}

void main() {
  ResetPasswordUseCase resetPasswordUseCase;
  AnalyticsService analyticsService;
  SignInBloc signInBloc;
  ResetPasswordBloc resetPasswordBloc;

  setUp(() {
    resetPasswordUseCase = MockResetPasswordUseCase();
    analyticsService = MockAnalyticsService();
    signInBloc = MockSignInBloc();
    resetPasswordBloc = ResetPasswordBloc(resetPasswordUseCase, signInBloc, analyticsService);
  });

  tearDown(() {
    resetPasswordBloc?.close();
  });

  group('ResetPasswordBloc', () {
    test('initial state is correct', () {
      expect(resetPasswordBloc.initialState, isA<ResetPasswordInitial>());
    });

    group('ResetPasswordStarted event', () {
      test('it yields an updated state with email set', () {
        final email = 'fake@email.com';
        final isUpdatedWithEmailPredicate = predicate(
            (state) => (state is ResetPasswordUpdateSuccess && state.authData.email == email), 'is updated with Email');
        expectLater(
          resetPasswordBloc,
          emitsInOrder([isA<ResetPasswordInitial>(), isUpdatedWithEmailPredicate]),
        );
        resetPasswordBloc.add(ResetPasswordStarted((b) => b.email = email));
      });
    });

    group('ResetPasswordCodeSent event', () {
      group('when resetPassword.sendEmail returns true', () {
        setUp(() {
          when(resetPasswordUseCase.sendEmail(any)).thenAnswer((_) => Future.value(true));
        });
        test('it yields an code sent with success', () {
          expectLater(
            resetPasswordBloc,
            emitsInOrder([
              isA<ResetPasswordInitial>(),
              isA<ResetPasswordSendCodeInProgress>(),
              isA<ResetPasswordSendCodeSuccess>()
            ]),
          );
          resetPasswordBloc.add(ResetPasswordCodeSent());
        });
      });
      group('when resetPassword.sendEmail returns false', () {
        setUp(() {
          when(resetPasswordUseCase.sendEmail(any)).thenAnswer((_) => Future.value(false));
        });
        test('it yields an code sent with failure', () {
          expectLater(
            resetPasswordBloc,
            emitsInOrder([
              isA<ResetPasswordInitial>(),
              isA<ResetPasswordSendCodeInProgress>(),
              isA<ResetPasswordSendCodeFailure>()
            ]),
          );
          resetPasswordBloc.add(ResetPasswordCodeSent());
        });
      });
    });

    group('ResetPasswordPasswordChanged event', () {
      test('it yields an updated state with password set', () {
        final password = 'MyP@55w0rd';
        final isUpdatedWithPasswordPredicate = predicate(
            (state) => (state is ResetPasswordUpdateSuccess && state.authData.password == password),
            'is updated with Password');
        expectLater(
          resetPasswordBloc,
          emitsInOrder([isA<ResetPasswordInitial>(), isUpdatedWithPasswordPredicate]),
        );
        resetPasswordBloc.add(ResetPasswordPasswordChanged((b) => b.password = password));
      });
    });

    group('ResetPasswordPasswordRepeatChanged event', () {
      test('it yields an updated state with passwordRepeat set', () {
        final password = 'MyP@55w0rd';
        final isUpdatedWithPasswordRepeatPredicate = predicate(
            (state) => (state is ResetPasswordUpdateSuccess && state.authData.passwordRepeat == password),
            'is updated with Password');
        expectLater(
          resetPasswordBloc,
          emitsInOrder([isA<ResetPasswordInitial>(), isUpdatedWithPasswordRepeatPredicate]),
        );
        resetPasswordBloc.add(ResetPasswordPasswordRepeatChanged((b) => b.passwordRepeat = password));
      });
    });

    group('ResetPasswordCodeChanged event', () {
      test('it yields an updated state with code set', () {
        final password = 'MyP@55w0rd';
        final isUpdatedWithCodePredicate = predicate(
            (state) => (state is ResetPasswordUpdateSuccess && state.authData.code == password),
            'is updated with Password');
        expectLater(
          resetPasswordBloc,
          emitsInOrder([isA<ResetPasswordInitial>(), isUpdatedWithCodePredicate]),
        );
        resetPasswordBloc.add(ResetPasswordCodeChanged((b) => b.code = password));
      });
    });

    group('ResetPasswordSubmitted event', () {
      group('when resetPassword.resetPassword returns false', () {
        setUp(() {
          when(resetPasswordUseCase.resetPassword(any)).thenAnswer((_) => Future.value(false));
        });
        test('it yields an reset failure state', () {
          expectLater(
            resetPasswordBloc,
            emitsInOrder(
                [isA<ResetPasswordInitial>(), isA<ResetPasswordResetInProgress>(), isA<ResetPasswordResetFailure>()]),
          );
          resetPasswordBloc.add(ResetPasswordSubmitted());
        });
      });

      group('when resetPassword.resetPassword returns true', () {
        setUp(() {
          when(resetPasswordUseCase.resetPassword(any)).thenAnswer((_) => Future.value(true));
        });
        test('it yields an reset success state', () {
          expectLater(
            resetPasswordBloc,
            emitsInOrder(
                [isA<ResetPasswordInitial>(), isA<ResetPasswordResetInProgress>(), isA<ResetPasswordResetSuccess>()]),
          );
          resetPasswordBloc.add(ResetPasswordSubmitted());
        });

        test('it launch signIn use case', () async {
          resetPasswordBloc.add(ResetPasswordSubmitted());
          await untilCalled(signInBloc.add(any));
          verify(signInBloc.add(argThat(isA<SingInSignInSubmitted>()))).called(1);
        });
      });

      group('Full process', () {
        final email = 'fake@email.com';
        final password = 'MyP@ss0rd';
        final code = '123456';

        void _runFullResetPassword() {
          resetPasswordBloc.add(ResetPasswordStarted((b) => b..email = email));
          resetPasswordBloc.add(ResetPasswordCodeSent());
          resetPasswordBloc.add(ResetPasswordPasswordChanged((b) => b..password = password));
          resetPasswordBloc.add(ResetPasswordPasswordRepeatChanged((b) => b..passwordRepeat = password));
          resetPasswordBloc.add(ResetPasswordCodeChanged((b) => b..code = code));
          resetPasswordBloc.add(ResetPasswordSubmitted());
        }

        setUp(() {
          when(resetPasswordUseCase.sendEmail(any)).thenAnswer((_) => Future.value(true));
          when(resetPasswordUseCase.resetPassword(any)).thenAnswer((_) => Future.value(true));
          when(signInBloc.add(any)).thenAnswer((_) => Future.value(true));
        });

        test('it yields state in right order', () {
          expectLater(
            resetPasswordBloc,
            emitsInOrder([
              isA<ResetPasswordInitial>(),
              isA<ResetPasswordUpdateSuccess>(),
              isA<ResetPasswordSendCodeInProgress>(),
              isA<ResetPasswordSendCodeSuccess>(),
              isA<ResetPasswordUpdateSuccess>(),
              isA<ResetPasswordUpdateSuccess>(),
              isA<ResetPasswordUpdateSuccess>(),
              isA<ResetPasswordResetInProgress>(),
              isA<ResetPasswordResetSuccess>()
            ]),
          );
          _runFullResetPassword();
        });

        test('it signs in with newly updated password', () async {
          _runFullResetPassword();

          final signInEventPredicate = predicate(
              (e) => e is SingInSignInSubmitted && e.email == email && e.password == password,
              'is a SignIn submitted event with correct credentials');
          await untilCalled(signInBloc.add(any));
          verify(signInBloc.add(argThat(signInEventPredicate))).called(1);
        });
      });
    });
  });
}
