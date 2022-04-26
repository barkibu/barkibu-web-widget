abstract class PetDetailsEvent {}

class PetDetailsStarted extends PetDetailsEvent {
  final int petId;

  PetDetailsStarted(this.petId);
}
