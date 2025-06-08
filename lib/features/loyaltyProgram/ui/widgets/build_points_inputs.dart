import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/widgets/fides_text_input.dart';

class BuildPointsInputs extends StatelessWidget {
  const BuildPointsInputs({
    super.key,
    required String currencyCode,
    required FocusNode pointsFocus,
    required FocusNode minimumPurchaseFocus,
    required TextEditingController pointsController,
    required TextEditingController minimumSpentController,
    required String? Function(String?)? validator,
    required Function() onPressed,
  })  : _currencyCode = currencyCode,
        _pointsFocus = pointsFocus,
        _minimumPurchaseFocus = minimumPurchaseFocus,
        _pointsController = pointsController,
        _minimumSpentController = minimumSpentController,
        _validator = validator,
        _onPressed = onPressed;

  final String _currencyCode;
  final FocusNode _pointsFocus;
  final FocusNode _minimumPurchaseFocus;
  final TextEditingController _pointsController;
  final TextEditingController _minimumSpentController;
  final String? Function(String?)? _validator;
  final Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FidesTextInput(
          focusNode: _pointsFocus,
          controller: _pointsController,
          inputLabel: 'Points Earned*',
          hintText: '10',
          helper: Text('How many points a customers receive.'),
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatter: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          validator: _validator,
          autoValidateMode: AutovalidateMode.onUnfocus,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        ),
        FidesTextInput(
          focusNode: _minimumPurchaseFocus,
          controller: _minimumSpentController,
          inputLabel: 'For Every Amount Spent*',
          hintText: '500',
          helper: Text('The spending required to earn the points above.'),
          textInputType: TextInputType.number,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_currencyCode),
              IconButton(
                onPressed: _onPressed,
                icon: Icon(Icons.arrow_drop_down_rounded),
              ),
            ],
          ),
          textInputAction: TextInputAction.next,
          validator: _validator,
          autoValidateMode: AutovalidateMode.onUnfocus,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
