import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/domain/pet/create_pet_prevention_events_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pet_features_use_case.dart';
import 'package:mockito/mockito.dart';

class MockCreatePetUseCase extends Mock implements CreatePetUseCase {}

class MockGetPetFeaturesUseCase extends Mock implements GetPetFeaturesUseCase {}

class MockUpdatePetUseCase extends Mock implements UpdatePetUseCase {}

class MockDeletePetUseCase extends Mock implements DeletePetUseCase {}

class MockGetPetsUseCase extends Mock implements GetPetsUseCase {}

class MockCreatePetPreventionEventsUseCase extends Mock implements CreatePetPreventionEventsUseCase {}
