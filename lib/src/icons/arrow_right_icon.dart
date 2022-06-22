import 'package:angular/angular.dart';

@Component(
  selector: 'arrow-right-icon',
  templateUrl: 'arrow_right_icon.html',
  styleUrls: ['arrow_right_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ArrowRightIcon  {
  @Input()
  String title;
}
