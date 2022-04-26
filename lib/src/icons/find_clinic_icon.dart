import 'package:angular/angular.dart';

@Component(
  selector: 'find-clinic-icon',
  templateUrl: 'find_clinic_icon.html',
  styleUrls: ['find_clinic_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class FindClinicIcon {
  @Input()
  String title;
}
