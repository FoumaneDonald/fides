import 'package:fides/features/core/mixins/validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';


class FidesPhoneInput extends StatelessWidget with ValidationMixins {
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final PhoneController controller;
  final String inputLabel;
  // final String? hintText;
  // final TextAlign? textAlign;
  // final String? suffixText;
  // final Widget? prefixIcon;
  // final Widget? suffixIcon;
  // final Widget? suffix;
  // final Widget? prefix;
  // final Widget? helper;
  // final int? maxLine;
  final TextInputType? textInputType;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Function(PhoneNumber?)? onSaved;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(PhoneNumber?)? onChanged;
  final Function(PhoneNumber)? onFieldSubmitted;
  final String? Function(PhoneNumber?)? validator;

  const FidesPhoneInput({
    super.key,
    this.focusNode,
    this.textInputAction,
    required this.controller,
    required this.inputLabel,
    // this.hintText,
    // this.textAlign,
    // this.suffixText,
    // this.prefixIcon,
    // this.suffixIcon,
    // this.suffix,
    // this.prefix,
    // this.helper,
    // this.maxLine,
    this.textInputType,
    this.autoValidateMode,
    this.inputFormatters,
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
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        PhoneFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          textInputAction: textInputAction,
          autovalidateMode: autoValidateMode,
          countrySelectorNavigator: const CountrySelectorNavigator.draggableBottomSheet(),
          enabled: true,
          isCountrySelectionEnabled: true,
          isCountryButtonPersistent: true,
          countryButtonStyle: const CountryButtonStyle(showDialCode: true, showFlag: true, flagSize: 24),
          inputFormatters: inputFormatters,
          onTapOutside: onTapOutside ?? (event) => focusNode?.unfocus(),
          onChanged: onChanged,
          onSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}
