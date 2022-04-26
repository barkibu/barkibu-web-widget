import 'package:angular/angular.dart';

@Component(
  selector: 'my-pets-icon',
  templateUrl: 'my_pets_icon.html',
  styleUrls: ['my_pets_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class MyPetsIcon {
  @Input()
  String title;
}
