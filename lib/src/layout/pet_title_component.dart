import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/pipes/pet_pipes.dart';

@Component(selector: 'pet-title', templateUrl: 'pet_title_component.html', styleUrls: [
  'pet_title_component.css'
], directives: [
  coreDirectives,
], pipes: [
  PetIconPipe
])
class PetTitleComponent {
  @Input()
  Pet pet;

  final MessagesModel messages;

  PetTitleComponent(this.messages);

  String get petSpecies {
    return (pet.species == 'dog') ? messages.sharedMessages.species.dog : messages.sharedMessages.species.cat;
  }
}
