import 'package:angular/angular.dart';

@Component(
  selector: 'check-round-icon',
  templateUrl: 'check_round_icon.html',
  styleUrls: ['check_round_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class CheckRoundIcon {
  @Input()
  String title;

  @Input()
  bool selected = false;
}
