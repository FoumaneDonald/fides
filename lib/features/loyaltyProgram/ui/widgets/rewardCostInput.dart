import 'package:fides/features/core/mixins/ValidationMixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/widgets/fidesTextFormField.dart';

class RewardCostInput extends StatelessWidget with ValidationMixins {
  const RewardCostInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How many point does the rewards cost*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        FidesTextFormField(
          controller: controller,
          hintText: '100',
          textInputType: TextInputType.number,
          validator: generalValidation,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
          onChanged: onChanged,
        ),
      ],
    );
  }
}