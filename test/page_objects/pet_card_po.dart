import 'package:pageloader/html.dart';
part 'pet_card_po.g.dart';

@PageObject()
@CheckTag('pet-card')
abstract class PetCardPO {
  PetCardPO();
  factory PetCardPO.create(PageLoaderElement context) = $PetCardPO.create;

  @ByClass('card-title')
  PageLoaderElement get _title;

  @ByTagName('a')
  PageLoaderElement get _link;

  bool hasName(String petName) {
    return _title.innerText.contains(petName);
  }

  void navigateToPetCard() {
    _link.click();
  }
}
