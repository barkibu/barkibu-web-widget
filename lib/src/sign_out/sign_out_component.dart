import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/bloc/bloc.dart';
import 'package:web_widget/src/route_paths.dart';

@Component(selector: 'sign-out', template: '', directives: [coreDirectives])
class SignOutComponent implements OnInit {
  final AuthBloc authBloc;
  final Router router;

  SignOutComponent(this.authBloc, this.router);

  @override
  void ngOnInit() {
    authBloc.add(SignedOut());
    router.navigate(RoutePaths.home.toUrl());
  }
}
