import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/mixins/ValidationMixins.dart';
import '../../../core/widgets/fidesTextFormField.dart';

class MinPurchaseInput extends StatelessWidget with ValidationMixins {
  const MinPurchaseInput({
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
          'Minimum purchase',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        FidesTextFormField(
          controller: controller,
          hintText: '0',
          suffixText: 'FCFA',
          textInputType: TextInputType.number,
          validator: generalValidation,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
          onChanged: onChanged,
        ),
      ],
    );
  }
}