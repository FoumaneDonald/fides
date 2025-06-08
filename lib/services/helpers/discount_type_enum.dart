enum DiscountType {
  unknown(''),
  price('FCFA'),
  percentage('%');

  final String label;

  const DiscountType(this.label);

  static DiscountType from(String? value) {
    return DiscountType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => DiscountType.unknown,
    );
  }
}
