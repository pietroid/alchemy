import 'package:alchimia_thematics/src/alchimia_colors.dart';
import 'package:flutter/material.dart';

/// Provides the global [ThemeData] for Alchimia.
abstract final class AlchimiaTheme {
  static ThemeData get data => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Menlo',
        scaffoldBackgroundColor: AlchimiaColors.background,
        colorScheme: const ColorScheme.dark(
          surface: AlchimiaColors.background,
          onSurface: AlchimiaColors.cream,
          outline: AlchimiaColors.border,
          // Panel background (sidebars, drawers).
          surfaceContainer: AlchimiaColors.panel,
          // Subdued foreground text and icons.
          onSurfaceVariant: AlchimiaColors.dimText,
          // Primary interactive / accent color.
          primary: AlchimiaColors.accent,
          // Subtle border inside panels and cards.
          outlineVariant: AlchimiaColors.panelBorder,
          // Wire stroke for circuit table connections.
          tertiaryContainer: AlchimiaColors.wire,
          onTertiaryContainer: AlchimiaColors.wireHighlight,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AlchimiaColors.panel,
          foregroundColor: AlchimiaColors.cream,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AlchimiaColors.dimText,
            fontFamily: 'Menlo',
          ),
          // Coding-style label for circuit component port names and headers.
          labelSmall: TextStyle(
            color: AlchimiaColors.dimText,
            fontSize: 9,
            letterSpacing: 0.5,
          ),
        ),
      );
}
