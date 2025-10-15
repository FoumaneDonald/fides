import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:flutter/material.dart';

class ReturnNumber extends StatelessWidget {
  final bool isSelected;
  final int number;
  final Function(int)? onTap;

  const ReturnNumber({
    super.key,
    required this.isSelected,
    required this.number,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap!(number),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        minimumSize: const Size(64, 64),
        backgroundColor: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
        side: BorderSide(
          color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
        ),
        elevation: 0, // optional, remove if you want flat look
      ),
      child: isSelected
          ? AppIcon.gift()
          : Text(
              number.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
    );
  }
}
