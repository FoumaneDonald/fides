import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/mixins/validation_mixins.dart';
import '../../core/widgets/fides_text_input.dart';
import '../../core/widgets/return_number.dart';

class BuildReturnFields extends StatelessWidget with ValidationMixins {
  const BuildReturnFields({
    super.key,
    required FocusNode returnNumberFocus,
    required TextEditingController stampNumberController,
    required List holes,
    required List<int> selectedNumbers,
    Function()? remove,
    Function()? add,
    required Function(int) toggleReturnNumber,
  })  : _returnNumberFocus = returnNumberFocus,
        _returnNumberController = stampNumberController,
        _holes = holes,
        _selectedNumbers = selectedNumbers,
        _remove = remove,
        _add = add,
        _toggleReturnNumber = toggleReturnNumber;

  final FocusNode _returnNumberFocus;

  final TextEditingController _returnNumberController;

  final List _holes;
  final List<int> _selectedNumbers;
  final Function()? _remove;
  final Function()? _add;
  final Function(int) _toggleReturnNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FidesTextInput(
          focusNode: _returnNumberFocus,
          controller: _returnNumberController,
          inputLabel: 'Number of Returns*',
          textAlign: TextAlign.center,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
          prefixIcon: IconButton(
            onPressed: _remove,
            icon: AppIcon.remove(),
          ),
          suffixIcon: IconButton(
            onPressed: _add,
            icon: AppIcon.add(),
          ),
          validator: composeValidators<String>([requiredField, maxReturns50]),
          autoValidateMode: AutovalidateMode.onUserInteraction,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose which Return number unlock a reward*',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (_holes.isEmpty) ...{
              Text('Try adding one by tapping on the + button'),
            } else ...{
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _holes.map(
                  (number) {
                    final bool isSelected = _selectedNumbers.contains(number);
                    return ReturnNumber(
                      isSelected: isSelected,
                      number: number,
                      onTap: _toggleReturnNumber,
                    );
                  },
                ).toList(),
              ),
            },
          ],
        ),
      ],
    );
  }
}
