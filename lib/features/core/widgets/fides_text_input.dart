import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FidesTextInput extends StatelessWidget with ValidationMixins {
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String inputLabel;
  final String? hintText;
  final TextAlign? textAlign;
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

  const FidesTextInput({
    super.key,
    this.focusNode,
    this.textInputAction,
    required this.controller,
    required this.inputLabel,
    this.hintText,
    this.textAlign,
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          focusNode: focusNode,
          textInputAction: textInputAction,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            suffixText: suffixText,
            suffix: suffix,
            helper: helper,
          ),
          keyboardType: textInputType,
          textAlign: textAlign ?? TextAlign.start,
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
