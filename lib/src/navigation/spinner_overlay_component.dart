import 'package:angular/angular.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';

@Component(
  selector: 'spinner-overlay',
  template: '''
    <spinner></spinner>
  ''',
  styleUrls: ['spinner_overlay_component.css'],
  directives: [SpinnerComponent],
)
class SpinnerOverlayComponent {}
