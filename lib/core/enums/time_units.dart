enum TimeUnit {
  unknown(''),
  days('Day'),
  months('Month');

  final String label;

  const TimeUnit(this.label);

  static TimeUnit fromString(String value) => values.firstWhere((element) => element.label == value, orElse: () => TimeUnit.unknown);
}