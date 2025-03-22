import 'package:flutter/material.dart';

class InputTheme {

  static InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
    // suffixStyle: MindlabTextTheme.lightTextTheme.bodySmall!.copyWith(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 21.0,
      horizontal: 16.0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        // color: MindlabColorTheme.lightColorScheme.secondary,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        // color: MindlabColorTheme.lightColorScheme.error,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        // color: MindlabColorTheme.lightColorScheme.primary,
        width: 2.0,
      ),
    ),
  );
}