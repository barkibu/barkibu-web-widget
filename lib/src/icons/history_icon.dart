import 'package:angular/angular.dart';

@Component(
  selector: 'history-icon',
  templateUrl: 'history_icon.html',
  styleUrls: ['history_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class HistoryIcon {
  @Input()
  String title;
}
