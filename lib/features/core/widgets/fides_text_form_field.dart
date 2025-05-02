import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// todo delete
class FidesTextFormField extends StatelessWidget {
  final FocusNode? _focusNode;
  final TextEditingController? _controller;
  final int? _maxLine;
  final String? _hintText;
  final String? _suffixText;
  final Widget? _suffix;
  final Widget? _helper;
  final String? Function(String? value)? _validator;
  final void Function(String?)? _onSaved;
  final void Function(String)? _onFieldSubmitted;
  final Function(String)? _onChanged;
  final TextInputType? _textInputType;
  final AutovalidateMode? _autoValidateMode;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final List<TextInputFormatter>? _inputFormatter;
  final TextCapitalization? _textCapitalization;

  const FidesTextFormField({
    super.key,
    FocusNode? focusNode,
    TextEditingController? controller,
    int? maxLine = 1,
    String? hintText,
    String? suffixText,
    Widget? suffix,
    Widget? helper,
    String? Function(String? value)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onFieldSubmitted,
    Function(String)? onChanged,
    TextInputType? textInputType,
    AutovalidateMode? autoValidateMode,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<TextInputFormatter>? inputFormatter,
    TextCapitalization? textCapitalization,
  })  : _focusNode = focusNode,
        _controller = controller,
        _maxLine = maxLine,
        _hintText = hintText,
        _suffixText = suffixText,
        _suffix = suffix,
        _helper = helper,
        _validator = validator,
        _onSaved = onSaved,
        _onFieldSubmitted = onFieldSubmitted,
        _onChanged = onChanged,
        _textInputType = textInputType,
        _autoValidateMode = autoValidateMode,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _inputFormatter = inputFormatter,
        _textCapitalization = textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon,
        hintText: _hintText,
        suffixText: _suffixText,
        suffix: _suffix,
        helper: _helper
      ),
      keyboardType: _textInputType,
      autovalidateMode: _autoValidateMode,
      maxLines: _maxLine,
      textCapitalization: _textCapitalization ?? TextCapitalization.sentences,
      inputFormatters: _inputFormatter,
      validator: _validator,
      onSaved: _onSaved,
      onFieldSubmitted: _onFieldSubmitted,
      onChanged: _onChanged,
    );
  }
}
