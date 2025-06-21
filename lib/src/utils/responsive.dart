import 'package:flutter/material.dart';
import '../constants/dimensions.dart';

/// Responsive utility functions for IzUI
class IzResponsive {
  /// Get the current screen breakpoint
  static Breakpoint getBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= IzDimensions.breakpoint2xl) return Breakpoint.xxl;
    if (width >= IzDimensions.breakpointXl) return Breakpoint.xl;
    if (width >= IzDimensions.breakpointLg) return Breakpoint.lg;
    if (width >= IzDimensions.breakpointMd) return Breakpoint.md;
    if (width >= IzDimensions.breakpointSm) return Breakpoint.sm;
    return Breakpoint.xs;
  }

  /// Check if screen is mobile size
  static bool isMobile(BuildContext context) {
    return getBreakpoint(context).index <= Breakpoint.sm.index;
  }

  /// Check if screen is tablet size
  static bool isTablet(BuildContext context) {
    final bp = getBreakpoint(context);
    return bp == Breakpoint.md || bp == Breakpoint.lg;
  }

  /// Check if screen is desktop size
  static bool isDesktop(BuildContext context) {
    return getBreakpoint(context).index >= Breakpoint.xl.index;
  }

  /// Get responsive value based on screen size
  static T responsive<T>(
    BuildContext context, {
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
    required T fallback,
  }) {
    final breakpoint = getBreakpoint(context);

    switch (breakpoint) {
      case Breakpoint.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? fallback;
      case Breakpoint.xl:
        return xl ?? lg ?? md ?? sm ?? xs ?? fallback;
      case Breakpoint.lg:
        return lg ?? md ?? sm ?? xs ?? fallback;
      case Breakpoint.md:
        return md ?? sm ?? xs ?? fallback;
      case Breakpoint.sm:
        return sm ?? xs ?? fallback;
      case Breakpoint.xs:
        return xs ?? fallback;
    }
  }

  /// Get responsive padding
  static EdgeInsets responsivePadding(BuildContext context) {
    return responsive(
      context,
      xs: const EdgeInsets.all(IzDimensions.spacingMd),
      sm: const EdgeInsets.all(IzDimensions.spacingLg),
      md: const EdgeInsets.all(IzDimensions.spacingXl),
      lg: const EdgeInsets.all(IzDimensions.spacing2xl),
      fallback: const EdgeInsets.all(IzDimensions.spacingMd),
    );
  }

  /// Get responsive content width
  static double getContentWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return responsive(
      context,
      xs: screenWidth,
      sm: screenWidth,
      md: screenWidth * 0.9,
      lg: screenWidth * 0.8,
      xl: IzDimensions.maxContentWidth,
      fallback: screenWidth,
    );
  }

  /// Get responsive columns count
  static int getColumnsCount(BuildContext context) {
    return responsive(
      context,
      xs: 1,
      sm: 2,
      md: 3,
      lg: 4,
      xl: 6,
      fallback: 1,
    );
  }

  /// Get responsive font size multiplier
  static double getFontSizeMultiplier(BuildContext context) {
    return responsive(
      context,
      xs: 0.9,
      sm: 1.0,
      md: 1.0,
      lg: 1.1,
      xl: 1.1,
      fallback: 1.0,
    );
  }

  /// Create responsive widget builder
  static Widget builder(
    BuildContext context, {
    Widget? xs,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
    Widget? xxl,
    required Widget fallback,
  }) {
    final breakpoint = getBreakpoint(context);

    switch (breakpoint) {
      case Breakpoint.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? fallback;
      case Breakpoint.xl:
        return xl ?? lg ?? md ?? sm ?? xs ?? fallback;
      case Breakpoint.lg:
        return lg ?? md ?? sm ?? xs ?? fallback;
      case Breakpoint.md:
        return md ?? sm ?? xs ?? fallback;
      case Breakpoint.sm:
        return sm ?? xs ?? fallback;
      case Breakpoint.xs:
        return xs ?? fallback;
    }
  }
}

/// Screen size breakpoints
enum Breakpoint {
  xs, // 0px and up
  sm, // 576px and up
  md, // 768px and up
  lg, // 992px and up
  xl, // 1200px and up
  xxl, // 1400px and up
}

/// Extension to get breakpoint properties
extension BreakpointExtension on Breakpoint {
  /// Get the minimum width for this breakpoint
  double get minWidth {
    switch (this) {
      case Breakpoint.xs:
        return IzDimensions.breakpointXs;
      case Breakpoint.sm:
        return IzDimensions.breakpointSm;
      case Breakpoint.md:
        return IzDimensions.breakpointMd;
      case Breakpoint.lg:
        return IzDimensions.breakpointLg;
      case Breakpoint.xl:
        return IzDimensions.breakpointXl;
      case Breakpoint.xxl:
        return IzDimensions.breakpoint2xl;
    }
  }

  /// Check if this breakpoint is mobile
  bool get isMobile => index <= Breakpoint.sm.index;

  /// Check if this breakpoint is tablet
  bool get isTablet => this == Breakpoint.md || this == Breakpoint.lg;

  /// Check if this breakpoint is desktop
  bool get isDesktop => index >= Breakpoint.xl.index;
}
