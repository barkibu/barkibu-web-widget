import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';
import 'package:common_barkibu_dart/domain/auth/reset_password_use_case.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  ResetPasswordUseCase resetPasswordUseCase;
  AuthRepository authRepository;
  final authData = AuthData(email: 'fake@email.com', password: 'MyN3wP@550rd', passwordRepeat: 'MyN3wP@550rd');

  setUp(() {
    authRepository = MockAuthRepository();
    resetPasswordUseCase = ResetPasswordUseCaseImpl(authRepository);

    when(authRepository.sendEmail(any)).thenAnswer((_) => Future.value(true));
    when(authRepository.resetPassword(any)).thenAnswer((_) => Future.value(true));
  });

  test('.sendEmail calls AuthRepository', () async {
    await resetPasswordUseCase.sendEmail('fake@email.com');
    await untilCalled(authRepository.sendEmail('fake@email.com'));

    verify(authRepository.sendEmail('fake@email.com')).called(1);
  });

  test('.resetPassword calls AuthRepository', () async {
    await resetPasswordUseCase.resetPassword(authData);
    await untilCalled(authRepository.resetPassword(authData));

    verify(authRepository.resetPassword(authData)).called(1);
  });

  group('when sendEmail is successful', () {
    setUp(() {
      when(authRepository.sendEmail(any)).thenAnswer((_) => Future.value(true));
    });
    test('.sendEmail resolves to True', () async {
      expect(await resetPasswordUseCase.sendEmail('fake@email.com'), isTrue);
    });
  });

  group('when sendEmail is unsuccessful', () {
    setUp(() {
      when(authRepository.sendEmail(any)).thenAnswer((_) => Future.value(false));
    });
    test('.sendEmail resolves to False', () async {
      expect(await resetPasswordUseCase.sendEmail('fake@email.com'), isFalse);
    });
  });

  group('when resetPassword is successful', () {
    setUp(() {
      when(authRepository.resetPassword(any)).thenAnswer((_) => Future.value(true));
    });
    test('.resetPassword resolves to True', () async {
      expect(await resetPasswordUseCase.resetPassword(authData), isTrue);
    });
  });

  group('when resetPassword is unsuccessful', () {
    setUp(() {
      when(authRepository.resetPassword(any)).thenAnswer((_) => Future.value(false));
    });
    test('.resetPassword resolves to False', () async {
      expect(await resetPasswordUseCase.resetPassword(authData), isFalse);
    });
  });
}
