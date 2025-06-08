import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

enum ProgramType {
  unknown('Unknown','Unknown', 'Unrecognized program type.', 'assets/icons/interrogation.svg', HugeIcons.strokeRoundedQuestion),
  stamp('Stamp','Stamp Program', 'A simple program where customers earn a digital stamp for each visit - perfect for rewarding repeat purchases.', 'assets/icons/stamp.svg', HugeIcons.strokeRoundedStamp01),
  points('Points','Points Program', 'Customers earn points based on how much they spend - great for encouraging larger purchases and repeat visits.', 'assets/icons/token.svg', HugeIcons.strokeRoundedTokenCircle);

  final String label;
  final String title;
  final String description;
  final String iconPath;
  final IconData icon;

  const ProgramType(this.label, this.title, this.description, this.iconPath, this.icon);

  static ProgramType from(String? value) {
    return ProgramType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => ProgramType.unknown,
    );
  }
}
