import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/color_schemes.dart';
import '../../constants/dimensions.dart';

/// A glassmorphism card with backdrop blur effects
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blurIntensity = IzDimensions.glassBlur,
    this.opacity = IzDimensions.glassOpacity,
    this.borderOpacity = IzDimensions.glassBorderOpacity,
    this.shadowIntensity = 1.0,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.elevation = 0.0,
    this.onTap,
  });

  /// The widget below this widget in the tree
  final Widget child;

  /// The width of the card
  final double? width;

  /// The height of the card
  final double? height;

  /// The padding inside the card
  final EdgeInsetsGeometry? padding;

  /// The margin outside the card
  final EdgeInsetsGeometry? margin;

  /// The border radius of the card
  final BorderRadiusGeometry? borderRadius;

  /// The intensity of the backdrop blur effect (0.0 to 30.0)
  final double blurIntensity;

  /// The opacity of the glass background (0.0 to 1.0)
  final double opacity;

  /// The opacity of the border (0.0 to 1.0)
  final double borderOpacity;

  /// The intensity of the shadow effect (0.0 to 2.0)
  final double shadowIntensity;

  /// Custom background color (overrides default glass color)
  final Color? backgroundColor;

  /// Custom border color (overrides default glass border)
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The elevation for shadow
  final double elevation;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = BorderRadius.circular(IzDimensions.radiusLg);
    final effectiveBorderRadius = borderRadius ?? defaultBorderRadius;

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: effectiveBorderRadius as BorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurIntensity,
            sigmaY: blurIntensity,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: effectiveBorderRadius,
              splashColor: IzColorSchemes.glassOverlay.withOpacity(0.3),
              highlightColor: IzColorSchemes.glassOverlay.withOpacity(0.1),
              child: Container(
                padding: padding ?? const EdgeInsets.all(IzDimensions.spacingLg),
                decoration: BoxDecoration(
                  color: (backgroundColor ?? IzColorSchemes.glassOverlay).withOpacity(opacity),
                  borderRadius: effectiveBorderRadius,
                  border: Border.all(
                    color: (borderColor ?? IzColorSchemes.glassBorder).withOpacity(borderOpacity),
                    width: borderWidth,
                  ),
                  boxShadow: shadowIntensity > 0
                      ? [
                          BoxShadow(
                            color: IzColorSchemes.glassDropShadow.withOpacity(
                              0.2 * shadowIntensity,
                            ),
                            blurRadius: IzDimensions.shadowBlurRadius * shadowIntensity,
                            spreadRadius: IzDimensions.shadowSpread,
                            offset: Offset(0, 4 * shadowIntensity),
                          ),
                          BoxShadow(
                            color: IzColorSchemes.glassDropShadow.withOpacity(
                              0.1 * shadowIntensity,
                            ),
                            blurRadius: IzDimensions.shadowBlurRadius * 2 * shadowIntensity,
                            spreadRadius: IzDimensions.shadowSpread,
                            offset: Offset(0, 8 * shadowIntensity),
                          ),
                        ]
                      : null,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A variant of GlassCard with enhanced glow effects
class NeonGlassCard extends StatefulWidget {
  const NeonGlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.glowColor = IzColorSchemes.neonBlue,
    this.glowIntensity = 1.0,
    this.pulseAnimation = false,
    this.blurIntensity = IzDimensions.glassBlur,
    this.opacity = IzDimensions.glassOpacity,
    this.onTap,
  });

  /// The widget below this widget in the tree
  final Widget child;

  /// The width of the card
  final double? width;

  /// The height of the card
  final double? height;

  /// The padding inside the card
  final EdgeInsetsGeometry? padding;

  /// The margin outside the card
  final EdgeInsetsGeometry? margin;

  /// The border radius of the card
  final BorderRadiusGeometry? borderRadius;

  /// The color of the neon glow
  final Color glowColor;

  /// The intensity of the glow (0.0 to 2.0)
  final double glowIntensity;

  /// Whether to animate the glow with a pulse effect
  final bool pulseAnimation;

  /// The intensity of the backdrop blur effect
  final double blurIntensity;

  /// The opacity of the glass background
  final double opacity;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  @override
  State<NeonGlassCard> createState() => _NeonGlassCardState();
}

class _NeonGlassCardState extends State<NeonGlassCard> with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _glowAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));

    if (widget.pulseAnimation) {
      _glowController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(NeonGlassCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pulseAnimation != oldWidget.pulseAnimation) {
      if (widget.pulseAnimation) {
        _glowController.repeat(reverse: true);
      } else {
        _glowController.stop();
        _glowController.reset();
      }
    }
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = BorderRadius.circular(IzDimensions.radiusLg);
    final effectiveBorderRadius = widget.borderRadius ?? defaultBorderRadius;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        final glowValue = widget.pulseAnimation ? _glowAnimation.value : 1.0;

        return Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: effectiveBorderRadius,
            boxShadow: [
              // Inner glow
              BoxShadow(
                color: widget.glowColor.withOpacity(
                  0.3 * widget.glowIntensity * glowValue,
                ),
                blurRadius: IzDimensions.neonBlurRadius * widget.glowIntensity,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
              // Outer glow
              BoxShadow(
                color: widget.glowColor.withOpacity(
                  0.2 * widget.glowIntensity * glowValue,
                ),
                blurRadius: IzDimensions.neonBlurRadius * 2 * widget.glowIntensity,
                spreadRadius: IzDimensions.neonSpreadRadius * widget.glowIntensity,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: effectiveBorderRadius as BorderRadius,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.blurIntensity,
                sigmaY: widget.blurIntensity,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: effectiveBorderRadius,
                  splashColor: widget.glowColor.withOpacity(0.2),
                  highlightColor: widget.glowColor.withOpacity(0.1),
                  child: Container(
                    padding: widget.padding ?? const EdgeInsets.all(IzDimensions.spacingLg),
                    decoration: BoxDecoration(
                      color: IzColorSchemes.glassOverlay.withOpacity(widget.opacity),
                      borderRadius: effectiveBorderRadius,
                      border: Border.all(
                        color: widget.glowColor.withOpacity(
                          0.6 * widget.glowIntensity * glowValue,
                        ),
                        width: 1.0,
                      ),
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
