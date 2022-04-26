abstract class InfoEvent {}

class SymptomInfoOpened extends InfoEvent {
  final String header;
  final String name;
  final String description;

  SymptomInfoOpened({this.header, this.name, this.description});
}

class SymptomInfoClosed extends InfoEvent {}

class TermsAndConditionsOpened extends InfoEvent {}

class AgeInfoOpened extends InfoEvent {
  final String header;
  final String species;

  AgeInfoOpened({this.header, this.species});
}
