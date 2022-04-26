import 'package:angular/angular.dart';

@Component(
  selector: 'info-icon',
  templateUrl: 'info_icon.html',
  styleUrls: ['info_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class InfoIcon {
  @Input()
  String title;

  @Input()
  bool secondary = false;
}
