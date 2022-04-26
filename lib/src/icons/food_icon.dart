import 'package:angular/angular.dart';

@Component(
  selector: 'food-icon',
  templateUrl: 'food_icon.html',
  styleUrls: ['food_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class FoodIcon {
  @Input()
  String title;
}
