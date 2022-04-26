import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/domain/auth/get_user_use_case.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  GetUserUseCase getUserUseCase;
  AuthRepository authRepository;
  // ignore: missing_required_param
  final user = User(email: 'user@example.com');

  setUp(() {
    authRepository = MockAuthRepository();
    getUserUseCase = GetUserUseCaseImpl(authRepository);
  });

  group('when user is not signed it', () {
    setUp(() {
      when(authRepository.isSignedIn()).thenAnswer((_) => Future.value(false));
    });

    test('it returns null', () async {
      expect(await getUserUseCase.getUser(), isNull);
    });
  });

  group('when user is signed in', () {
    setUp(() {
      when(authRepository.isSignedIn()).thenAnswer((_) => Future.value(true));
      when(authRepository.getUser()).thenAnswer((_) => Future.value(user));
    });

    test('it returns user', () async {
      expect(await getUserUseCase.getUser(), user);
    });
  });

  group('when token is invalid', () {
    setUp(() {
      when(authRepository.isSignedIn()).thenAnswer((_) => Future.value(true));
      when(authRepository.getUser()).thenAnswer((_) => Future.value(null));
    });

    test('it returns user and makes a call to signOut', () async {
      expect(await getUserUseCase.getUser(), isNull);
      verify(authRepository.signOut());
    });
  });
}
