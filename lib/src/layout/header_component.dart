import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/icons/logo_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

import 'package:web_widget/src/routes.dart';

@Component(
  selector: 'widget-header',
  templateUrl: 'header_component.html',
  styleUrls: ['header_component.css'],
  directives: [coreDirectives, LogoComponent, routerDirectives],
  exports: [RoutePaths],
)
class HeaderComponent {
  final ParentWindowService parentWindowService;
  final MessagesModel messages;
  final WidgetConfiguration _config;

  @Input()
  bool homeHeader = false;

  HeaderComponent(this.parentWindowService, this.messages, this._config);

  void closeWindow() {
    parentWindowService.notifyWidgetWindowClosed();
  }

  bool get isCloseButtonEnabled => _config.closeButtonEnabled;
  bool get isHeaderWithoutLogo => _config.headerWithoutLogo;
  bool get isGoHomeLinkEnabled => _config.goHomeLinkEnabled;
  String get chatTitle => messages.chatMessages.chatWithVet.title;
}
