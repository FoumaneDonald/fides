import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';

import 'fides_text_form_field.dart';

class FidesTextInput extends StatelessWidget with ValidationMixins {
  final TextEditingController controller;
  final String inputLabel;
  final String? hintText;
  final String? suffixText;
  final int? maxLine;
  final TextInputType? textInputType;
  final Function(String? value)? onSaved;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const FidesTextInput({
    super.key,
    required this.controller,
    required this.inputLabel,
    this.hintText,
    this.suffixText,
    this.maxLine,
    this.textInputType,
    this.onSaved,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        FidesTextFormField(
          controller: controller,
          hintText: hintText,
          suffixText: suffixText,
          maxLine: maxLine,
          textInputType: textInputType,
          validator: generalValidation,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
