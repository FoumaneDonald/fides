import 'package:flutter/material.dart';

final FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24)),
    minimumSize: WidgetStatePropertyAll(const Size.fromHeight(64)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    textStyle: WidgetStateProperty.all<TextStyle>(
      const TextStyle(
        fontFamily: 'Livvic',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
    ),
    // iconColor: WidgetStateProperty.resolveWith<Color>(_changeButtonIconColorWithState),
    iconSize: WidgetStateProperty.all<double>(24),
  ),
);