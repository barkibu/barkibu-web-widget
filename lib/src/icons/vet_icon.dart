import 'package:angular/angular.dart';

@Component(
  selector: 'vet-icon',
  templateUrl: 'vet_icon.html',
  styleUrls: ['vet_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class VetIcon {
  @Input()
  String title;
}
