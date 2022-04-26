abstract class NutribotHistoryEvent {}

class NutribotHistoryRequested implements NutribotHistoryEvent {
  final int petId;

  NutribotHistoryRequested(this.petId);
}
