import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NumberInSquare extends StatelessWidget {
  final bool isSelected;
  final int number;
  final Function(int)? onTap;

  const NumberInSquare({
    super.key,
    required this.isSelected,
    required this.number,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(number),
      child: Container(
        width: 52,
        height: 52,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
          border: Border.all(
            width: 1,
            color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
