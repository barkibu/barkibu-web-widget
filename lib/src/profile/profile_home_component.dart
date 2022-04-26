import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/src/navigation/auth_guard.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/profile/user_card_component.dart';

ProfileBloc profileBlocFactory(AuthBloc authBloc) => ServiceLocator.container<ProfileBloc>(param1: authBloc);

@Component(selector: 'profile-home', templateUrl: 'profile_home_component.html', styleUrls: [
  'profile_home_component.css'
], directives: [
  coreDirectives,
  GoBackComponent,
  SpinnerOverlayComponent,
  WidgetButtonComponent,
  UserCardComponent,
  layoutDirectives
], providers: [], exports: [
  Routes
])
class ProfileHomeComponent extends AuthGuard {
  final MessagesModel messages;

  ProfileHomeComponent(AuthBloc authBloc, Router router, this.messages) : super(authBloc, router);
}
