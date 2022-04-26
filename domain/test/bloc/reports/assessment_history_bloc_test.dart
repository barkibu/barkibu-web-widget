import 'package:common_barkibu_dart/bloc/reports/assessment_history_bloc.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_features_use_case.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGetPetAssessmentsUseCase extends Mock implements GetPetAssessmentsUseCase {}

class MockGetPetFeaturesUseCase extends Mock implements GetPetFeaturesUseCase {}

void main() {
  GetPetAssessmentsUseCase getPetAssessmentsUseCase;
  AssessmentHistoryBloc assessmentHistoryBloc;
  GetPetFeaturesUseCase getPetFeaturesUseCase;
  final pet = Pet(id: 1);

  setUp(() {
    getPetAssessmentsUseCase = MockGetPetAssessmentsUseCase();
    getPetFeaturesUseCase = MockGetPetFeaturesUseCase();
    assessmentHistoryBloc = AssessmentHistoryBloc(getPetAssessmentsUseCase, getPetFeaturesUseCase);
    when(getPetAssessmentsUseCase.getPetAivetAssessments(any)).thenAnswer((_) => Future.value([]));
    when(getPetAssessmentsUseCase.getPetAskAVetAssessments(any)).thenAnswer((_) => Future.value([]));
  });

  tearDown(() async {
    await assessmentHistoryBloc?.close();
  });

  group('AssessmentHistoryBloc', () {
    test('initial state is correct', () {
      expect(assessmentHistoryBloc.initialState, isA<AssessmentHistoryInitial>());
    });
  });

  group('AssessmentHistoryRequested event', () {
    final startedEvent = AssessmentHistoryRequested(pet.id);

    group('Successful', () {
      setUp(() {
        when(getPetAssessmentsUseCase.getPetAivetAssessments(pet.id)).thenAnswer((_) => Future.value([]));
        when(getPetAssessmentsUseCase.getPetAskAVetAssessments(pet.id)).thenAnswer((_) => Future.value([]));
      });
      test('it yields AssessmentHistoryLoadSuccess state with the new pet', () {
        expectLater(
          assessmentHistoryBloc,
          emitsInOrder([
            isA<AssessmentHistoryInitial>(),
            isA<AssessmentHistoryLoadInProgress>(),
            isA<AssessmentHistoryLoadSuccess>(),
          ]),
        );
        assessmentHistoryBloc.add(startedEvent);
      });
    });

    group('Failing', () {
      setUp(() {
        when(getPetAssessmentsUseCase.getPetAivetAssessments(any)).thenAnswer((_) => throw Error());
        when(getPetAssessmentsUseCase.getPetAskAVetAssessments(pet.id)).thenAnswer((_) => Future.value([]));
      });
      test('it yields AssessmentHistoryLoadFailure state without pet if request fails', () {
        expectLater(
          assessmentHistoryBloc,
          emitsInOrder([
            isA<AssessmentHistoryInitial>(),
            isA<AssessmentHistoryLoadInProgress>(),
            isA<AssessmentHistoryLoadFailure>(),
          ]),
        );
        assessmentHistoryBloc.add(startedEvent);
      });
    });
  });
}
