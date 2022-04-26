abstract class AssessmentHistoryEvent {}

class AssessmentHistoryRequested implements AssessmentHistoryEvent {
  final int petId;

  AssessmentHistoryRequested(this.petId);
}
