import 'package:common_barkibu_dart/datasources/api/breeds_api.dart';
import 'package:common_barkibu_dart/datasources/api/clinic_api.dart';
import 'package:common_barkibu_dart/datasources/api/email_api.dart';
import 'package:common_barkibu_dart/datasources/api/feature_flags_api.dart';
import 'package:common_barkibu_dart/datasources/api/pet_api.dart';
import 'package:mockito/mockito.dart';

class MockPetApi extends Mock implements PetApi {}

class MockFeatureFlagsApi extends Mock implements FeatureFlagApi {}

class MockBreedsApi extends Mock implements BreedsApi {}

class MockEmailApi extends Mock implements EmailApi {}

class MockClinicApi extends Mock implements ClinicApi {}
