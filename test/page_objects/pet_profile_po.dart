import 'package:pageloader/html.dart';
part 'pet_profile_po.g.dart';

@PageObject()
@CheckTag('pet-profile')
abstract class PetProfilePO {
  PetProfilePO();
  factory PetProfilePO.create(PageLoaderElement context) = $PetProfilePO.create;

  @ByCss('a.pet-medical-data-link')
  PageLoaderElement get _petEditLink;

  @ByTagName('a.history-link')
  @WithInnerText('Virtual Vet')
  PageLoaderElement get _assessmentHistoryLink;

  @ByTestId('virtual-vet-count')
  PageLoaderElement get _virtualVetHistoryCount;

  @ByTagName('a.history-link')
  @WithInnerText('Conversations')
  PageLoaderElement get _askAVetDirectlyHistoryLink;

  @ByTestId('ask-a-vet-count')
  PageLoaderElement get _askAVetHistoryCount;

  @ByTagName('a.history-link')
  @WithInnerText('Nutrition')
  PageLoaderElement get _nutribotHistoryLink;

  @ByTestId('nutribot-count')
  PageLoaderElement get _nutribotHistoryCount;

  void navigateToPetEdit() async {
    await _petEditLink.click();
  }

  bool hasEditPetButton() {
    return _petEditLink.exists;
  }

  int get virtualVetHistoryCount => int.tryParse(_virtualVetHistoryCount.innerText);

  bool hasAssessmentHistoryLink() {
    return _assessmentHistoryLink.exists;
  }

  void navigateToAssessmentHistory() async {
    await _assessmentHistoryLink.click();
  }

  bool hasAskAVetHistoryLink() {
    return _askAVetDirectlyHistoryLink.exists;
  }

  int get askAVetHistoryCount => int.tryParse(_askAVetHistoryCount.innerText);

  void navigateToAskAVetHistory() async {
    await _askAVetDirectlyHistoryLink.click();
  }

  bool hasNutribotHistoryLink() {
    return _nutribotHistoryLink.exists;
  }

  int get nutribotHistoryCount => int.tryParse(_nutribotHistoryCount.innerText);

  void navigateToNutribotHistory() async {
    await _nutribotHistoryLink.click();
  }
}
