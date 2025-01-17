import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.baloo2().fontFamily,
  textTheme: GoogleFonts.baloo2TextTheme().apply(
    bodyColor: const Color(0xFF211817),
    displayColor: const Color(0xFF211817),
  ),
  scaffoldBackgroundColor: const Color(0xFFF9EBDF),
  cardColor: const Color(0xFFFFFFFF),
  canvasColor: const Color(0xFFFFFFFF),
  splashColor: const Color(0xFF264653),
  highlightColor: const Color(0xFF264653),
  primaryColor: const Color(0xFF264653),
  primaryColorLight: const Color(0xFFB5B3F2),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF264653),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFB5B3F2),
    onPrimaryContainer: Color(0xFF211817),
    primaryFixed: Color(0xFFB5B3F2),
    primaryFixedDim: Color(0xFFB5B3F2),
    onPrimaryFixed: Color(0xFF211817),
    onPrimaryFixedVariant: Color(0xFF211817),
    secondary: Color(0xFFB5B3F2),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFB5B3F2),
    onSecondaryContainer: Color(0xFF211817),
    secondaryFixed: Color(0xFFB5B3F2),
    secondaryFixedDim: Color(0xFFB5B3F2),
    onSecondaryFixed: Color(0xFF211817),
    onSecondaryFixedVariant: Color(0xFF211817),
    tertiary: Color(0xFFF07167),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFF07167),
    onTertiaryContainer: Color(0xFFFFFFFF),
    tertiaryFixed: Color(0xFFF07167),
    tertiaryFixedDim: Color(0xFFF07167),
    onTertiaryFixed: Color(0xFFFFFFFF),
    onTertiaryFixedVariant: Color(0xFFFFFFFF),
    error: Color(0xFFF07167),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFD9DD),
    onErrorContainer: Color(0xFFF07167),
    surface: Color(0xFFF9EBDF),
    onSurface: Color(0xFF211817),
    surfaceDim: Color(0xFFF9EBDF),
    surfaceBright: Color(0xFFFFFFFF),
    surfaceContainerLowest: Color(0xFFE0E0E0),
    surfaceContainerLow: Color(0xFFCCCCCC),
    surfaceContainer: Color(0xFFEDDACA),
    surfaceContainerHigh: Color(0xFF999999),
    surfaceContainerHighest: Color(0xFF808080),
    onSurfaceVariant: Color(0xFF211817),
    outline: Color(0xFF3B5864),
    outlineVariant: Color(0xFFBDBDBD),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF795548),
    inverseSurface: Color(0xFF303030),
    onInverseSurface: Color(0xFFF5F5F5),
    inversePrimary: Color(0xFF264653),
    surfaceTint: Color(0xFF264653),
  ),
);
