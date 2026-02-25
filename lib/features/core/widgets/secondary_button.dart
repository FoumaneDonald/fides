import 'package:flutter/material.dart';

import 'loader.dart';

class SecondaryButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;
  final String text;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Icon(Icons.keyboard_arrow_right_rounded),
              ],
            ),
          );
  }
}
