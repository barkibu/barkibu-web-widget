import 'package:angular/angular.dart';

@Component(
  selector: 'my-pets-icon-iams',
  templateUrl: 'my_pets_icon_iams.html',
  styleUrls: ['my_pets_icon_iams.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class MyPetsIconIams {
  @Input()
  String title;
}
