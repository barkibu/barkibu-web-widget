import 'package:angular/angular.dart';

@Component(
  selector: 'snackbar',
  templateUrl: 'snackbar_component.html',
  styleUrls: ['snackbar_component.css'],
  directives: [coreDirectives],
)
class SnackbarComponent {
  void closeAlert() => message = null;

  @Input()
  String message;

  @Input()
  String type = 'snackbar-alert';

  bool get isMessageEmpty => message == null;

  String cssClass() => '${type}';
}
