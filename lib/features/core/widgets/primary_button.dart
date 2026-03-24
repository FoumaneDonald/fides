import 'package:fides/features/core/utilities/app_icon.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

enum AppButtonType { primary, secondary, dual, icon }

class AppButton extends StatelessWidget {
  final bool loading;
  final String? text;
  final String? secondaryText;
  final Widget? icon;
  final Widget? onSecondaryIcon;
  final AppButtonType type;
  final Function()? onPressed;
  final Function()? onSecondaryPressed;

  const AppButton._({
    super.key,
    required this.loading,
    required this.text,
    this.secondaryText,
    required this.icon,
    this.onSecondaryIcon,
    required this.type,
    required this.onPressed,
    this.onSecondaryPressed,
  });

  // Primary
  factory AppButton.primary({
    bool loading = false,
    Widget? icon,
    required String text,
    Function()? onPressed,
  }) {
    return AppButton._(
      loading: loading,
      text: text,
      icon: icon,
      type: AppButtonType.primary,
      onPressed: onPressed,
    );
  }

  // Secondary
  factory AppButton.secondary({
    bool loading = false,
    Widget? icon,
    required String text,
    Function()? onPressed,
  }) {
    return AppButton._(
      loading: loading,
      text: text,
      icon: icon,
      onPressed: onPressed,
      type: AppButtonType.secondary,
    );
  }

  // Dual (outlined + filled look)
  factory AppButton.dual({
    bool loading = false,
    Widget? icon,
    Widget? onSecondaryIcon,
    required String primaryText,
    Function()? onPrimaryPressed,
    Function()? onSecondaryPressed,
  }) {
    return AppButton._(
      loading: loading,
      text: primaryText,
      icon: icon,
      onSecondaryIcon: onSecondaryIcon,
      onPressed: onPrimaryPressed,
      onSecondaryPressed: onSecondaryPressed,
      type: AppButtonType.dual,
    );
  }

  // Icon only
  factory AppButton.icon({
    bool loading = false,
    Widget? icon,
    Function()? onPressed,
  }) {
    return AppButton._(
      loading: loading,
      text: null,
      icon: icon,
      onPressed: onPressed,
      type: AppButtonType.icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildButtonContent(String? text, Widget? icon) {

      return Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) ...{
            const Loader()
          } else ...{
            Text(text ?? ''),
            icon ?? (type == AppButtonType.primary ? AppIcon.arrowRight() : AppIcon.cancel()),
          },
        ],
      );
    }

    // Widget _buildButton(
    //     BuildContext context,
    //     AppButtonType type,
    //     String text,
    //     VoidCallback? onPressed,
    //     )
    // {
    //   final shape = RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   );
    //
    //   final buttonContent = Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       if (loading) ...{
    //         const Loader()
    //       } else ...{
    //         if (type != AppButtonType.icon) ...{
    //           Text(text!),
    //           icon ?? (type == AppButtonType.primary ? AppIcon.arrowRight(size: 18) : AppIcon.cancel(size: 18)),
    //         } else if (type == AppButtonType.icon) ...{
    //           icon!
    //         },
    //       },
    //     ],
    //   );
    //
    //   if(type == AppButtonType.primary){
    //     FilledButton(
    //       onPressed: loading ? null : onPressed,
    //       child: buildButtonContent(text, icon, onPressed),
    //     );
    //   } else if (type == AppButtonType.secondary) {
    //     OutlinedButton(
    //       onPressed: loading ? null : onPressed,
    //       style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
    //         side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Theme.of(context).colorScheme.secondary)),
    //         foregroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.secondary),
    //       ),
    //       child: buildButtonContent(text, icon, onPressed),
    //     );
    //   }
    // }

    Widget primaryButton({
      String? text,
      Widget? icon,
      VoidCallback? onPressed,
    }) =>
        FilledButton(
          onPressed: loading ? null : onPressed,
          child: buildButtonContent(text, icon),
        );

    Widget secondaryButton({
      String? text,
      Widget? icon,
      VoidCallback? onPressed,
    }) =>
        OutlinedButton(
          onPressed: loading ? null : onPressed,
          child: buildButtonContent(text, icon),
        );

    Widget iconButton(
      Widget? icon,
      VoidCallback? onPressed,
    ) =>
        IconButton(onPressed: onPressed, icon: icon ?? AppIcon.circle());

    switch (type) {
      case AppButtonType.primary:
        return primaryButton(text: text!, icon: icon, onPressed: onPressed);

      case AppButtonType.secondary:
        return secondaryButton(text: text!, icon: icon, onPressed: onPressed);

      case AppButtonType.dual:
        return Row(
          spacing: 8,
          children: [
            Expanded(child: secondaryButton(icon: onSecondaryIcon, onPressed: onSecondaryPressed)),
            Expanded(flex: 6, child: primaryButton(text: text!, icon: icon, onPressed: onPressed)),
          ],
        );

      case AppButtonType.icon:
        return iconButton(icon, onPressed);
    }
  }
}
