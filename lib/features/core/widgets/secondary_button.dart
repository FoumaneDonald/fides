import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;
  final String text;

  const SecondaryButton({super.key, required this.text, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          SizedBox(width: 16),
          Icon(Icons.keyboard_arrow_right_rounded),
        ],
      ),
    );
  }
}
