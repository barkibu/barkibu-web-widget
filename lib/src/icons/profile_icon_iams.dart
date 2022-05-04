import 'package:angular/angular.dart';

@Component(
  selector: 'profile-icon-iams',
  templateUrl: 'profile_icon_iams.html',
  styleUrls: ['profile_icon_iams.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ProfileIconIams {
  @Input()
  String title;
}
