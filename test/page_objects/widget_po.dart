import 'package:pageloader/html.dart';
import 'clinics_finder_po.dart';
import 'nutrition_history_po.dart';
import 'sign_up_po.dart';
import 'sign_in_po.dart';
import 'chat_po.dart';
import 'ask_a_vet_po.dart';
import 'chat_with_vet_po.dart';
import 'profile_home_po.dart';
import 'password_recovery_po.dart';
import 'pet_create_po.dart';
import 'pet_edit_po.dart';
import 'my_pets_po.dart';
import 'pet_profile_po.dart';
import 'pet_assessment_history_po.dart';
import 'confirmation_modal_po.dart';
import 'nutribot_po.dart';
import 'symptom_info_screen_po.dart';

part 'widget_po.g.dart';

@PageObject()
@CheckTag('app')
abstract class WidgetPO {
  WidgetPO();
  factory WidgetPO.create(PageLoaderElement context) = $WidgetPO.create;

  @ByTagName('nav')
  PageLoaderElement get nav;

  @ByCss('.start-assessment-form button[type="submit"]')
  PageLoaderElement get _formSubmit;

  @ByCheckTag()
  SignUpPO get signUp;

  @ByCheckTag()
  SignInPO get signIn;

  @ByCheckTag()
  ChatPO get chat;

  @ByCheckTag()
  PetCreatePO get petCreate;

  @ByCheckTag()
  PetEditPO get petEdit;

  @ByCheckTag()
  MyPetsPO get myPets;

  @ByCheckTag()
  ClinicsFinderPO get clinicsFinder;

  @ByCheckTag()
  AskAVetPO get askAVet;

  @ByCheckTag()
  ChatWithVetPO get chatWithVet;

  @ByCheckTag()
  PasswordRecoveryPO get passwordRecovery;

  @ByCheckTag()
  PetProfilePO get petProfile;

  @ByCheckTag()
  PetAssessmentHistoryPO get petAssessmentHistoryPO;

  @ByCheckTag()
  NutritionHistoryPO get nutritionHistoryPO;

  @ByCheckTag()
  ProfileHomePO get profileHome;

  @ByCheckTag()
  ConfirmationModalPO get confirmationModal;

  @ByCheckTag()
  NutribotPO get nutribot;

  @ByCheckTag()
  SymptomInfoScreenPO get symptomInfoScreen;

  @ByTagName('home')
  PageLoaderElement get home;

  @ByCss('nav a')
  @WithInnerText('Find A Clinic')
  PageLoaderElement get _clinicsFinderLink;

  @ByCss('nav a')
  @WithInnerText('Start using')
  PageLoaderElement get _signUpLink;

  @ByCss('nav a')
  @WithInnerText('Sign in')
  PageLoaderElement get _signInLink;

  @ByCss('nav a')
  @WithInnerText('Log out')
  PageLoaderElement get _signOutLink;

  @ByCss('nav a')
  @WithInnerText('Profile')
  @WithAttribute('href', '/profile')
  PageLoaderElement get _profileLink;

  @ByCss('nav a')
  @WithInnerText('My Pets')
  PageLoaderElement get _myPetsLink;

  @ByCss('nav a')
  @WithInnerText('Ask A Vet')
  PageLoaderElement get _askAVetLink;

  @ByCss('form.start-assessment-form')
  PageLoaderElement get _aivetForm;

  @ByCss('nav a')
  @WithInnerText('Food and Nutrition Finder')
  PageLoaderElement get _nutribotLink;

  @ByCss('go-back button')
  PageLoaderElement get _goBackButton;

  @ByCss('go-back a')
  PageLoaderElement get _goBackLink;

  Future<void> navigateToSignUp() async {
    await _signUpLink.click();
  }

  Future<void> navigateToSignIn() async {
    await _signInLink.click();
  }

  Future<void> navigateToSignOut() async {
    await _signOutLink.click();
  }

  Future<void> navigateToAiVetChat() async {
    await _formSubmit.click();
  }

  Future<void> navigateToClinicsFinder() async {
    await _clinicsFinderLink.click();
  }

  Future<void> navigateToProfileHome() async {
    await _profileLink.click();
  }

  Future<void> navigateToMyPets() async {
    await _myPetsLink.click();
  }

  bool hasNutribotLink() {
    return _nutribotLink.exists;
  }

  bool hasAivetForm() {
    return _aivetForm.exists;
  }

  Future<void> navigateToNutribot() async {
    await _nutribotLink.click();
  }

  bool hasAskAVetLink() {
    return _askAVetLink.exists;
  }

  bool hasProfileLink() {
    return _profileLink.exists;
  }

  bool hasMyPetsLink() {
    return _myPetsLink.exists;
  }

  bool hasSignInLink() {
    return _signInLink.exists;
  }

  bool hasSignUpLink() {
    return _signUpLink.exists;
  }

  Future<void> navigateToAskAVet() async {
    await _askAVetLink.click();
  }

  Future<void> goBack() async {
    if (_goBackLink.exists) {
      return await _goBackLink.click();
    } else {
      return await _goBackButton.click();
    }
  }

  bool get canNavigateBack {
    return _goBackLink.exists || _goBackButton.exists;
  }
}
