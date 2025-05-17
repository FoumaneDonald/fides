enum ProgramType {
  unknown('Unknown','Unknown', 'Unrecognized program type.', 'assets/icons/interrogation.svg'),
  stamp('Stamp','Stamp Program', 'A simple program where customers earn a digital stamp for each visit - perfect for rewarding repeat purchases.', 'assets/icons/stamp.svg'),
  points('Points','Points Program', 'Customers earn points based on how much they spend - great for encouraging larger purchases and repeat visits.', 'assets/icons/token.svg');

  final String label;
  final String title;
  final String description;
  final String iconPath;

  const ProgramType(this.label, this.title, this.description, this.iconPath);

  static ProgramType from(String? value) {
    return ProgramType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => ProgramType.unknown,
    );
  }
}
