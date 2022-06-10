import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:web_widget/src/card/card_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/pipes/pet_pipes.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(selector: 'pet-card', templateUrl: 'pet_card_component.html', styleUrls: [
  'pet_card_component.css'
], directives: [
  coreDirectives,
  routerDirectives,
  CardComponent,
  IconComponent,
], pipes: [
  PetIconPipe
])
class PetCardComponent {
  @Input()
  Pet pet;

  final MessagesModel messages;
  final WidgetConfiguration config;

  PetCardComponent(this.messages, this.config);

  bool get petSexAndSpayedStatusEnabled => config.petSexAndSpayedStatusEnabled;

  String get petProfilePath {
    return RoutePaths.petProfile.toUrl(parameters: {'id': pet.id.toString()});
  }

  String get petSpecies {
    return (pet.species == 'dog') ? messages.sharedMessages.species.dog : messages.sharedMessages.species.cat;
  }

  String get petSex {
    if (pet.sex == 'male') {
      return messages.sharedMessages.sexOption.male;
    } else if (pet.sex == 'female') {
      return messages.sharedMessages.sexOption.female;
    } else {
      return '';
    }
  }

  String get petNeutered {
    if (pet.neutered == true) {
      return messages.sharedMessages.yes;
    } else if (pet.neutered == false) {
      return messages.sharedMessages.no;
    } else {
      return '';
    }
  }

  String get neuteredLabel {
    if (pet.sex == 'female') {
      return messages.sharedMessages.spayed;
    } else {
      return messages.sharedMessages.castrated;
    }
  }
}
