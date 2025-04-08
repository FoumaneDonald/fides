import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;

  const PrimaryButton({super.key, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : FilledButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Continue'),
                Icon(Icons.keyboard_arrow_right_rounded),
              ],
            ),
          );
  }
}
