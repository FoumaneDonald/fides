import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fides_text_form_field.dart';

class FidesTextInputSelection<T> extends StatelessWidget {
  final FocusNode? focusNode;
  final FocusNode? focusNodeDropdown;
  final TextEditingController controller;
  final String inputLabel;
  final String? hintText;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? helper;
  final int? maxLine;
  final TextInputType? textInputType;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String? value)? onSaved;
  final Function(String?)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  //Dropdown
  final List<T> dropDownList;
  final T selectedValue;
  final Function(T? newValue)? onChangedDropdown;
  final Function(T? value)? onSavedDropdown;
  final Widget Function(T item) itemBuilder;

  const FidesTextInputSelection({
    super.key,
    this.focusNode,
    this.focusNodeDropdown,
    required this.controller,
    required this.inputLabel,
    this.hintText,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.helper,
    this.maxLine,
    this.textInputType,
    this.autoValidateMode,
    this.textCapitalization,
    this.inputFormatter,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,

    //dropdown
    required this.dropDownList,
    required this.selectedValue,
    this.onChangedDropdown,
    this.onSavedDropdown,
    required this.itemBuilder,
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
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<T>(
                    focusNode: focusNodeDropdown,
                    value: selectedValue,
                    underline: SizedBox(),
                    // autovalidateMode: AutovalidateMode.onUnfocus,
                    items: dropDownList
                        .map(
                          (item) => DropdownMenuItem<T>(
                            value: item,
                            child: itemBuilder(item),
                          ),
                        )
                        .toList(),
                    onChanged: onChangedDropdown,
                    // onSaved: onSavedDropdown,
                  ),
                ],
              ),
            ),
            hintText: hintText,
            suffixText: suffixText,
            suffix: suffix,
            helper: helper,
          ),
          keyboardType: textInputType,
          autovalidateMode: autoValidateMode,
          maxLines: maxLine,
          textCapitalization: textCapitalization ?? TextCapitalization.sentences,
          inputFormatters: inputFormatter,
          validator: validator,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
