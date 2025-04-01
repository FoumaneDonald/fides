import 'package:fides/features/core/mixins/ValidationMixins.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/fidesTextFormField.dart';

class DescriptionInput extends StatelessWidget with ValidationMixins {
  const DescriptionInput({
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
          'Description*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        FidesTextFormField(
          controller: controller,
          textInputType: TextInputType.name,
          hintText: '1000 FCFA off your next purchase',
          validator: generalValidation,
          onChanged: onChanged,
        ),
      ],
    );
  }
}