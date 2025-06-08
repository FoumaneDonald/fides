import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/widgets/fides_text_input.dart';
import '../../../core/widgets/stamp_number.dart';

class BuildStampInputs extends StatelessWidget {
  const BuildStampInputs({
    super.key,
    required FocusNode stampNumberFocus,
    required TextEditingController stampNumberController,
    required List holes,
    required List<int> selectedNumbers,
    required String? Function(String?)? validator,
    required Function()? remove,
    required Function()? add,
    required Function(int) onTap,
  })  : _stampNumberFocus = stampNumberFocus,
        _stampNumberController = stampNumberController,
        _holes = holes,
        _selectedNumbers = selectedNumbers,
        _validator = validator,
        _remove = remove,
        _add = add,
        _onTap = onTap;

  final FocusNode _stampNumberFocus;

  final TextEditingController _stampNumberController;

  final List _holes;
  final List<int> _selectedNumbers;
  final String? Function(String?)? _validator;
  final Function()? _remove;
  final Function()? _add;
  final Function(int) _onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FidesTextInput(
          focusNode: _stampNumberFocus,
          controller: _stampNumberController,
          inputLabel: 'Number of stamps needed*',
          hintText: '0',
          textAlign: TextAlign.center,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],
          prefixIcon: IconButton(
            onPressed: _remove,
            icon: Icon(Icons.remove),
          ),
          suffixIcon: IconButton(
            onPressed: _add,
            icon: Icon(Icons.add),
          ),
          validator: _validator,
          autoValidateMode: AutovalidateMode.onUnfocus,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose stamp numbers that unlock a reward*',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (_holes.isEmpty) ...{
              Text('Try adding one by tapping on the + button'),
            } else ...{
              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: _holes.map(
                  (number) {
                    final bool isSelected = _selectedNumbers.contains(number);
                    return StampNumber(
                      isSelected: isSelected,
                      number: number,
                      onTap: _onTap,
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
