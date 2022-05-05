import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/home/terms_of_service/vetinsight/terms_of_service_vetinsight_component.dart';
import 'package:web_widget/src/home/terms_of_service/walmart/terms_of_service_walmart_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/route_paths.dart';

import '../widget_configuration.dart';

@Component(selector: 'terms-of-service', templateUrl: 'terms_of_service_component.html', styleUrls: [
  'terms_of_service_component.css'
], directives: [
  coreDirectives,
  layoutDirectives,
  routerDirectives,
  GoBackComponent,
  TermsOfServiceVetinsightComponent,
  TermsOfServiceWalmartComponent
], exports: [
  RoutePaths
])
class TermsOfServiceComponent {
  final MessagesModel messages;

  final WidgetConfiguration _configuration;

  TermsOfServiceComponent(this.messages, this._configuration);

  bool get isWalmartTerms => _configuration.clientId == 'walmart';
}
