import 'package:flutter/material.dart';

class MyTheme {
  ///
  /// Light Scheme
  ///
  /// Primary: #735c00
  /// On Primary: #ffffff
  /// Primary Container: #ffe084
  /// On Primary Container: #231b00
  ///
  /// Secondary: #9c4331
  /// On Secondary: #ffffff
  /// Secondary Container: #ffdad3
  /// On Secondary Container: #3e0500
  ///
  /// Tertiary: #7b5800
  /// On Tertiary: #ffffff
  /// Tertiary Container: #ffdea4
  /// On Tertiary Container: #261900
  ///
  /// Error: #ba1a1a
  /// On Error: #ffffff
  /// Error Container: #ffdad6
  /// On Error Container: #410002
  ///
  /// Background: #fffbff
  /// On Background: #251a00
  /// Surface: #fffbff
  /// On Surface: #251a00
  ///
  /// Outline: #7d7667
  /// Surface-Variant: #ebe2cf
  /// On Surface-Variant: #4c4639
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        primary: Color(0xff735c00),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffffe084),
        onPrimaryContainer: Color(0xff231b00),
        secondary: Color(0xff9c4331),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffffdad3),
        onSecondaryContainer: Color(0xff3e0500),
        tertiary: Color(0xff7b5800),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffffdea4),
        onTertiaryContainer: Color(0xff261900),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfffffbff),
        onSurface: Color(0xff251a00),
        outline: Color(0xff7d7667),
        surfaceContainerHighest: Color(0xffebe2cf),
        onSurfaceVariant: Color(0xff4c4639),
        brightness: Brightness.light),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff735c00),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  ///
  /// Dark Scheme
  ///
  /// Primary: #e8c349
  /// On Primary: #3c2f00
  /// Primary Container: #574500
  /// On Primary Container: #ffe084
  ///
  /// Secondary: #ffb4a5
  /// On Secondary: #5e1608
  /// Secondary Container: #7d2c1c
  /// On Secondary Container: #ffdad3
  ///
  /// Tertiary: #f6be48
  /// On Tertiary: #412d00
  /// Tertiary Container: #5d4200
  /// On Tertiary Container: #ffdea4
  ///
  /// Error: #ffb4ab
  /// On Error: #690005
  /// Error Container: #93000a
  /// On Error Container: #ffdad6
  ///
  /// Background: #251a00
  /// On Background: #ffdf9c
  /// Surface: #251a00
  /// On Surface: #ffdf9c
  ///
  /// Outline: #979080
  /// Surface-Variant: #4c4639
  /// On Surface-Variant: #cec6b4
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
        primary: Color(0xffe8c349),
        onPrimary: Color(0xff3c2f00),
        primaryContainer: Color(0xff574500),
        onPrimaryContainer: Color(0xffffe084),
        secondary: Color(0xffffb4a5),
        onSecondary: Color(0xff5e1608),
        secondaryContainer: Color(0xff7d2c1c),
        onSecondaryContainer: Color(0xffffdad3),
        tertiary: Color(0xfff6be48),
        onTertiary: Color(0xff412d00),
        tertiaryContainer: Color(0xff5d4200),
        onTertiaryContainer: Color(0xffffdea4),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surface: Color(0xff251a00),
        onSurface: Color(0xffffdf9c),
        outline: Color(0xff979080),
        surfaceContainerHighest: Color(0xff4c4639),
        onSurfaceVariant: Color(0xffcec6b4),
        brightness: Brightness.dark),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xffe8c349),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
