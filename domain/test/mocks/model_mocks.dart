import 'package:common_barkibu_dart/models/aivet/aivet_actions.dart';
import 'package:common_barkibu_dart/models/aivet/aivet_model.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/models/user.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {
  @override
  String phoneNumber = '+1 11111111';
}

class MockGuestUser extends Mock implements User {
  @override
  String firstName = 'Guest';
}

class MockPet extends Mock implements Pet {
  @override
  int id = 1;
  @override
  String species = 'dog';
  @override
  String sex = 'male';

  MockPet({this.id, this.species, this.sex});
}

class MockSpecie extends Mock implements Species {
  @override
  String key = 'dog';
  @override
  String label = 'Dog';

  MockSpecie({this.key, this.label});
}

class MockSymptom extends Mock implements Symptom {
  @override
  String key = 'irrelevant';
  @override
  String name = 'irrelevant';
  @override
  String presence = 'unknown';
  @override
  var duration = SymptomDurationCycle(key: 'irrelevantKey');

  MockSymptom({this.key, this.name, this.presence});
}

class MockAiVetModel extends Mock implements AiVetModel {
  @override
  Pet pet = MockPet();
  User user = MockUser();
}

class MockAiVetAction extends Mock implements AiVetAction {}
