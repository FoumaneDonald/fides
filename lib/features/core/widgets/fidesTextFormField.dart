import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FidesTextFormField extends StatelessWidget {
  final TextEditingController? _controller;
  final String? _hintText;
  final String? _suffixText;
  final String? Function(String? value)? _validator;
  final void Function(String?)? _onSaved;
  final void Function(String)? _onFieldSubmitted;
  final Function(String)? _onChanged;
  final TextInputType? _textInputType;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final List<TextInputFormatter>? _inputFormatter;
  final TextCapitalization? _textCapitalization;

  const FidesTextFormField(
      {super.key,
      TextEditingController? controller,
      String? hintText,
      String? suffixText,
      String? Function(String? value)? validator,
      void Function(String?)? onSaved,
      void Function(String)? onFieldSubmitted,
      Function(String)? onChanged,
      TextInputType? textInputType,
      Widget? prefixIcon,
      Widget? suffixIcon,
      List<TextInputFormatter>? inputFormatter,
      TextCapitalization? textCapitalization})
      : _controller = controller,
        _hintText = hintText,
        _suffixText = suffixText,
        _validator = validator,
        _onSaved = onSaved,
        _onFieldSubmitted = onFieldSubmitted,
        _onChanged = onChanged,
        _textInputType = textInputType,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _inputFormatter = inputFormatter,
        _textCapitalization = textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon,
        hintText: _hintText,
        suffixText: _suffixText,
      ),
      keyboardType: _textInputType,
      textCapitalization: _textCapitalization ?? TextCapitalization.sentences,
      inputFormatters: _inputFormatter,
      validator: _validator,
      onSaved: _onSaved,
      onFieldSubmitted: _onFieldSubmitted,
      onChanged: _onChanged,
    );
  }
}
