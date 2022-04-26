import 'package:meta/meta.dart';

class PetProperties {
  final int id;
  final String kbKey;
  final String species;
  final String name;
  final String currentPlan;
  final String currentPlanStarted;
  final String currentPlanEnds;

  PetProperties({
    @required this.id,
    @required this.kbKey,
    @required this.species,
    @required this.name,
    @required this.currentPlan,
    @required this.currentPlanStarted,
    @required this.currentPlanEnds,
  });
}
