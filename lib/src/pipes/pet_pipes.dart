import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/models/pet.dart';

String _petIcon(Pet pet) => (pet.species == 'dog') ? '🐶' : '🐱';

@Pipe('petIcon')
class PetIconPipe extends PipeTransform {
  String transform(Pet pet) => _petIcon(pet);
}

@Pipe('petTitle')
class PetTitlePipe extends PipeTransform {
  String transform(Pet pet) => '${_petIcon(pet)}  ${pet.name}';
}
