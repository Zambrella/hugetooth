import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/theme/page_transitions.dart';
import 'package:flutter_starter_template/theme/theme_extensions.dart';

class ColorTokens {
  ColorTokens._();

  static const Color primaryColor = Colors.teal;
  static const Color accentColor = Colors.orangeAccent;
}

class AppTheme {
  AppTheme._();

  static final ThemeData _commonThemeData = ThemeData(
    useMaterial3: true,
    extensions: const <ThemeExtension<dynamic>>[
      SpacingTheme(),
      ModalTheme(),
      DurationTheme(),
      RadiusTheme(),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: NoTransitionBuilder(),
      },
    ),
  );

  static final ThemeData lightThemeData = _commonThemeData.copyWith(
    colorScheme: AppTheme.lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surface,
    textTheme: _commonThemeData.textTheme.apply(
      bodyColor: lightColorScheme.onSurface,
      displayColor: lightColorScheme.onSurface,
    ),
    // For some reason I canont type this list as List<ThemeExtension<dynamic>> as it will throw an error.
    extensions: [
      ..._commonThemeData.extensions.values,
      SemanticColorsTheme(
        error: Colors.red.harmonizeWith(lightColorScheme.error),
        warning: Colors.orange.harmonizeWith(lightColorScheme.primary),
        success: Colors.green.harmonizeWith(lightColorScheme.primary),
        info: Colors.blue.harmonizeWith(lightColorScheme.primary),
      ),
    ],
  );

  static final ThemeData hcLightThemeData = _commonThemeData.copyWith(
    colorScheme: AppTheme.lightHcColorScheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _commonThemeData.textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    extensions: [
      ..._commonThemeData.extensions.values,
      SemanticColorsTheme(
        error: Colors.red.harmonizeWith(lightColorScheme.error),
        warning: Colors.orange.harmonizeWith(lightColorScheme.primary),
        success: Colors.green.harmonizeWith(lightColorScheme.primary),
        info: Colors.blue.harmonizeWith(lightColorScheme.primary),
      ),
    ],
  );

  static final ThemeData darkThemeData = _commonThemeData.copyWith(
    brightness: Brightness.dark,
    colorScheme: AppTheme.darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.surface,
    textTheme: _commonThemeData.textTheme.apply(
      bodyColor: darkColorScheme.onSurface,
      displayColor: darkColorScheme.onSurface,
    ),
    extensions: [
      ..._commonThemeData.extensions.values,
      SemanticColorsTheme(
        error: Colors.red.harmonizeWith(darkColorScheme.error),
        warning: Colors.orange.harmonizeWith(darkColorScheme.primary),
        success: Colors.green.harmonizeWith(darkColorScheme.primary),
        info: Colors.blue.harmonizeWith(darkColorScheme.primary),
      ),
    ],
  );

  static final ThemeData hcDarkThemeData = _commonThemeData.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: _commonThemeData.textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    extensions: [
      ..._commonThemeData.extensions.values,
      SemanticColorsTheme(
        error: Colors.red.harmonizeWith(darkColorScheme.error),
        warning: Colors.orange.harmonizeWith(darkColorScheme.primary),
        success: Colors.green.harmonizeWith(darkColorScheme.primary),
        info: Colors.blue.harmonizeWith(darkColorScheme.primary),
      ),
    ],
  );

  static final ColorScheme lightColorScheme = SeedColorScheme.fromSeeds(
    primaryKey: ColorTokens.primaryColor,
    // Lock primary to brand main
    primary: ColorTokens.primaryColor,
    // You can add optional own seeds for secondary and tertiary key colors. Here we only use tertiary and let secondary
    // be computed and related to primary, as it is by default in the M3 color system.
    tertiaryKey: ColorTokens.accentColor,
    // Lock tertiary to brand accent
    tertiary: ColorTokens.accentColor,
    // Tone chroma config and tone mapping is optional if you do not add it. You get the config matching Flutter's Material 3
    // ColorScheme.fromSeed. Here, we use strategy that uses the chroma from our provided seeds and is less aggressive on primary tint
    // on the surface colors. There are many other predefined tone strategies available used to make the tonal palettes,
    // and you can also define your own FlexTones class to customize it.
    tones: FlexTones.material(Brightness.light),
  );

  static final ColorScheme lightHcColorScheme = SeedColorScheme.fromSeeds(
    primaryKey: ColorTokens.primaryColor,
    primary: ColorTokens.primaryColor,
    tertiaryKey: ColorTokens.accentColor,
    tertiary: ColorTokens.accentColor,
    tones: FlexTones.highContrast(Brightness.light),
  );

  static final ColorScheme darkColorScheme = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: ColorTokens.primaryColor,
    primary: ColorTokens.primaryColor,
    tertiaryKey: ColorTokens.accentColor,
    tertiary: ColorTokens.accentColor,
    tones: FlexTones.material(Brightness.dark),
  );

  static final ColorScheme darkHcColorScheme = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: ColorTokens.primaryColor,
    primary: ColorTokens.primaryColor,
    tertiaryKey: ColorTokens.accentColor,
    tertiary: ColorTokens.accentColor,
    tones: FlexTones.highContrast(Brightness.dark),
  );
}
