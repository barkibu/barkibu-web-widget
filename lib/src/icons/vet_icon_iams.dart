import 'package:angular/angular.dart';

@Component(
  selector: 'vet-icon-iams',
  templateUrl: 'vet_icon_iams.html',
  styleUrls: ['vet_icon_iams.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class VetIconIams {
  @Input()
  String title;
}
