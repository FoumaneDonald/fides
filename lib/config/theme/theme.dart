import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff744c90),
      surfaceTint: Color(0xff754e92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8e65ab),
      onPrimaryContainer: Color(0xfffffeff),
      secondary: Color(0xff884b65),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdc94b0),
      onSecondaryContainer: Color(0xff622c44),
      tertiary: Color(0xff5d604d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffebedd4),
      onTertiaryContainer: Color(0xff696b57),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff7fd),
      onSurface: Color(0xff1e1a1f),
      onSurfaceVariant: Color(0xff4b444f),
      outline: Color(0xff7d7480),
      outlineVariant: Color(0xffcec3d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f34),
      inversePrimary: Color(0xffe2b6ff),
      primaryFixed: Color(0xfff3daff),
      onPrimaryFixed: Color(0xff2d0349),
      primaryFixedDim: Color(0xffe2b6ff),
      onPrimaryFixedVariant: Color(0xff5c3678),
      secondaryFixed: Color(0xffffd9e5),
      onSecondaryFixed: Color(0xff380921),
      secondaryFixedDim: Color(0xfffdb1ce),
      onSecondaryFixedVariant: Color(0xff6c344d),
      tertiaryFixed: Color(0xffe2e4cc),
      onTertiaryFixed: Color(0xff1a1d0e),
      tertiaryFixedDim: Color(0xffc6c8b1),
      onTertiaryFixedVariant: Color(0xff454836),
      surfaceDim: Color(0xffe0d8de),
      surfaceBright: Color(0xfffff7fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf1f8),
      surfaceContainer: Color(0xfff4ebf2),
      surfaceContainerHigh: Color(0xffeee6ec),
      surfaceContainerHighest: Color(0xffe8e0e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4a2466),
      surfaceTint: Color(0xff754e92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff855ca2),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff59243c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff995a74),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff353827),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6c6f5b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fd),
      onSurface: Color(0xff131015),
      onSurfaceVariant: Color(0xff3b343e),
      outline: Color(0xff57505a),
      outlineVariant: Color(0xff736a75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f34),
      inversePrimary: Color(0xffe2b6ff),
      primaryFixed: Color(0xff855ca2),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6b4487),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff995a74),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7d425b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6c6f5b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff545644),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffccc4cb),
      surfaceBright: Color(0xfffff7fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf1f8),
      surfaceContainer: Color(0xffeee6ec),
      surfaceContainerHigh: Color(0xffe2dae1),
      surfaceContainerHighest: Color(0xffd7cfd6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f195b),
      surfaceTint: Color(0xff754e92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f387b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4c1a32),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f374f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2b2e1d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff484b39),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fd),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff302a33),
      outlineVariant: Color(0xff4e4751),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f34),
      inversePrimary: Color(0xffe2b6ff),
      primaryFixed: Color(0xff5f387b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff462062),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f374f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff542138),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff484b39),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff313423),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbeb7bd),
      surfaceBright: Color(0xfffff7fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7eef5),
      surfaceContainer: Color(0xffe8e0e7),
      surfaceContainerHigh: Color(0xffdad2d9),
      surfaceContainerHighest: Color(0xffccc4cb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe2b6ff),
      surfaceTint: Color(0xffe2b6ff),
      onPrimary: Color(0xff441e60),
      primaryContainer: Color(0xff8e65ab),
      onPrimaryContainer: Color(0xfffffeff),
      secondary: Color(0xfffdb1ce),
      onSecondary: Color(0xff521e36),
      secondaryContainer: Color(0xffdc94b0),
      onSecondaryContainer: Color(0xff622c44),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff2f3221),
      tertiaryContainer: Color(0xffe2e4cc),
      onTertiaryContainer: Color(0xff636652),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151217),
      onSurface: Color(0xffe8e0e7),
      onSurfaceVariant: Color(0xffcec3d0),
      outline: Color(0xff978e99),
      outlineVariant: Color(0xff4b444f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e0e7),
      inversePrimary: Color(0xff754e92),
      primaryFixed: Color(0xfff3daff),
      onPrimaryFixed: Color(0xff2d0349),
      primaryFixedDim: Color(0xffe2b6ff),
      onPrimaryFixedVariant: Color(0xff5c3678),
      secondaryFixed: Color(0xffffd9e5),
      onSecondaryFixed: Color(0xff380921),
      secondaryFixedDim: Color(0xfffdb1ce),
      onSecondaryFixedVariant: Color(0xff6c344d),
      tertiaryFixed: Color(0xffe2e4cc),
      onTertiaryFixed: Color(0xff1a1d0e),
      tertiaryFixedDim: Color(0xffc6c8b1),
      onTertiaryFixedVariant: Color(0xff454836),
      surfaceDim: Color(0xff151217),
      surfaceBright: Color(0xff3c383d),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1e1a1f),
      surfaceContainer: Color(0xff221e23),
      surfaceContainerHigh: Color(0xff2c292e),
      surfaceContainerHighest: Color(0xff373339),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffefd2ff),
      surfaceTint: Color(0xffe2b6ff),
      onPrimary: Color(0xff381154),
      primaryContainer: Color(0xffaa80c8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd0e0),
      onSecondary: Color(0xff44132b),
      secondaryContainer: Color(0xffdc94b0),
      onSecondaryContainer: Color(0xff3b0c23),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff2f3221),
      tertiaryContainer: Color(0xffe2e4cc),
      onTertiaryContainer: Color(0xff474a37),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151217),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe4d9e6),
      outline: Color(0xffb9afbb),
      outlineVariant: Color(0xff978d99),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e0e7),
      inversePrimary: Color(0xff5d3779),
      primaryFixed: Color(0xfff3daff),
      onPrimaryFixed: Color(0xff1f0036),
      primaryFixedDim: Color(0xffe2b6ff),
      onPrimaryFixedVariant: Color(0xff4a2466),
      secondaryFixed: Color(0xffffd9e5),
      onSecondaryFixed: Color(0xff2a0116),
      secondaryFixedDim: Color(0xfffdb1ce),
      onSecondaryFixedVariant: Color(0xff59243c),
      tertiaryFixed: Color(0xffe2e4cc),
      onTertiaryFixed: Color(0xff101205),
      tertiaryFixedDim: Color(0xffc6c8b1),
      onTertiaryFixedVariant: Color(0xff353827),
      surfaceDim: Color(0xff151217),
      surfaceBright: Color(0xff474348),
      surfaceContainerLowest: Color(0xff09070a),
      surfaceContainerLow: Color(0xff201c21),
      surfaceContainer: Color(0xff2a272c),
      surfaceContainerHigh: Color(0xff353136),
      surfaceContainerHighest: Color(0xff403c41),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbebff),
      surfaceTint: Color(0xffe2b6ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdfb1fd),
      onPrimaryContainer: Color(0xff170029),
      secondary: Color(0xffffebf0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfff9adca),
      onSecondaryContainer: Color(0xff20000f),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe2e4cc),
      onTertiaryContainer: Color(0xff292b1b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff151217),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff8ecfa),
      outlineVariant: Color(0xffcabfcc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e0e7),
      inversePrimary: Color(0xff5d3779),
      primaryFixed: Color(0xfff3daff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe2b6ff),
      onPrimaryFixedVariant: Color(0xff1f0036),
      secondaryFixed: Color(0xffffd9e5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfffdb1ce),
      onSecondaryFixedVariant: Color(0xff2a0116),
      tertiaryFixed: Color(0xffe2e4cc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc6c8b1),
      onTertiaryFixedVariant: Color(0xff101205),
      surfaceDim: Color(0xff151217),
      surfaceBright: Color(0xff534e54),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff221e23),
      surfaceContainer: Color(0xff332f34),
      surfaceContainerHigh: Color(0xff3e3a3f),
      surfaceContainerHighest: Color(0xff4a454b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        fontFamily: 'Livvic',
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
