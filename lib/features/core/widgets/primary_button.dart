import 'package:flutter/material.dart';

import 'loader.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;
  final String text;
  final IconData? icon;

  const PrimaryButton({super.key, this.onPressed, required this.text, this.loading = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : FilledButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Icon(icon ?? Icons.keyboard_arrow_right_rounded),
              ],
            ),
          );
  }
}
