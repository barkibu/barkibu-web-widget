import 'package:angular/angular.dart';

@Component(
  selector: 'find-clinic-icon-iams',
  templateUrl: 'find_clinic_icon_iams.html',
  styleUrls: ['find_clinic_icon_iams.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class FindClinicIconIams {
  @Input()
  String title;
}
