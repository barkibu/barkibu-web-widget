import 'package:angular/angular.dart';

@Component(
  selector: 'close-dropdown-arrow-icon',
  templateUrl: 'close_dropdown_arrow_icon.html',
  styleUrls: ['close_dropdown_arrow_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class CloseDropdownArrowIcon {
  @Input()
  String title;
}
