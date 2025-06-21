import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'typography.dart';
import '../constants/dimensions.dart';

/// Main theme system for IzUI
class IzTheme {
  /// Create a complete dark theme
  static ThemeData darkTheme({
    Color? primaryColor,
    String? fontFamily,
  }) {
    final colorScheme = IzColorSchemes.darkScheme.copyWith(
      primary: primaryColor ?? IzColorSchemes.neonBlue,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: IzTypography.textTheme,
      fontFamily: fontFamily,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: IzColorSchemes.darkSurface,
        foregroundColor: IzColorSchemes.darkText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: IzTypography.titleLarge.copyWith(
          color: IzColorSchemes.darkText,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: IzColorSchemes.darkSurface,
        elevation: 8,
        shadowColor: IzColorSchemes.glassDropShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          side: const BorderSide(
            color: IzColorSchemes.glassBorder,
            width: 1,
          ),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: IzColorSchemes.neonBlue,
          foregroundColor: IzColorSchemes.darkBg,
          elevation: 0,
          shadowColor: IzColorSchemes.neonBlue.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          ),
          minimumSize: const Size(
            IzDimensions.minButtonWidth,
            IzDimensions.buttonHeightMd,
          ),
          textStyle: IzTypography.buttonTextStyle(IzTypography.labelLarge),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: IzColorSchemes.neonBlue,
          side: const BorderSide(
            color: IzColorSchemes.neonBlue,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          ),
          minimumSize: const Size(
            IzDimensions.minButtonWidth,
            IzDimensions.buttonHeightMd,
          ),
          textStyle: IzTypography.buttonTextStyle(IzTypography.labelLarge),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: IzColorSchemes.darkContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          borderSide: const BorderSide(
            color: IzColorSchemes.darkBorder,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          borderSide: const BorderSide(
            color: IzColorSchemes.darkBorder,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          borderSide: const BorderSide(
            color: IzColorSchemes.neonBlue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
          borderSide: const BorderSide(
            color: IzColorSchemes.error,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: IzDimensions.spacingMd,
          vertical: IzDimensions.spacingMd,
        ),
        labelStyle: IzTypography.labelMedium.copyWith(
          color: IzColorSchemes.darkTextSecondary,
        ),
        hintStyle: IzTypography.bodyMedium.copyWith(
          color: IzColorSchemes.darkTextDisabled,
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: IzColorSchemes.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusXl),
          side: const BorderSide(
            color: IzColorSchemes.glassBorder,
            width: 1,
          ),
        ),
        titleTextStyle: IzTypography.titleLarge.copyWith(
          color: IzColorSchemes.darkText,
        ),
        contentTextStyle: IzTypography.bodyMedium.copyWith(
          color: IzColorSchemes.darkTextSecondary,
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: IzColorSchemes.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(IzDimensions.radiusXl),
          ),
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarTheme(
        labelColor: IzColorSchemes.neonBlue,
        unselectedLabelColor: IzColorSchemes.darkTextSecondary,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: IzColorSchemes.neonBlue,
            width: 2,
          ),
        ),
        labelStyle: IzTypography.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: IzTypography.labelLarge,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: IzColorSchemes.neonBlue,
        foregroundColor: IzColorSchemes.darkBg,
        elevation: 8,
        shape: CircleBorder(),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IzColorSchemes.neonBlue;
          }
          return IzColorSchemes.darkTextDisabled;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IzColorSchemes.neonBlue.withOpacity(0.3);
          }
          return IzColorSchemes.darkBorder;
        }),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IzColorSchemes.neonBlue;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(IzColorSchemes.darkBg),
        side: const BorderSide(
          color: IzColorSchemes.darkBorder,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusSm),
        ),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IzColorSchemes.neonBlue;
          }
          return IzColorSchemes.darkBorder;
        }),
      ),
    );
  }

  /// Create a complete light theme (optional)
  static ThemeData lightTheme({
    Color? primaryColor,
    String? fontFamily,
  }) {
    final colorScheme = IzColorSchemes.lightScheme.copyWith(
      primary: primaryColor ?? IzColorSchemes.neonBlue,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: IzTypography.textTheme,
      fontFamily: fontFamily,
      // Add light theme customizations here
      // For brevity, using similar structure as dark theme
      // but with light colors
    );
  }

  /// Create custom component themes
  static IzComponentThemes get componentThemes => const IzComponentThemes();

  /// Get glow box shadow
  static List<BoxShadow> glowShadow(Color color, {double opacity = 0.8}) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity * 0.6),
        blurRadius: IzDimensions.neonBlurRadius,
        spreadRadius: IzDimensions.neonSpreadRadius,
        offset: const Offset(0, 0),
      ),
      BoxShadow(
        color: color.withOpacity(opacity * 0.3),
        blurRadius: IzDimensions.neonBlurRadius * 2,
        spreadRadius: IzDimensions.neonSpreadRadius * 2,
        offset: const Offset(0, 0),
      ),
    ];
  }

  /// Get glass effect decoration
  static BoxDecoration glassDecoration({
    Color? color,
    BorderRadius? borderRadius,
    Border? border,
  }) {
    return BoxDecoration(
      color: color ?? IzColorSchemes.glassOverlay,
      borderRadius: borderRadius ?? BorderRadius.circular(IzDimensions.radiusLg),
      border: border ??
          Border.all(
            color: IzColorSchemes.glassBorder,
            width: 1,
          ),
      boxShadow: const [
        BoxShadow(
          color: IzColorSchemes.glassDropShadow,
          blurRadius: IzDimensions.shadowBlurRadius,
          spreadRadius: IzDimensions.shadowSpread,
          offset: Offset(0, 4),
        ),
      ],
    );
  }
}

/// Custom component themes for IzUI
class IzComponentThemes {
  const IzComponentThemes();

  /// Get neon button theme
  ButtonStyle get neonButtonTheme => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: IzColorSchemes.neonBlue,
        elevation: 0,
        side: const BorderSide(
          color: IzColorSchemes.neonBlue,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
        ),
      );

  /// Get glass button theme
  ButtonStyle get glassButtonTheme => ElevatedButton.styleFrom(
        backgroundColor: IzColorSchemes.glassOverlay,
        foregroundColor: IzColorSchemes.darkText,
        elevation: 0,
        side: const BorderSide(
          color: IzColorSchemes.glassBorder,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(IzDimensions.radiusLg),
        ),
      );
}
