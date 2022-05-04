import 'package:angular/angular.dart';

import 'package:web_widget/src/icons/food_icon.dart';
import 'package:web_widget/src/icons/find_clinic_icon.dart';
import 'package:web_widget/src/icons/my_pets_icon.dart';
import 'package:web_widget/src/icons/profile_icon.dart';
import 'package:web_widget/src/icons/vet_icon.dart';
import 'package:web_widget/src/icons/vetinsight_bot_icon.dart';

import 'package:web_widget/src/icons/food_icon_iams.dart';
import 'package:web_widget/src/icons/find_clinic_icon_iams.dart';
import 'package:web_widget/src/icons/my_pets_icon_iams.dart';
import 'package:web_widget/src/icons/profile_icon_iams.dart';
import 'package:web_widget/src/icons/vet_icon_iams.dart';
import 'package:web_widget/src/icons/vetinsight_bot_icon_iams.dart';

import 'package:web_widget/src/icons/history_icon.dart';
import 'package:web_widget/src/icons/arrow_right_icon.dart';
import 'package:web_widget/src/icons/assistant_icon.dart';
import 'package:web_widget/src/icons/med_square_icon.dart';
import 'package:web_widget/src/icons/export_icon.dart';
import 'package:web_widget/src/icons/info_icon.dart';
import 'package:web_widget/src/icons/empty_pets_icon.dart';
import 'package:web_widget/src/icons/thewildest_bot_icon.dart';
import 'package:web_widget/src/icons/check_round_icon.dart';
import 'package:web_widget/src/icons/star_icon.dart';
import 'package:web_widget/src/widget_configuration.dart';

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
      VetinsightBotIcon,
      MyPetsIconIams,
      ProfileIconIams,
      VetIconIams,
      FoodIconIams,
      FindClinicIconIams,
      VetinsightBotIconIams,
      ArrowRightIcon,
      AssistantIcon,
      MedSquareIcon,
      ExportIcon,
      InfoIcon,
      EmptyPetsIcon,
      HistoryIcon,
      TheWildestBotIcon,
      CheckRoundIcon,
      StarIcon,
      DropdownArrowIcon,
      CloseDropdownArrowIcon
    ])
class IconComponent {
  final WidgetConfiguration _config;

  @Input()
  String iconType;

  @Input()
  String title = '';

  IconComponent(this._config);

  String get iconsTheme => _config.iconsTheme;

  bool isIconType(String type) {
    return type == iconType;
  }

  bool isIconTheme(String theme) {
    return theme == iconsTheme;
  }
}
