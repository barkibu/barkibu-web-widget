import 'package:angular/angular.dart';

@Component(
  selector: 'empty-pets-icon',
  templateUrl: 'empty_pets_icon.html',
  styleUrls: ['empty_pets_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class EmptyPetsIcon {
  @Input()
  String title;
}
