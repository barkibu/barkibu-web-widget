import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/domain/auth/sign_up_use_case.dart';
import 'package:common_barkibu_dart/repositories/user/user_repository.dart';
import 'package:common_barkibu_dart/repositories/auth/auth_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  SignUpUseCase signupUseCase;
  UserRepository userRepository;
  AuthRepository authRepository;
  // ignore: missing_required_param
  var createdUser = User(email: 'user@example.com');
  var params = SignUpParams(
      email: 'user@example.com',
      firstName: 'John',
      lastName: 'Doe',
      phoneNumberPrefix: '+37',
      phoneNumber: '123123',
      password: 'Password');

  setUp(() {
    userRepository = MockUserRepository();
    authRepository = MockAuthRepository();
    signupUseCase = SignUpUseCaseImpl(userRepository, authRepository);
    when(userRepository.create(any, any)).thenAnswer((_) => Future.value(createdUser));
  });

  test('signUp makes a request to repository objects', () async {
    await signupUseCase.signUp(params);
    await untilCalled(userRepository.create(argThat(isA<User>()), 'Password'));
    await untilCalled(authRepository.signIn('user@example.com', 'Password'));
  });
}
