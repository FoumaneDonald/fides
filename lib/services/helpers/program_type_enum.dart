import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

enum ProgramType {
  unknown('Unknown','Unknown', 'Unrecognized program type.', HugeIcons.strokeRoundedHelpCircle),
  returning('Return','Return Program', 'Reward customers for their regular visit. Each time they come back, they move closer to unlocking a special reward. Perfect for building loyalty through repeat purchases.', HugeIcons.strokeRoundedStamp01),
  spend('Spend','Spend Program', 'Reward customers for the value they bring. The more they spend, the more points they earn. Ideal for encouraging bigger purchases and lasting connections.', HugeIcons.strokeRoundedTokenCircle);

  final String label;
  final String title;
  final String description;
  final List<List<dynamic>> icon;

  const ProgramType(this.label, this.title, this.description, this.icon);

  static ProgramType from(String? value) {
    return ProgramType.values.firstWhere(
      (e) => e.label.toLowerCase() == value?.toLowerCase(),
      orElse: () => ProgramType.unknown,
    );
  }
}
