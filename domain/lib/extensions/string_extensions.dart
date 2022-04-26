extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalizeFirstOfEach() => split(' ').map((word) => word.capitalize()).join(' ');

  bool get isNullEmptyOrWhitespace => this == null || isEmpty || trim().isEmpty;

  T toEnum<T>(List<T> values) {
    return values.firstWhere(
      (e) => e.toString().toLowerCase().split('.').last == '$this'.toLowerCase(),
      orElse: () => null,
    );
  }
}
