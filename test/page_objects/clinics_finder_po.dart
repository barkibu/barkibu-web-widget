import 'package:pageloader/html.dart';

import 'clinic_card_po.dart';
part 'clinics_finder_po.g.dart';

@PageObject()
@CheckTag('clinics_finder')
abstract class ClinicsFinderPO {
  ClinicsFinderPO();
  factory ClinicsFinderPO.create(PageLoaderElement context) = $ClinicsFinderPO.create;

  @ByCss('start-assessment-form-input-wrapper button')
  PageLoaderElement get _sendAddressButton;

  @ByTagName('li')
  List<ClinicCardPO> get _clinicCards;

  @ByTagName('input')
  PageLoaderElement get _addressInput;

  ClinicCardPO findClinicCard(String clinicName) {
    return _clinicCards.firstWhere((card) => card.hasName(clinicName));
  }

  void sendAddress() {
    _sendAddressButton.click();
  }

  bool hasCards() {
    return _clinicCards.isNotEmpty;
  }

  Future<void> fillInAddress(value) async {
    await _addressInput.type(value);
  }

  bool get isAddressPresent => _addressInput.exists;
}
