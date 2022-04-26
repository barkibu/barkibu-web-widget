import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:pedantic/pedantic.dart';
import 'package:web_widget/src/route_paths.dart';

class AuthGuard implements CanActivate {
  AuthBloc authBloc;
  Router router;
  User currentUser;

  AuthGuard(this.authBloc, this.router);

  @override
  Future<bool> canActivate(RouterState current, RouterState next) async {
    await for (AuthState state in authBloc) {
      if (state is Unauthenticated) {
        unawaited(router.navigate(RoutePaths.signIn.toUrl()));
        return false;
      } else if (state is Authenticated) {
        currentUser = state.user;
        return true;
      }
    }
    return false;
  }
}
