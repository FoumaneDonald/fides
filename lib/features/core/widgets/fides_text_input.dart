import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FidesTextInput extends StatelessWidget with ValidationMixins {
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String inputLabel;
  final String? hintText;
  final bool? enable;
  final bool readOnly;
  final TextAlign? textAlign;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? helper;
  final int? maxLines;
  final TextInputType? textInputType;
  final AutovalidateMode autoValidateMode;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String? value)? onSaved;
  final Function(PointerDownEvent)? onTapOutside;
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
    this.enable,
    this.readOnly = false,
    this.textAlign,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.helper,
    this.maxLines,
    this.textInputType,
    this.autoValidateMode = AutovalidateMode.onUnfocus,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatter,
    this.onSaved,
    this.onTapOutside,
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
          style: Theme.of(context).textTheme.labelLarge,
        ),
        TextFormField(
          focusNode: focusNode,
          textInputAction: textInputAction,
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            suffixText: suffixText,
            suffix: suffix,
            helper: helper,
          ),
          enabled: enable,
          keyboardType: textInputType,
          textAlign: textAlign ?? TextAlign.start,
          autovalidateMode: autoValidateMode,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatter,
          validator: validator,
          onSaved: onSaved,
          onTapOutside: onTapOutside ?? (event) => focusNode?.unfocus(),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
