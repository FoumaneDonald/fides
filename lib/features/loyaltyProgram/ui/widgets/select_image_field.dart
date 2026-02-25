import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../core/utilities/app_icon.dart';

class SelectImageField extends StatefulWidget {
  final String label;
  final FormFieldSetter<File?>? onSaved;
  final FormFieldValidator<File?>? validator;
  final File? initialValue;
  final ValueChanged<File?>? onChanged;


  const SelectImageField({
    super.key,
    required this.label,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<SelectImageField> createState() => _SelectImageFieldState();
}

class _SelectImageFieldState extends State<SelectImageField> {
  File? _tempImage;

  @override
  void initState() {
    super.initState();
    _tempImage = widget.initialValue;
  }

  void pickImage(FormFieldState<File?> state) async {
    final imagePicker = ImagePicker();
    try {
      final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() => _tempImage = File(pickedFile.path));
        state.didChange(_tempImage);
        widget.onChanged?.call(_tempImage);
      }
    } catch (e) {
      print(e);
    }
  }
  void deleteImage(FormFieldState<File?> state) {
    setState(() => _tempImage = null);
    state.didChange(null);
    widget.onChanged?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<File?>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      builder: (state) {
        late Color borderColor;

        if (state.hasError) {
          borderColor = Theme.of(context).colorScheme.error;
        } else {
          borderColor = Theme.of(context).colorScheme.outline;
        }

        return Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.label, style: Theme.of(context).textTheme.labelLarge),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: _tempImage == null
                      ? IconButton(onPressed: () => pickImage(state), icon: AppIcon.addImage())
                      : Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  _tempImage!,
                                  fit: BoxFit.contain,
                                  height: MediaQuery.heightOf(context) * 0.2,
                                ),
                              ),
                            ),
                            IconButton(onPressed: () => deleteImage(state), icon: AppIcon.cancel())
                          ],
                        ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  state.errorText!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
          ],
        );
      },
    );
  }
}
