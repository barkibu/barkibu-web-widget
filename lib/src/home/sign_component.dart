import 'package:angular/angular.dart';
import 'package:angular/security.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/routes.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
  selector: 'sign',
  templateUrl: 'sign_component.html',
  styleUrls: ['sign_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
    SafeInnerHtmlDirective,
    WidgetButtonComponent,
    SpinnerOverlayComponent,
    IconComponent,
    layoutDirectives,
  ],
  exports: [RoutePaths],
)
class SignComponent {
  final WidgetConfiguration _configuration;
  final DomSanitizationService domSanitizationService;

  MessagesModel messages;
  String question;
  Router router;

  SignComponent(
    this.messages,
    this.router,
    this._configuration,
    this.domSanitizationService,
  );

  String get appName => _configuration.appName;
  String get brandName => _configuration.brandName;
}
