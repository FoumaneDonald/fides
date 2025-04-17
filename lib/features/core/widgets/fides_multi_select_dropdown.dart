import 'package:flutter/material.dart';

/// A widget that allows the user to select multiple options from a bottom sheet with checkboxes.
class FidesMultiSelectBottomSheet<T> extends StatelessWidget {
  final String inputLabel;
  final List<T> options;
  final List<T> selectedValues;
  final void Function(List<T>) onSelectionChanged;

  /// How to display the items in the dropdown
  final Widget Function(T) itemLabelBuilder;

  /// How to display the items in the bottom sheet
  final Widget Function(T) itemDisplayBuilder;

  const FidesMultiSelectBottomSheet({
    super.key,
    required this.inputLabel,
    required this.options,
    required this.selectedValues,
    required this.onSelectionChanged,
    required this.itemLabelBuilder,
    required this.itemDisplayBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            // Show bottom sheet when tapped
            final result = await showModalBottomSheet<List<T>>(
              context: context,
              isScrollControlled: true,
              // Allows content to control the height
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                // Open bottom sheet with list of checkboxes
                return _BottomSheetSelector<T>(
                  options: options,
                  initialSelected: selectedValues,
                  itemDisplayBuilder: itemDisplayBuilder,
                );
              },
            );

            // Update selected values if the user made any changes
            if (result != null) {
              onSelectionChanged(result);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                // Display selected values as chips, or a placeholder if none selected
                Expanded(
                  child: selectedValues.isEmpty
                      ? const Text(
                          'Select options',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            // For each selected item, display a chip
                            children: selectedValues
                                .map((item) => Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Chip(
                                        label: itemLabelBuilder(item),
                                        onDeleted: () {
                                          // Remove the selected item when its chip is deleted
                                          final updated = List<T>.from(selectedValues)..remove(item);
                                          onSelectionChanged(updated);
                                        },
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A Stateful widget that creates the bottom sheet with a list of checkboxes.
class _BottomSheetSelector<T> extends StatefulWidget {
  final List<T> options;
  final List<T> initialSelected;
  final Widget Function(T) itemDisplayBuilder;

  const _BottomSheetSelector({
    required this.options,
    required this.initialSelected,
    required this.itemDisplayBuilder,
  });

  @override
  State<_BottomSheetSelector<T>> createState() => _BottomSheetSelectorState<T>();
}

class _BottomSheetSelectorState<T> extends State<_BottomSheetSelector<T>> {
  late List<T> _selected;

  @override
  void initState() {
    super.initState();
    // Initialize the selected list with the values passed into the widget
    _selected = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate max height based on screen height
    final screenHeight = MediaQuery.of(context).size.height;
    // Max height is 50% of screen height
    final maxHeight = screenHeight * 0.7;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 24, left: 16, right: 16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Programs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 12,
                    children: widget.options.map((item) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selected.contains(item)) {
                              _selected.remove(item);
                            } else {
                              _selected.add(item);
                            }
                          });
                        },
                        child: widget.itemDisplayBuilder(item),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, _selected),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
