import 'package:angular/angular.dart';

@Component(
  selector: 'assistant-icon',
  templateUrl: 'assistant_icon.html',
  styleUrls: ['assistant_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class AssistantIcon {
  @Input()
  String title;
}
