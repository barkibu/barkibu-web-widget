import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/route_paths.dart';

@Component(
    selector: 'terms-of-service',
    templateUrl: 'terms_of_service_component.html',
    styleUrls: ['terms_of_service_component.css'],
    directives: [coreDirectives, layoutDirectives, routerDirectives, GoBackComponent],
    exports: [RoutePaths])
class TermsOfServiceComponent {
  final MessagesModel messages;

  TermsOfServiceComponent(this.messages);
}
