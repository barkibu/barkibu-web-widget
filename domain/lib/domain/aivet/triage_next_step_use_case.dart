import 'package:common_barkibu_dart/bloc/pet_health_chat/triage/triage_state.dart';
import 'package:common_barkibu_dart/models/aivet/aivet_model.dart';
import 'package:common_barkibu_dart/models/aivet/triage_actions.dart';
import 'package:common_barkibu_dart/repositories/aivet/aivet_repository.dart';
import 'package:common_barkibu_dart/repositories/pet/pet_repository.dart';

abstract class TriageNextStepUseCase {
  Stream<TriageAction> nextStep(AiVetModel model, TriageFlow type);
}

class TriageNextStepUseCaseImpl implements TriageNextStepUseCase {
  final PetRepository petRepository;
  final AiVetRepository aiVetRepository;

  TriageNextStepUseCaseImpl(this.petRepository, this.aiVetRepository);

  @override
  Stream<TriageAction> nextStep(AiVetModel model, TriageFlow flow) async* {
    if (model.pet == null) {
      yield TriageAction.patientDefinition();
    } else if (!model.pet.isValidForAiVet()) {
      yield TriageAction.patientDefinition();
    } else if (flow == TriageFlow.petDefinition || model.symptomDefinitionSkipped) {
      yield TriageAction.finishTriage();
    } else if (model.shouldAskForMainSymptom) {
      yield TriageAction.mainSymptom();
    } else if (flow == TriageFlow.mainSymptom) {
      try {
        final anamnesis = await aiVetRepository.anamnesis(model.consultationId, model.pet, model.symptoms);
        yield TriageAction.bindConsultationId(anamnesis?.consultationId);
      } finally {
        yield TriageAction.finishTriage();
      }
    } else if (model.shouldAskForOtherSymptom) {
      yield TriageAction.otherSymptom();
    } else if (model.shouldContinueAnamnesis) {
      try {
        final anamnesis = await aiVetRepository.anamnesis(model.consultationId, model.pet, model.symptoms);
        yield TriageAction.bindConsultationId(anamnesis?.consultationId);
        yield anamnesis != null ? TriageAction.symptomsSecondCycle(anamnesis) : TriageAction.unexpectedError();
      } catch (exception) {
        yield TriageAction.unexpectedError();
      }
    } else {
      yield TriageAction.finishTriage();
    }
  }
}
