import 'package:angular/angular.dart';

@Component(
    selector: 'alert',
    templateUrl: 'alert_component.html',
    styleUrls: ['alert_component.css'],
    directives: [coreDirectives])
class AlertComponent {
  AlertComponent();

  @Input()
  String type = 'danger';

  String get cssClass => 'alert-$type';
}
