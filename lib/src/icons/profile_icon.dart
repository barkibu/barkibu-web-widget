import 'package:angular/angular.dart';

@Component(
  selector: 'profile-icon',
  templateUrl: 'profile_icon.html',
  styleUrls: ['profile_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ProfileIcon {
  @Input()
  String title;
}
