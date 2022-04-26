import 'package:angular/angular.dart';

import 'package:web_widget/src/icons/food_icon.dart';
import 'package:web_widget/src/icons/find_clinic_icon.dart';
import 'package:web_widget/src/icons/my_pets_icon.dart';
import 'package:web_widget/src/icons/profile_icon.dart';
import 'package:web_widget/src/icons/vet_icon.dart';
import 'package:web_widget/src/icons/history_icon.dart';
import 'package:web_widget/src/icons/arrow_right_icon.dart';
import 'package:web_widget/src/icons/assistant_icon.dart';
import 'package:web_widget/src/icons/med_square_icon.dart';
import 'package:web_widget/src/icons/export_icon.dart';
import 'package:web_widget/src/icons/info_icon.dart';
import 'package:web_widget/src/icons/empty_pets_icon.dart';
import 'package:web_widget/src/icons/check_round_icon.dart';
import 'package:web_widget/src/icons/star_icon.dart';

import 'close_dropdown_arrow_icon.dart';
import 'dropdown_arrow_icon.dart';

@Component(
    selector: 'widget-icon',
    templateUrl: 'icon_component.html',
    styleUrls: ['icon_component.css'],
    changeDetection: ChangeDetectionStrategy.OnPush,
    directives: [
      coreDirectives,
      MyPetsIcon,
      ProfileIcon,
      VetIcon,
      FoodIcon,
      FindClinicIcon,
      ArrowRightIcon,
      AssistantIcon,
      MedSquareIcon,
      ExportIcon,
      InfoIcon,
      EmptyPetsIcon,
      HistoryIcon,
      CheckRoundIcon,
      StarIcon,
      DropdownArrowIcon,
      CloseDropdownArrowIcon
    ])
class IconComponent {
  @Input()
  String iconType;

  @Input()
  String title = '';

  IconComponent();

  bool isIconType(String type) {
    return type == iconType;
  }
}
