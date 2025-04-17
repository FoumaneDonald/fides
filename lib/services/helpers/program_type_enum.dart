enum ProgramType {
  unknown('Unknown', 'Unrecognized program type.', 'assets/icons/unknown.svg'),
  stamp('Stamp', 'A classic loyalty program where customers earn a digital stamp for each qualifying purchase.', 'assets/icons/stamp.svg'),
  points('Points', 'A flexible loyalty program where customers earn points for every money spent.', 'assets/icons/token.svg');

  final String label;
  final String description;
  final String iconPath;

  const ProgramType(this.label, this.description, this.iconPath);

  static ProgramType from(String? value) {
    return ProgramType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => ProgramType.unknown,
    );
  }
}
