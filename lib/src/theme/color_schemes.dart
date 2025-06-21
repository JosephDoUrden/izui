import 'package:flutter/material.dart';

/// Futuristic color schemes for IzUI
class IzColorSchemes {
  // Neon Colors
  static const Color neonBlue = Color(0xFF00E5FF);
  static const Color neonPink = Color(0xFFFF0080);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color neonPurple = Color(0xFFBC13FE);
  static const Color neonOrange = Color(0xFFFF6600);
  static const Color neonYellow = Color(0xFFFFFF00);
  static const Color neonCyan = Color(0xFF00FFFF);

  // Dark Theme Colors
  static const Color darkBg = Color(0xFF0A0A0F);
  static const Color darkSurface = Color(0xFF1A1A2E);
  static const Color darkContainer = Color(0xFF16213E);
  static const Color darkBorder = Color(0xFF2A2A40);
  static const Color darkText = Color(0xFFE0E0E0);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
  static const Color darkTextDisabled = Color(0xFF606060);

  // Light Theme Colors (Optional)
  static const Color lightBg = Color(0xFFF8F9FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightContainer = Color(0xFFF1F3F4);
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightText = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF666666);
  static const Color lightTextDisabled = Color(0xFFCCCCCC);

  // Glass Effect Colors
  static const Color glassOverlay = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x4DFFFFFF);
  static const Color glassDropShadow = Color(0x33000000);

  // Status Colors
  static const Color success = Color(0xFF00C851);
  static const Color warning = Color(0xFFFFBB33);
  static const Color error = Color(0xFFFF4444);
  static const Color info = Color(0xFF33B5E5);

  /// Dark color scheme optimized for futuristic UI
  static ColorScheme get darkScheme => const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: neonBlue,
        onPrimary: darkBg,
        primaryContainer: darkContainer,
        onPrimaryContainer: neonBlue,
        secondary: neonPurple,
        onSecondary: darkBg,
        secondaryContainer: darkContainer,
        onSecondaryContainer: neonPurple,
        tertiary: neonGreen,
        onTertiary: darkBg,
        tertiaryContainer: darkContainer,
        onTertiaryContainer: neonGreen,
        error: error,
        onError: darkBg,
        errorContainer: darkContainer,
        onErrorContainer: error,
        background: darkBg,
        onBackground: darkText,
        surface: darkSurface,
        onSurface: darkText,
        surfaceVariant: darkContainer,
        onSurfaceVariant: darkTextSecondary,
        outline: darkBorder,
        outlineVariant: Color(0xFF3A3A50),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: lightSurface,
        onInverseSurface: lightText,
        inversePrimary: neonBlue,
        surfaceTint: neonBlue,
      );

  /// Light color scheme (optional support)
  static ColorScheme get lightScheme => const ColorScheme.light(
        brightness: Brightness.light,
        primary: neonBlue,
        onPrimary: lightBg,
        primaryContainer: lightContainer,
        onPrimaryContainer: neonBlue,
        secondary: neonPurple,
        onSecondary: lightBg,
        secondaryContainer: lightContainer,
        onSecondaryContainer: neonPurple,
        tertiary: neonGreen,
        onTertiary: lightBg,
        tertiaryContainer: lightContainer,
        onTertiaryContainer: neonGreen,
        error: error,
        onError: lightBg,
        errorContainer: lightContainer,
        onErrorContainer: error,
        background: lightBg,
        onBackground: lightText,
        surface: lightSurface,
        onSurface: lightText,
        surfaceVariant: lightContainer,
        onSurfaceVariant: lightTextSecondary,
        outline: lightBorder,
        outlineVariant: Color(0xFFD0D0D0),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: darkSurface,
        onInverseSurface: darkText,
        inversePrimary: neonBlue,
        surfaceTint: neonBlue,
      );

  /// Predefined neon color palettes
  static const List<Color> neonPalette = [
    neonBlue,
    neonPink,
    neonGreen,
    neonPurple,
    neonOrange,
    neonYellow,
    neonCyan,
  ];

  /// Get a neon color by index
  static Color getNeonColor(int index) {
    return neonPalette[index % neonPalette.length];
  }

  /// Create a glow color from a base color
  static Color createGlow(Color color, {double opacity = 0.8}) {
    return color.withOpacity(opacity);
  }

  /// Create a glass effect color
  static Color createGlass(Color color, {double opacity = 0.1}) {
    return color.withOpacity(opacity);
  }
}
