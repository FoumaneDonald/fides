enum RewardType {
  unknown(''),
  free('Free'),
  discount('Discount');

  final String label;

  const RewardType(this.label);

  static RewardType from(String? value) {
    return RewardType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => RewardType.free,
    );
  }
}
