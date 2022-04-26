import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/aivet/urgency.dart';

import 'breed.dart';

class ConsultationOptions {
  final List<Species> species;
  final List<Sex> sexes;
  final List<Symptom> symptoms;
  final int petNameMaxLength;
  final List<SymptomDuration> symptomsDurations;

  ConsultationOptions({
    this.species,
    this.sexes,
    this.petNameMaxLength,
    this.symptoms,
    this.symptomsDurations,
  });
}

class SymptomFound {
  final bool duration;
  final bool frequency;
  final Symptom symptom;

  const SymptomFound({this.duration, this.frequency, this.symptom});
}

class Symptom extends EntityWithArticle {
  final String key;
  @override
  final String name;
  final Urgency urgency;
  @override
  final String article;
  String presence;
  SymptomDurationCycle duration;
  SymptomFrequencyCycle frequency;

  Symptom({this.key, this.name, this.urgency, this.article, this.presence, this.duration, this.frequency})
      : super(name, article);

  bool get isPresent => presence == 'yes';
}

class SymptomDuration {
  final String label;
  final int min;
  final int max;

  SymptomDuration({this.label, this.min, this.max});
}

class SymptomDurationCycle {
  final String key;
  final String label;

  SymptomDurationCycle({this.label, this.key});
}

class SymptomFrequencyCycle {
  final String key;
  final String label;

  SymptomFrequencyCycle({this.label, this.key});
}

class Species {
  final String key;
  final String label;
  final String img;
  final List<Breed> breeds;

  Species({this.key, this.label, this.img, this.breeds});
}

class Sex {
  final String key;
  final String label;

  Sex({this.key, this.label});
}

class Age {
  Age({this.key, this.label});

  final int key;
  final String label;
}
