import 'package:angular/angular.dart';

@Component(
  selector: 'star-icon',
  templateUrl: 'star_icon.html',
  styleUrls: ['star_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class StarIcon {
  @Input()
  String title;
}
