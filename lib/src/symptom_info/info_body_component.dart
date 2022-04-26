import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/petProfileMessages.i18n.dart';
import 'package:web_widget/src/bloc/chat/info_state.dart';
import 'package:web_widget/src/home/terms_of_service_component.dart';

@Component(
  selector: 'info-body',
  templateUrl: 'info_body_component.html',
  styleUrls: ['info_body_component.css'],
  directives: [coreDirectives, TermsOfServiceComponent],
)
class InfoBodyComponent {
  final MessagesModel messages;

  @Input()
  InfoSetSuccess infoState;

  InfoBodyComponent(this.messages);

  bool get isGenericSymptomInfo => infoState is SymptomInfoSetSuccess;
  bool get isAgeInfo => infoState is AgeInfoSetSuccess;
  bool get isDog => (infoState as AgeInfoSetSuccess).species == 'dog';
  bool get isTermsAndConditionsInfo => infoState is TermsAndConditionsSetSuccess;

  String get ageEstimationTitle => petProfileMessages.ageEstimation.title(species);
  String get species => isDog ? messages.sharedMessages.species.dog : messages.sharedMessages.species.cat;
  PetProfileMessages get petProfileMessages => messages.petProfileMessages;

  String get childDescription => [
        petProfileMessages.petCharacteristicsNewborn.cute,
        petProfileMessages.petCharacteristicsNewborn.bigBodyParts,
        petProfileMessages.petCharacteristicsNewborn.playfull,
      ].join('. ');

  String get youngDescription => [
        petProfileMessages.petCharacteristicsYoung.brightEyes,
        petProfileMessages.petCharacteristicsYoung.brightTeeth,
        petProfileMessages.petCharacteristicsYoung.playfull,
        petProfileMessages.petCharacteristicsYoung.neverTired,
      ].join('. ');

  String get adultDescription => [
        petProfileMessages.petCharacteristicsAdult.energetic,
        petProfileMessages.petCharacteristicsAdult.likesToRest,
        petProfileMessages.petCharacteristicsAdult.balancedBehaviour,
      ].join('. ');

  String get seniorDogDescription => [
        petProfileMessages.dogCharacteristicsSenior.greyHair,
        petProfileMessages.dogCharacteristicsSenior.forgetfull,
        petProfileMessages.dogCharacteristicsSenior.slow,
        petProfileMessages.petCharacteristicsSenior.missTeeth,
        petProfileMessages.petCharacteristicsSenior.muscleWastage
      ].join('. ');

  String get seniorCatDescription => [
        petProfileMessages.catCharacteristicsSenior.notBrightSkin,
        petProfileMessages.catCharacteristicsSenior.forgetfull,
        petProfileMessages.catCharacteristicsSenior.relucantToJump,
        petProfileMessages.petCharacteristicsSenior.missTeeth,
        petProfileMessages.petCharacteristicsSenior.muscleWastage
      ].join('. ');
}
