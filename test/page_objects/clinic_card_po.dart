import 'package:pageloader/html.dart';
part 'clinic_card_po.g.dart';

@PageObject()
@CheckTag('clinic-card')
abstract class ClinicCardPO {
  ClinicCardPO();
  factory ClinicCardPO.create(PageLoaderElement context) = $ClinicCardPO.create;

  @ByClass('clinic-name-title')
  PageLoaderElement get _name;

  @ByCss('clinic-main-info')
  PageLoaderElement get _address;

  @ByClass('clinic-hours-info')
  PageLoaderElement get _hoursList;

  bool hasName(String clinicName) {
    return _name.innerText.contains(clinicName);
  }

  bool hasAddress(String clinicAddress) {
    return _address.innerText.contains(clinicAddress);
  }

  bool hasHoursDisplayed() {
    return _hoursList.exists;
  }
}
