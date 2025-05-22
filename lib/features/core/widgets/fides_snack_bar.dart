import 'package:flutter/material.dart';

class MindLabSnackBar {
  static void error(BuildContext context, String message) {
    _showSnackBar(context, message, backgroundColor: Theme.of(context).colorScheme.error);
  }

  static void success(BuildContext context, String message) {
    _showSnackBar(context, message, backgroundColor: Theme.of(context).colorScheme.onSurface);
  }

  static void normal(BuildContext context, String message) {
    _showSnackBar(context, message);
  }

  static void _showSnackBar(
    BuildContext context,
    String content, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 6),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(content),
          width: MediaQuery.of(context).size.width - 16,
          behavior: SnackBarBehavior.floating,
          duration: duration,
        ),
      );
  }
}
