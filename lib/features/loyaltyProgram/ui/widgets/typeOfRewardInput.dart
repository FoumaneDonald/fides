import 'package:flutter/material.dart';

class TypeOfRewardInput extends StatelessWidget {
  const TypeOfRewardInput({
    super.key,
    required this.listTypeReward,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<String> listTypeReward;
  final String selectedValue;
  final Function(String? newValue)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type of reward*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownButtonFormField(
          value: selectedValue,
          items: listTypeReward
              .map(
                (reward) => DropdownMenuItem(
                  value: reward,
                  child: Text(reward),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
