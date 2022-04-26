import 'package:pageloader/html.dart';
import 'pet_card_po.dart';

part 'my_pets_po.g.dart';

@PageObject()
@CheckTag('my-pets')
abstract class MyPetsPO {
  MyPetsPO();
  factory MyPetsPO.create(PageLoaderElement context) = $MyPetsPO.create;
  factory MyPetsPO.lookup(PageLoaderSource context) = $MyPetsPO.lookup;

  @ByCheckTag()
  List<PetCardPO> get _petCards;

  @ByTagName('a')
  @WithInnerText('Add a pet')
  PageLoaderElement get _addPetLink;

  @ByTagName('button')
  @WithInnerText('Add a pet')
  PageLoaderElement get _addPetButton;

  void navigateToAddPet() {
    _addPetLink.click();
  }

  void clickAddPetButton() {
    _addPetButton.click();
  }

  bool hasAddAPetButton() {
    return _addPetLink.exists || _addPetButton.exists;
  }

  void navigateToPetProfile(String petTitle) {
    _petCards.firstWhere((card) => card.hasName(petTitle)).navigateToPetCard();
  }
}
