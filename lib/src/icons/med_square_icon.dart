import 'package:angular/angular.dart';

@Component(
  selector: 'med-square-icon',
  templateUrl: 'med_square_icon.html',
  styleUrls: ['med_square_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class MedSquareIcon {
  @Input()
  String title;
}
