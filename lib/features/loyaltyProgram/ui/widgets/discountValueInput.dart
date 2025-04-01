import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/mixins/ValidationMixins.dart';
import '../../../core/widgets/fidesTextFormField.dart';

class DiscountValueInput extends StatelessWidget with ValidationMixins {
  const DiscountValueInput({
    super.key,
    required this.controller,
    required this.selectedDiscountType,
    required this.onChanged,
    required this.inputOnChanged,
  });

  final TextEditingController controller;
  final String selectedDiscountType;
  final Function(String? newValue)? onChanged;
  final  Function(String)? inputOnChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discount value*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Column(
          children: [
            FidesTextFormField(
              controller: controller,
              hintText: '100',
              suffixText: selectedDiscountType,
              textInputType: TextInputType.number,
              inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
              onChanged: inputOnChanged,
              validator: generalValidation,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RadioMenuButton(
                  value: 'FCFA',
                  groupValue: selectedDiscountType,
                  onChanged: onChanged,
                  child: Text('FCFA'),
                ),
                RadioMenuButton(
                  value: '%',
                  groupValue: selectedDiscountType,
                  onChanged: onChanged,
                  child: Text('%'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}