class HealthPlan {
  String key;
  String planName;
  String description;
  Price price;
  String type;
  int planLifeInMonths;
  bool buyable;
  String url;
  List<Benefit> benefits;
  int buyDate;
  int expirationDate;

  HealthPlan({
    this.key,
    this.planName,
    this.description,
    this.price,
    this.type,
    this.planLifeInMonths,
    this.buyable,
    this.url,
    this.benefits,
    this.buyDate,
    this.expirationDate,
  });
}

class Price {
  final int amountInCents;
  final String currency;
  final bool from;

  Price({this.amountInCents, this.currency, this.from});

  String get fullPrice {
    switch (currency) {
      case 'EUR':
        return '${amountInCents ~/ 100}€';
      default:
        return '\$${amountInCents ~/ 100}';
    }
  }

  String get monthlyPrice {
    switch (currency) {
      case 'EUR':
        return '${(amountInCents / 1200).toStringAsFixed(1).replaceAll('.', ',')}€';
      default:
        return '\$${(amountInCents / 1200).toStringAsFixed(1).replaceAll('.', ',')}';
    }
  }
}

class Benefit {
  String benefit;
  bool included;
  String detailedInfo;

  Benefit({
    this.benefit,
    this.included,
    this.detailedInfo,
  });
}
