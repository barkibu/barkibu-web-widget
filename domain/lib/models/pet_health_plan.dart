import 'package:common_barkibu_dart/models/health_plan.dart';

class PetHealthPlan {
  final String key;
  final String planName;
  final Price price;
  final DateTime purchaseDate;
  final DateTime expirationDate;

  PetHealthPlan({
    this.key,
    this.planName,
    this.price,
    this.purchaseDate,
    this.expirationDate,
  });
}
