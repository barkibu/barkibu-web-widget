abstract class InfoState {}

abstract class InfoSetSuccess extends InfoState {
  String header;
  String name;
  String description;
}

class SymptomInfoSetSuccess extends InfoSetSuccess {
  @override
  final String header;
  @override
  final String name;
  @override
  final String description;

  SymptomInfoSetSuccess({this.header, this.name, this.description});
}

class TermsAndConditionsSetSuccess extends InfoSetSuccess {}

class AgeInfoSetSuccess extends InfoSetSuccess {
  @override
  final String header;
  final String species;

  AgeInfoSetSuccess({this.header, this.species, name = '', description = ''});
}

class InfoEmpty extends InfoState {}
