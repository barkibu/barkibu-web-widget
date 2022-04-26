import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:web_widget/src/route_paths.dart';

@Component(selector: 'auth-redirect', template: '')
class AuthRedirectComponent implements OnInit, OnDestroy {
  final AuthBloc authBloc;
  final Router router;
  StreamSubscription authBlocSubscription;

  AuthRedirectComponent(this.authBloc, this.router);

  @override
  void ngOnInit() async {
    authBlocSubscription = authBloc.listen(authStateChangeHandler);
  }

  @override
  void ngOnDestroy() async {
    await authBlocSubscription.cancel();
  }

  void authStateChangeHandler(AuthState authState) {
    if (authState is Authenticated) {
      router.navigate(RoutePaths.home.toUrl());
    }
  }
}
