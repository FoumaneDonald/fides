enum DiscountType {
  price('FCFA'),
  percentage('%');

  final String label;

  const DiscountType(this.label);

  static DiscountType from(String? value) {
    return DiscountType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => throw Exception('Discount type not found'),
    );
  }
}
