import 'package:angular/angular.dart';

@Component(
  selector: 'dropdown-arrow-icon',
  templateUrl: 'dropdown_arrow_icon.html',
  styleUrls: ['dropdown_arrow_icon.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class DropdownArrowIcon {
  @Input()
  String title;
}
