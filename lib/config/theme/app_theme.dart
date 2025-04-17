import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'input_theme.dart';

final _buttonStyle = WidgetStateProperty.all<TextStyle>(
  const TextStyle(
    fontFamily: 'Livvic',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
  ),
);

abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    fontFamily: 'Livvic',
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF006A64),
      primaryContainer: Color(0xFF9DF2E9),
      secondary: Color(0xFF8E4D2E),
      secondaryContainer: Color(0xFFFFDBCC),
      tertiary: Color(0xFF606219),
      tertiaryContainer: Color(0xFFE6E890),
      appBarColor: Color(0xFFFFDBCC),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    // Input color modifiers.
    useMaterial3ErrorColors: true,
    swapLegacyOnMaterial3: true,
    // Surface color adjustments.
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 12,
    // Component theme configurations for light mode.
    subThemesData: FlexSubThemesData(
      blendOnLevel: 4,
      blendOnColors: true,
      useMaterial3Typography: true,
      adaptiveInputDecoratorRadius: FlexAdaptive.all(),
      buttonMinSize: Size.fromHeight(56),
      textButtonTextStyle: _buttonStyle,
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      filledButtonSchemeColor: SchemeColor.primaryContainer,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      toggleButtonsRadius: 4.0,
      segmentedButtonRadius: 4.0,
      segmentedButtonSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: false,
      fabUseShape: true,
      chipSelectedSchemeColor: SchemeColor.primaryContainer,
      chipSecondarySelectedSchemeColor: SchemeColor.primaryContainer,
      cardRadius: 16.0,
      alignedDropdown: true,
      tooltipRadius: 4,
      dialogRadius: 16.0,
      snackBarRadius: 8,
      snackBarElevation: 6,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      tabBarDividerColor: Color(0x00000000),
      drawerIndicatorSchemeColor: SchemeColor.primaryContainer,
      bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onSurfaceVariant,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSurfaceVariant,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationBarMutedUnselectedLabel: true,
      navigationBarMutedUnselectedIcon: true,
      navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
      navigationBarIndicatorRadius: 8.0,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      navigationBarSelectedLabelSize: 16,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.primaryContainer,
      navigationRailIndicatorRadius: 5.0,
      navigationRailLabelType: NavigationRailLabelType.all,
      navigationRailMinWidth: 88,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    fontFamily: 'Livvic',
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF81D5CD),
      primaryContainer: Color(0xFF00504B),
      primaryLightRef: Color(0xFF006A64),
      // The color of light mode primary
      secondary: Color(0xFFFFB694),
      secondaryContainer: Color(0xFF713719),
      secondaryLightRef: Color(0xFF8E4D2E),
      // The color of light mode secondary
      tertiary: Color(0xFFC9CB77),
      tertiaryContainer: Color(0xFF484A00),
      tertiaryLightRef: Color(0xFF606219),
      // The color of light mode tertiary
      appBarColor: Color(0xFFFFDBCC),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    // Input color modifiers.
    useMaterial3ErrorColors: true,
    swapLegacyOnMaterial3: true,
    // Surface color adjustments.
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 12,
    // Component theme configurations for dark mode.
    subThemesData: FlexSubThemesData(
      blendOnLevel: 6,
      blendOnColors: true,
      useMaterial3Typography: true,
      adaptiveInputDecoratorRadius: const FlexAdaptive.all(),
      buttonMinSize: const Size.fromHeight(56),
      textButtonTextStyle: _buttonStyle,
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      filledButtonSchemeColor: SchemeColor.primaryContainer,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      toggleButtonsRadius: 4.0,
      segmentedButtonRadius: 4.0,
      segmentedButtonSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: false,
      fabUseShape: true,
      chipSelectedSchemeColor: SchemeColor.primaryContainer,
      chipSecondarySelectedSchemeColor: SchemeColor.primaryContainer,
      cardRadius: 16.0,
      alignedDropdown: true,
      tooltipRadius: 4,
      dialogRadius: 16.0,
      snackBarRadius: 8,
      snackBarElevation: 6,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      tabBarDividerColor: const Color(0x00000000),
      drawerIndicatorSchemeColor: SchemeColor.primaryContainer,
      bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onSurfaceVariant,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSurfaceVariant,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationBarMutedUnselectedLabel: true,
      navigationBarMutedUnselectedIcon: true,
      navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
      navigationBarIndicatorRadius: 8.0,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      navigationBarSelectedLabelSize: 16,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.primaryContainer,
      navigationRailIndicatorRadius: 5.0,
      navigationRailLabelType: NavigationRailLabelType.all,
      navigationRailMinWidth: 88,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
