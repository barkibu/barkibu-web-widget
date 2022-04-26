import 'package:angular/angular.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/current_theme.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';

@Component(
    selector: 'widget-logo',
    templateUrl: 'logo_component.html',
    styleUrls: ['logo_component.css'],
    changeDetection: ChangeDetectionStrategy.OnPush,
    directives: [
      coreDirectives,
    ])
class LogoComponent extends CurrentTheme {
  final MessagesModel messages;
  WidgetConfiguration config;

  LogoComponent(this.messages, this.config) : super(config);

  String get altText => config.appName;

  String get logo => 'assets/images/${config.brandLogo}';

  Map<String, String> get logoWidth => {'max-width': config.brandLogoWidth};

  bool get hasLogo => config.brandLogo != null && config.brandLogo.isNotEmpty;
}
