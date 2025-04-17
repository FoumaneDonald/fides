import 'package:flutter/material.dart';

class InputTheme {
  static DropdownMenuThemeData dropdownDecorationLightTheme = DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(Color(0xffDBDFE3)),
    )
  );

  static InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
    // suffixStyle: MindlabTextTheme.lightTextTheme.bodySmall!.copyWith(color: Colors.grey),
    fillColor: Color(0xffDBDFE3),
    filled: true,
    labelStyle: TextStyle(fontSize: 14, fontFamily: 'Livvic', fontWeight: FontWeight.w600),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(
      color: Color(0xff888888),
      fontFamily: 'Livvic',
      fontSize: 14,
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 16.0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
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
