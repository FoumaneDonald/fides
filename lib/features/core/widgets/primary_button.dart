import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;
  final bool isActive;
  final String text;
  final Widget? icon;

  const PrimaryButton({super.key, this.onPressed, required this.text, this.loading = false, this.isActive = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : FilledButton(
            onPressed: isActive ? onPressed : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                icon ?? AppIcon.arrowRight(),
              ],
            ),
          );
  }
}
