import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';

@Component(
    selector: 'widget-button',
    templateUrl: 'widget_button_component.html',
    styleUrls: ['widget_button_component.css'],
    directives: [coreDirectives, routerDirectives, SpinnerComponent])
class WidgetButtonComponent {
  @Input()
  String type = 'primary';

  @Input()
  String size = 'regular';

  @Input()
  String text;

  @Input()
  bool link = false;

  @Input()
  bool disabled = false;

  @Input()
  bool button = false;

  @Input()
  bool loading = false;

  @Input()
  bool externalLink = false;

  @Input()
  String linkHref;

  @Input()
  String buttonType = 'button';

  String cssClass() {
    return '${type} ${size}';
  }
}
