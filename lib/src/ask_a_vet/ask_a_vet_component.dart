import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/navigation/auth_guard.dart';
import 'package:web_widget/src/ask_a_vet/chat_with_vet_component.dart';
import 'package:web_widget/src/route_paths.dart';

@Component(selector: 'ask-a-vet', templateUrl: 'ask_a_vet_component.html', directives: [
  NgIf,
  ChatWithVetComponent,
], providers: [
  ClassProvider(InfoBloc)
])
class AskAVetComponent extends AuthGuard implements OnActivate {
  final Router _router;
  String consultationId;
  bool reconnect = false;
  bool isComponentActivated = false;

  AskAVetComponent(AuthBloc authBloc, this._router) : super(authBloc, _router);

  @override
  void onActivate(_, RouterState current) {
    consultationId = current.queryParameters['id'];
    reconnect = current.queryParameters['reconnect'] != null;
    isComponentActivated = true;
  }

  void navigateHome() => _router.navigate(RoutePaths.home.toUrl());
}
