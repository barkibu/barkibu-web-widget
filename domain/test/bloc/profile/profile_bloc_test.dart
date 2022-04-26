import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/domain/account_profile/get_profile_use_case.dart';
import 'package:common_barkibu_dart/domain/account_profile/update_user_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

class MockGetProfileUseCase extends Mock implements GetProfileUseCase {}

class MockUpdateUserUseCase extends Mock implements UpdateUserUseCase {}

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  GetProfileUseCase getProfileUseCase;
  UpdateUserUseCase updateUserUseCase;
  AnalyticsService analyticsService;
  AuthBloc authBloc;
  ProfileBloc profileBloc;
  final pets = <Pet>[];
  // ignore: missing_required_param
  final user = User();
  final isProfileLoaded =
      predicate((state) => state is ProfileLoaded && state.profile.user == user && state.profile.pets == pets);

  setUp(() {
    getProfileUseCase = MockGetProfileUseCase();
    updateUserUseCase = MockUpdateUserUseCase();
    analyticsService = MockAnalyticsService();
    authBloc = MockAuthBloc();
    profileBloc = ProfileBloc(getProfileUseCase, updateUserUseCase, analyticsService, authBloc);
  });

  setUp(() {
    when(authBloc.finalAuthState()).thenAnswer((_) => Future.value(Authenticated((b) => b..user = user)));
    when(getProfileUseCase.getPets()).thenAnswer((_) => Future.value(pets));
  });

  tearDown(() {
    profileBloc?.close();
  });

  group('ProfileBloc', () {
    test('initial state is correct', () {
      expect(profileBloc.initialState, ProfileUninitialized());
    });

    group('ProfileRequested event', () {
      group('when AuthBloc yields Authenticated event', () {
        test('it yields ProfileLoaded state', () {
          expectLater(
            profileBloc,
            emitsInOrder([ProfileUninitialized(), ProfileLoading(), isProfileLoaded]),
          );
          profileBloc.add(ProfileRequested());
        });
      });

      group('when AuthBloc yields Unauthenticated event', () {
        setUp(() {
          when(authBloc.finalAuthState()).thenAnswer((_) => Future.value(Unauthenticated()));
        });

        test('it yields ProfileLoadingFailed state', () {
          expectLater(
            profileBloc,
            emitsInOrder([ProfileUninitialized(), ProfileLoading(), ProfileLoadingFailed()]),
          );
          profileBloc.add(ProfileRequested());
        });
      });

      group('when getPets raises an error', () {
        final error = 'error message';

        setUp(() {
          when(getProfileUseCase.getPets()).thenAnswer((_) => throw Exception(error));
        });

        test('it yields ProfileLoadingFailed state', () {
          expectLater(
            profileBloc,
            emitsInOrder([
              ProfileUninitialized(),
              ProfileLoading(),
              ProfileLoadingFailed((b) => b..error = 'Exception: $error')
            ]),
          );
          profileBloc.add(ProfileRequested());
        });
      });
    });

    group('UserUpdateRequested event', () {
      setUp(() async {
        profileBloc.add(ProfileRequested());
        await expectLater(profileBloc, emitsThrough(isProfileLoaded));
      });

      group('when updateUserUseCase returns updatedUser', () {
        final updatedUser = user;

        setUp(() {
          when(updateUserUseCase.update(user)).thenAnswer((_) => Future.value(updatedUser));
        });

        test('it yields ProfileUpdated state', () {
          expectLater(
            profileBloc,
            emitsInOrder([isProfileLoaded, UserUpdating(), ProfileUpdated()]),
          );
          profileBloc.add(UserUpdateRequested((b) => b.user = user));
        });
      });

      group('when updateUserUseCase returns null', () {
        setUp(() {
          when(updateUserUseCase.update(user)).thenAnswer((_) => Future.value(null));
        });

        test('it yields UserUpdateFailed state', () {
          expectLater(
            profileBloc,
            emitsInOrder([isProfileLoaded, UserUpdating(), UserUpdateFailed()]),
          );
          profileBloc.add(UserUpdateRequested((b) => b.user = user));
        });
      });

      group('when updateUserUseCase raises an error', () {
        final error = 'error message';

        setUp(() {
          when(updateUserUseCase.update(user)).thenAnswer((_) => throw Exception(error));
        });

        test('it yields UserUpdateFailed state', () {
          expectLater(
            profileBloc,
            emitsInOrder([isProfileLoaded, UserUpdating(), UserUpdateFailed((b) => b.error = 'Exception: $error')]),
          );
          profileBloc.add(UserUpdateRequested((b) => b.user = user));
        });
      });
    });
  });
}
