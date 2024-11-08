import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283718290),
      surfaceTint: Color(4283718290),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292927743),
      onPrimaryContainer: Color(4279178571),
      secondary: Color(4284243314),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292993273),
      onSecondaryContainer: Color(4279769644),
      tertiary: Color(4286075755),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957039),
      onTertiaryContainer: Color(4281209126),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282795599),
      outline: Color(4286019200),
      outlineVariant: Color(4291282384),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290626303),
      primaryFixed: Color(4292927743),
      onPrimaryFixed: Color(4279178571),
      primaryFixedDim: Color(4290626303),
      onPrimaryFixedVariant: Color(4282139257),
      secondaryFixed: Color(4292993273),
      onSecondaryFixed: Color(4279769644),
      secondaryFixedDim: Color(4291085533),
      onSecondaryFixedVariant: Color(4282664281),
      tertiaryFixed: Color(4294957039),
      onTertiaryFixed: Color(4281209126),
      tertiaryFixedDim: Color(4293376470),
      onTertiaryFixedVariant: Color(4284365907),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281876084),
      surfaceTint: Color(4283718290),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285165738),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282401109),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285690761),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284102735),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287654274),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282532427),
      outline: Color(4284440167),
      outlineVariant: Color(4286216835),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290626303),
      primaryFixed: Color(4285165738),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283586447),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285690761),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284045935),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287654274),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285878633),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279639122),
      surfaceTint: Color(4283718290),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281876084),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280230195),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282401109),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281669677),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284102735),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280492843),
      outline: Color(4282532427),
      outlineVariant: Color(4282532427),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4293651199),
      primaryFixed: Color(4281876084),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280428381),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282401109),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280953662),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284102735),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282458680),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290626303),
      surfaceTint: Color(4290626303),
      onPrimary: Color(4280626017),
      primaryContainer: Color(4282139257),
      onPrimaryContainer: Color(4292927743),
      secondary: Color(4291085533),
      onSecondary: Color(4281151298),
      secondaryContainer: Color(4282664281),
      onSecondaryContainer: Color(4292993273),
      tertiary: Color(4293376470),
      onTertiary: Color(4282721852),
      tertiaryContainer: Color(4284365907),
      onTertiaryContainer: Color(4294957039),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279440152),
      onSurface: Color(4293190121),
      onSurfaceVariant: Color(4291282384),
      outline: Color(4287729818),
      outlineVariant: Color(4282795599),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4283718290),
      primaryFixed: Color(4292927743),
      onPrimaryFixed: Color(4279178571),
      primaryFixedDim: Color(4290626303),
      onPrimaryFixedVariant: Color(4282139257),
      secondaryFixed: Color(4292993273),
      onSecondaryFixed: Color(4279769644),
      secondaryFixedDim: Color(4291085533),
      onSecondaryFixedVariant: Color(4282664281),
      tertiaryFixed: Color(4294957039),
      onTertiaryFixed: Color(4281209126),
      tertiaryFixedDim: Color(4293376470),
      onTertiaryFixedVariant: Color(4284365907),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290955263),
      surfaceTint: Color(4290626303),
      onPrimary: Color(4278783558),
      primaryContainer: Color(4287073480),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291414497),
      onSecondary: Color(4279440678),
      secondaryContainer: Color(4287532966),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293639898),
      onTertiary: Color(4280814625),
      tertiaryContainer: Color(4289627551),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440152),
      onSurface: Color(4294834687),
      onSurfaceVariant: Color(4291545556),
      outline: Color(4288914092),
      outlineVariant: Color(4286808716),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4282270586),
      primaryFixed: Color(4292927743),
      onPrimaryFixed: Color(4278388545),
      primaryFixedDim: Color(4290626303),
      onPrimaryFixedVariant: Color(4281020775),
      secondaryFixed: Color(4292993273),
      onSecondaryFixed: Color(4279111713),
      secondaryFixedDim: Color(4291085533),
      onSecondaryFixedVariant: Color(4281546056),
      tertiaryFixed: Color(4294957039),
      onTertiaryFixed: Color(4280420123),
      tertiaryFixedDim: Color(4293376470),
      onTertiaryFixedVariant: Color(4283182146),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834687),
      surfaceTint: Color(4290626303),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290955263),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834687),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291414497),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293639898),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440152),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294834687),
      outline: Color(4291545556),
      outlineVariant: Color(4291545556),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4280231002),
      primaryFixed: Color(4293256703),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290955263),
      onPrimaryFixedVariant: Color(4278783558),
      secondaryFixed: Color(4293256702),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291414497),
      onSecondaryFixedVariant: Color(4279440678),
      tertiaryFixed: Color(4294958832),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293639898),
      onTertiaryFixedVariant: Color(4280814625),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
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
