import 'package:pageloader/html.dart';
import 'pet_card_po.dart';

part 'profile_home_po.g.dart';

@PageObject()
@CheckTag('profile-home')
abstract class ProfileHomePO {
  ProfileHomePO();
  factory ProfileHomePO.create(PageLoaderElement context) = $ProfileHomePO.create;
  factory ProfileHomePO.lookup(PageLoaderSource context) = $ProfileHomePO.lookup;

  @ByTagName('a')
  @WithInnerText('Update profile')
  PageLoaderElement get _editProfileLink;

  @ByCss('.profile-card-username')
  PageLoaderElement get _fullNameContainer;

  @ByCss('.profile-card-email')
  PageLoaderElement get _userInfoText;

  @ByCheckTag()
  List<PetCardPO> get _petCards;

  Future<void> navigateToEditProfile() async {
    await _editProfileLink.click();
  }

  bool hasFullName(String fullName) {
    return _fullNameContainer.innerText.contains(fullName);
  }

  bool hasUserInfo(String userInfo) {
    return _userInfoText.innerText.contains(userInfo);
  }

  PetCardPO findPetCard({String petName}) {
    return _petCards.firstWhere((card) => card.hasName(petName));
  }
}
