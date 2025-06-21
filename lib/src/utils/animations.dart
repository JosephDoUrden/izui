import 'package:flutter/material.dart';
import '../constants/dimensions.dart';

/// Animation utilities for IzUI
class IzAnimations {
  // Custom cubic bezier curves for futuristic feel
  static const Curve futuristicCurve = Cubic(0.25, 0.46, 0.45, 0.94);
  static const Curve glowCurve = Cubic(0.4, 0.0, 0.2, 1);
  static const Curve pulseCurve = Cubic(0.4, 0.0, 0.6, 1);
  static const Curve morphCurve = Cubic(0.2, 0.0, 0.2, 1);
  static const Curve bounceCurve = Cubic(0.68, -0.55, 0.265, 1.55);

  /// Create a glow animation controller
  static AnimationController createGlowController(
    TickerProvider vsync, {
    Duration? duration,
    bool repeat = true,
    bool reverse = true,
  }) {
    final controller = AnimationController(
      duration: duration ?? IzDimensions.animationMedium,
      vsync: vsync,
    );

    if (repeat) {
      controller.repeat(reverse: reverse);
    }

    return controller;
  }

  /// Create a pulse animation
  static Animation<double> createPulseAnimation(AnimationController controller) {
    return Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: pulseCurve,
    ));
  }

  /// Create a glow intensity animation
  static Animation<double> createGlowAnimation(AnimationController controller) {
    return Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: glowCurve,
    ));
  }

  /// Create a slide fade transition
  static Widget slideFadeTransition({
    required Animation<double> animation,
    required Widget child,
    Offset beginOffset = const Offset(0, 0.3),
    Offset endOffset = Offset.zero,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset,
        end: endOffset,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: futuristicCurve,
      )),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  /// Create a scale fade transition
  static Widget scaleFadeTransition({
    required Animation<double> animation,
    required Widget child,
    double beginScale = 0.8,
    double endScale = 1.0,
  }) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: beginScale,
        end: endScale,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: futuristicCurve,
      )),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  /// Create a morphing container transition
  static AnimatedContainer morphingContainer({
    required Duration duration,
    required Widget child,
    Color? color,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Border? border,
  }) {
    return AnimatedContainer(
      duration: duration,
      curve: morphCurve,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        border: border,
      ),
      child: child,
    );
  }

  /// Create a staggered animation list
  static List<Animation<double>> createStaggeredAnimations({
    required AnimationController controller,
    required int itemCount,
    Duration interval = const Duration(milliseconds: 50),
  }) {
    final animations = <Animation<double>>[];
    final intervalValue = interval.inMilliseconds / controller.duration!.inMilliseconds;

    for (int i = 0; i < itemCount; i++) {
      final start = i * intervalValue;
      final end = (start + (1 - start)).clamp(0.0, 1.0);

      animations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(start, end, curve: futuristicCurve),
          ),
        ),
      );
    }

    return animations;
  }

  /// Create a shimmer animation
  static Animation<double> createShimmerAnimation(AnimationController controller) {
    return Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }

  /// Create a bounce animation
  static Animation<double> createBounceAnimation(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: bounceCurve,
    ));
  }

  /// Animate a value with custom curve
  static Animation<T> animateValue<T>({
    required AnimationController controller,
    required T begin,
    required T end,
    Curve curve = Curves.linear,
  }) {
    return Tween<T>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: curve,
    ));
  }

  /// Create rotating animation
  static Animation<double> createRotationAnimation(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }

  /// Animate border radius
  static Animation<BorderRadius?> animateBorderRadius({
    required AnimationController controller,
    required BorderRadius begin,
    required BorderRadius end,
    Curve curve = Curves.easeInOut,
  }) {
    return BorderRadiusTween(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: curve,
    ));
  }

  /// Animate color
  static Animation<Color?> animateColor({
    required AnimationController controller,
    required Color begin,
    required Color end,
    Curve curve = Curves.easeInOut,
  }) {
    return ColorTween(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: curve,
    ));
  }
}

/// Extension for animation controller to add convenience methods
extension IzAnimationControllerExtension on AnimationController {
  /// Start a pulse animation that repeats
  void startPulse() {
    repeat(reverse: true);
  }

  /// Start a glow animation
  void startGlow() {
    repeat(reverse: true);
  }

  /// Animate to value with futuristic curve
  TickerFuture animateToFuturistic(double target) {
    return animateTo(target, curve: IzAnimations.futuristicCurve);
  }

  /// Animate from value with futuristic curve
  TickerFuture animateFromFuturistic(double target) {
    return animateTo(target, curve: IzAnimations.futuristicCurve);
  }
}
