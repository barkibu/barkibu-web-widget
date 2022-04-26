import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/messages.dart';

import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/auth_guard.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/profile/snackbar_component.dart';
import 'package:web_widget/src/sign_up/sign_up_form.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/profile/profile_form_model.dart';

ProfileBloc profileBlocFactory(AuthBloc authBloc) => ServiceLocator.container<ProfileBloc>(param1: authBloc);

@Component(selector: 'profile-edit', templateUrl: 'profile_edit_component.html', styleUrls: [
  'profile_edit_component.css'
], directives: [
  coreDirectives,
  formDirectives,
  GoBackComponent,
  SpinnerOverlayComponent,
  WidgetButtonComponent,
  SnackbarComponent,
  layoutDirectives
], providers: [
  ClassProvider(SignUpForm),
  FactoryProvider(ProfileBloc, profileBlocFactory)
], exports: [
  RoutePaths
])
class ProfileEditComponent extends AuthGuard implements OnActivate, OnDestroy {
  final MessagesModel messages;
  final ProfileBloc profileBloc;
  ControlGroup profileForm;
  ProfileFormModel model;
  String stateErrorMessage;

  @override
  Router router;

  ProfileEditComponent(
    this.profileBloc,
    this.messages,
    this.router,
    SignUpForm formBuilder,
    AuthBloc authBloc,
  ) : super(authBloc, router) {
    profileForm = formBuilder.buildProfileFormControl();
  }

  void profileBlocHandler(ProfileState state) async {
    stateErrorMessage = null;
    if (state is ProfileLoaded) {
      model = ProfileFormModel(state.profile.user);
    } else if (state is ProfileUpdated) {
      await router.navigate(RoutePaths.profileHome.toUrl());
    } else if (state is UserUpdateFailed) {
      stateErrorMessage = state.error;
    }
  }

  void onSubmit() {
    if (profileForm.valid) {
      profileBloc.add(UserUpdateRequested((b) => b..user = model.user));
    }
  }

  @override
  void onActivate(RouterState current, RouterState prev) {
    profileBloc.listen(profileBlocHandler);
    profileBloc.add(ProfileRequested());
  }

  @override
  void ngOnDestroy() {
    profileBloc.close();
  }

  bool isProfileLoaded() {
    return model != null;
  }

  String get errorMessage => stateErrorMessage?.capitalize();
}
