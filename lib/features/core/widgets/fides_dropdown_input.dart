import 'package:flutter/material.dart';

class FidesDropdownInput<T> extends StatelessWidget {
  final String inputLabel;
  final List<T> dropDownList;
  final T selectedValue;
  final Function(T? newValue)? onChanged;

  // New required parameter: builds the display widget for each item
  final Widget Function(T item) itemBuilder;

  const FidesDropdownInput({
    super.key,
    required this.inputLabel,
    required this.dropDownList,
    required this.selectedValue,
    required this.itemBuilder,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the selectedValue is actually present in the list
    // This prevents runtime errors if an invalid initial value is provided.
    // Note: This check relies on the default equality '==' for type T.
    // If T is a custom class, ensure '==' and 'hashCode' are overridden correctly.
    assert(dropDownList.contains(selectedValue), 'The provided selectedValue must exist in the dropDownList.');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          value: selectedValue,
          items: dropDownList
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: itemBuilder(item),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
