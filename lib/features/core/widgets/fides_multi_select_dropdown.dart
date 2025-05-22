import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// A widget that allows the user to select multiple options from a bottom sheet with checkboxes.
class FidesMultiSelectBottomSheet<T> extends StatelessWidget {
  final String inputLabel;
  final List<T> options;
  final List<T> selectedValues;
  final String? errorText;
  final bool? hasError;
  final FocusNode focusNode;
  final void Function(List<T>) onSelectionChanged;
  final void Function(bool)? onFocusChange;

  /// How to display the items in the dropdown
  final Widget Function(T) itemChipsLabelBuilder;

  /// How to display the items in the bottom sheet
  final Widget Function(T, [bool isSelected, VoidCallback? onTap]) itemDisplayBuilder;

  const FidesMultiSelectBottomSheet({
    super.key,
    required this.inputLabel,
    required this.options,
    required this.focusNode,
    required this.selectedValues,
    required this.onSelectionChanged,
    required this.itemChipsLabelBuilder,
    required this.itemDisplayBuilder,
    this.onFocusChange,
    this.errorText,
    this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Focus(
          focusNode: focusNode,
          onFocusChange: onFocusChange,
          child: GestureDetector(
            onTap: () async {
              focusNode.requestFocus();
              // Show bottom sheet when tapped
              final List<T>? result = await showModalBottomSheet<List<T>>(
                context: context,
                isScrollControlled: true,
                // Allows content to control the height
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
              height: 56,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
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
                                          label: itemChipsLabelBuilder(item),
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
        ),
        if (hasError ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12.0),
            child: Text(
              errorText!,
              style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
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
  final Widget Function(T, [bool isSelected, VoidCallback? onTap]) itemDisplayBuilder;

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
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Determine column count based on available width
                      final double width = constraints.maxWidth;
                      int columns;

                      if (width >= 1024) {
                        columns = 4; // Desktop
                      } else if (width >= 600) {
                        columns = 3; // Tablet
                      } else {
                        columns = 2; // Mobile
                      }
                      return LayoutGrid(
                        columnSizes: List.generate(columns, (_) => auto),
                        rowSizes: List<TrackSize>.generate((widget.options.length / 2).ceil(), (_) => auto),
                        columnGap: 8,
                        rowGap: 8,
                        autoPlacement: AutoPlacement.rowSparse,
                        children: widget.options.map(
                          (item) {
                            return widget.itemDisplayBuilder(
                              item,
                              _selected.contains(item),
                              () {
                                setState(
                                  () {
                                    if (_selected.contains(item)) {
                                      _selected.remove(item);
                                    } else {
                                      _selected.add(item);
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ).toList(),
                      );
                    },
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
