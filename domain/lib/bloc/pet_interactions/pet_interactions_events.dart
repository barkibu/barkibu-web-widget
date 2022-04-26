abstract class PetInteractionsEvent {}

class PetInteractionsStarted extends PetInteractionsEvent {
  final int petId;

  PetInteractionsStarted(this.petId);
}
