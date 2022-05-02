import 'package:angular/angular.dart';

@Component(
  selector: 'food-icon-iams',
  templateUrl: 'food_icon_iams.html',
  styleUrls: ['food_icon_iams.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class FoodIconIams {
  @Input()
  String title;
}
