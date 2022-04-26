import 'package:angular/angular.dart';

@Component(
    selector: 'widget-body',
    templateUrl: 'body_component.html',
    styleUrls: ['body_component.css'],
    directives: [coreDirectives])
class BodyComponent {
  BodyComponent();

  @HostBinding('class.no-bottom-spacing')
  bool get cssClassFlag => noBottomSpacing;

  @HostBinding('class.white-bg')
  bool get whiteBgFlag => whiteBackground;

  @Input()
  bool noBottomSpacing = false;

  @Input()
  bool whiteBackground = false;
}
