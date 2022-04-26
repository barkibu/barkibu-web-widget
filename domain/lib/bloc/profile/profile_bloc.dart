import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/profile/profile_event.dart';
import 'package:common_barkibu_dart/bloc/profile/profile_state.dart';
import 'package:common_barkibu_dart/bloc/auth/authentication/auth_bloc.dart';
import 'package:common_barkibu_dart/models/profile.dart';
import 'package:common_barkibu_dart/domain/account_profile/get_profile_use_case.dart';
import 'package:common_barkibu_dart/domain/account_profile/update_user_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';

export 'profile_event.dart';
export 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final AnalyticsService _analyticsService;
  final AuthBloc _authBloc;

  Profile _currentProfile;

  ProfileBloc(this._getProfileUseCase, this._updateUserUseCase, this._analyticsService, this._authBloc);

  @override
  ProfileState get initialState => ProfileUninitialized();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileRequested) {
      try {
        yield ProfileLoading();
        if (_currentProfile != null) {
          yield ProfileLoaded((b) => b..profile = _currentProfile);
        } else {
          yield await _fetchProfile();
        }
        _analyticsService.event.myAccount.logMyAccountView();
      } catch (error) {
        yield ProfileLoadingFailed((b) => b..error = error.toString());
      }
    }

    if (event is UserUpdateRequested) {
      yield UserUpdating();
      try {
        var updatedUser = await _updateUserUseCase.update(event.user);
        if (updatedUser != null) {
          _currentProfile = Profile(updatedUser, _currentProfile.pets);
          _authBloc.add(UserUpdated((b) => b.user = updatedUser));
          _analyticsService.event.myAccount.logMyAccountEdit();
          yield ProfileUpdated();
        } else {
          yield UserUpdateFailed();
        }
      } catch (error) {
        yield UserUpdateFailed((b) => b..error = error.toString());
      }
    }
  }

  Future<ProfileState> _fetchProfile() async {
    var authState = await _authBloc.finalAuthState();
    if (authState is Authenticated) {
      var pets = await _getProfileUseCase.getPets();
      _currentProfile = await Profile(authState.user, pets);
      return ProfileLoaded((b) => b..profile = _currentProfile);
    } else {
      return ProfileLoadingFailed();
    }
  }
}
