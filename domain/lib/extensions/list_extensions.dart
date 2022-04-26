import 'package:common_barkibu_dart/common_barkibu_dart.dart';

extension ListExtension<T> on List<T> {
  List<T> copy() => map((e) => e).toList();

  List<T> replace(T element, bool Function(T) matcher) => map((e) => matcher(e) ? element : e).toList();
}

extension ListConditionsExtension on List<Condition> {
  bool hasAnyUrgent() => any((condition) => condition.urgency != Urgency.low);
}

extension ListSymptomsExtension on List<Symptom> {
  List<Symptom> withArticle() => where((symptom) => symptom.article != null && symptom.article.isNotEmpty).toList();
}
