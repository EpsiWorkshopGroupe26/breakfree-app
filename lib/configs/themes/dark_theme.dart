import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.onestTextTheme().apply(
    bodyColor: const Color(0xFFEEF1F5),
    displayColor: const Color(0xFFEEF1F5),
    decorationColor: const Color(0xFFEEF1F5),
  ),
  scaffoldBackgroundColor: const Color(0xFF150d24),
  cardColor: const Color(0xFF21192F),
  canvasColor: const Color(0xFF21192F),
  splashColor: const Color(0xFF6447AF),
  highlightColor: const Color(0xFF6447AF),
  primaryColor: const Color(0xFFAEE67F),
  primaryColorLight: const Color(0xFFC3E7A5),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFAEE67F),
    onPrimary: Color(0xFF150D24),
    primaryContainer: Color(0xFFAEE67F),
    onPrimaryContainer: Color(0xFF150D24),
    primaryFixed: Color(0xFF9CD96C), // Example color
    primaryFixedDim: Color(0xFFBDECB6), // Example color
    onPrimaryFixed: Color(0xFF203D29), // Example color
    onPrimaryFixedVariant: Color(0xFF4A7745), // Example color
    secondary: Color(0xFF6447AF),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF6447AF),
    onSecondaryContainer: Color(0xFFFFFFFF),
    secondaryFixed: Color(0xFF7C5BC8), // Example color
    secondaryFixedDim: Color(0xFF927AD1), // Example color
    onSecondaryFixed: Color(0xFFEDE7F6), // Example color
    onSecondaryFixedVariant: Color(0xFFD1C4E9), // Example color
    tertiary: Color(0xFFEA852C),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFEA852C),
    onTertiaryContainer: Color(0xFFFFFFFF),
    tertiaryFixed: Color(0xFFF0A564), // Example color
    tertiaryFixedDim: Color(0xFFF6BD8F), // Example color
    onTertiaryFixed: Color(0xFF603D30), // Example color
    onTertiaryFixedVariant: Color(0xFF8C6A55), // Example color
    error: Color(0xFFB71849),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFD9DD),
    onErrorContainer: Color(0xFFB71849),
    surface: Color(0xFF150d24),
    onSurface: Color(0xFFEEF1F5),
    surfaceDim: Color(0xFF231C1C),
    surfaceBright: Color(0xFF1D1925),
    surfaceContainerLowest: Color(0xFF120A20),
    surfaceContainerLow: Color(0xFF1A1A1A),
    surfaceContainer: Color(0xFF21192f),
    surfaceContainerHigh: Color(0xFF251E32),
    surfaceContainerHighest: Color(0xFF2A2436),
    onSurfaceVariant: Color(0xFFEEF1F5),
    outline: Color(0xFF768190),
    outlineVariant: Color(0xFFBDBDBD), // Example color
    shadow: Color(0xFF000000), // Example color
    scrim: Color(0xFF795548), // Example color
    inverseSurface: Color(0xFF303030), // Example color
    onInverseSurface: Color(0xFFF5F5F5), // Example color
    inversePrimary: Color(0xFF00C853), // Example color
    surfaceTint: Color(0xFFAEE67F), // Example color
  ),
);
