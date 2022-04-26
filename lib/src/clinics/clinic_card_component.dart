import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/models/clinic.dart';
import 'package:web_widget/src/card/card_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';

@Component(selector: 'clinic-card', templateUrl: 'clinic_card_component.html', styleUrls: [
  'clinic_card_component.css'
], directives: [
  coreDirectives,
  routerDirectives,
  CardComponent,
  IconComponent,
])
class ClinicCardComponent {
  @Input()
  Clinic clinic;

  final MessagesModel messages;
  bool isContentOpened = false;

  ClinicCardComponent(this.messages);

  String get directionUrl {
    const baseUrl = 'https://www.google.com/maps/search/?api=1&query=';
    return baseUrl + clinic.name + ' ' + clinic.address;
  }

  String get phoneLink {
    if (clinic.phoneNumber != null) {
      return 'tel:' + clinic.phoneNumber;
    } else {
      return '';
    }
  }

  String get iconSrc {
    const defaultIcon = 'assets/images/icon_hospital.svg';
    var image = (clinic.brandIcon != null && clinic.brandIcon.full != null && clinic.brandIcon.full.isNotEmpty)
        ? clinic.brandIcon.full
        : defaultIcon;
    return image;
  }

  bool get clinicHoursNotEmpty {
    return clinic.hours != null && clinic.hours.isNotEmpty;
  }

  void toggleContent() {
    isContentOpened = !isContentOpened;
  }
}
