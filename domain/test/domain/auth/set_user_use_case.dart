import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/domain/auth/set_user_use_case.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  SetUserUseCase setUserUseCase;
  AuthRepository authRepository;
  // ignore: missing_required_param
  final user = User(email: 'user@example.com');
  const token = 'jwt_token';

  setUp(() {
    authRepository = MockAuthRepository();
    setUserUseCase = SetUserUseCaseImpl(authRepository);
  });

  test('makes a call to set access token', () {
    setUserUseCase.setUser(token);
    verify(authRepository.setAccessToken(token));
  });

  test('returns a user', () async {
    when(authRepository.getUser()).thenAnswer((_) => Future.value(user));
    expect(await setUserUseCase.setUser(token), user);
  });

  test('makes a sign out call when token is invalid', () async {
    when(authRepository.getUser()).thenAnswer((_) => Future.value(null));
    expect(await setUserUseCase.setUser(token), isNull);
    verify(authRepository.signOut());
  });
}
