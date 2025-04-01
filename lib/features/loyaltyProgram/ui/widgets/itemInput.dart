import 'package:flutter/material.dart';

import '../../../core/mixins/ValidationMixins.dart';
import '../../../core/widgets/fidesTextFormField.dart';

class ItemInput extends StatelessWidget with ValidationMixins {
  const ItemInput({
    super.key,
    required this.controller,
    required this.rewardType,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String rewardType;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$rewardType Item*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        FidesTextFormField(
          controller: controller,
          hintText: 'Coffee',
          validator: generalValidation,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
