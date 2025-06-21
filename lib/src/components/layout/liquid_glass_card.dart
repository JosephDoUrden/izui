import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../theme/color_schemes.dart';
import '../../constants/dimensions.dart';

/// A liquid glass card with advanced fluid animations and Apple-inspired design
class LiquidGlassCard extends StatefulWidget {
  const LiquidGlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.liquidIntensity = 1.0,
    this.surfaceTint,
    this.onTap,
    this.enableLiquidAnimation = true,
    this.enableHoverEffect = true,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double liquidIntensity;
  final Color? surfaceTint;
  final VoidCallback? onTap;
  final bool enableLiquidAnimation;
  final bool enableHoverEffect;

  @override
  State<LiquidGlassCard> createState() => _LiquidGlassCardState();
}

class _LiquidGlassCardState extends State<LiquidGlassCard> with TickerProviderStateMixin {
  late AnimationController _liquidController;
  late AnimationController _hoverController;
  late AnimationController _rippleController;

  late Animation<double> _liquidAnimation;
  late Animation<double> _hoverAnimation;
  late Animation<double> _rippleAnimation;

  bool _isHovered = false;
  Offset? _tapPosition;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    // Liquid flowing animation
    _liquidController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _liquidAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _liquidController,
      curve: Curves.easeInOut,
    ));

    // Hover effect animation
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _hoverAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOut,
    ));

    // Ripple effect animation
    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rippleController,
      curve: Curves.easeOut,
    ));

    if (widget.enableLiquidAnimation) {
      _liquidController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _liquidController.dispose();
    _hoverController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _tapPosition = details.localPosition;
    _rippleController.forward(from: 0);
  }

  void _handleHoverEnter(PointerEnterEvent event) {
    if (widget.enableHoverEffect) {
      setState(() => _isHovered = true);
      _hoverController.forward();
    }
  }

  void _handleHoverExit(PointerExitEvent event) {
    if (widget.enableHoverEffect) {
      setState(() => _isHovered = false);
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = BorderRadius.circular(IzDimensions.radiusXl);
    final effectiveBorderRadius = widget.borderRadius ?? defaultBorderRadius;
    final surfaceTint = widget.surfaceTint ?? IzColorSchemes.neonBlue;

    return AnimatedBuilder(
      animation: Listenable.merge([
        _liquidAnimation,
        _hoverAnimation,
        _rippleAnimation,
      ]),
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          child: MouseRegion(
            onEnter: _handleHoverEnter,
            onExit: _handleHoverExit,
            child: GestureDetector(
              onTapDown: _handleTapDown,
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: effectiveBorderRadius,
                  boxShadow: [
                    // Ambient shadow
                    BoxShadow(
                      color: surfaceTint.withOpacity(0.1 * widget.liquidIntensity),
                      blurRadius: 20 * widget.liquidIntensity,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                    // Key light shadow
                    BoxShadow(
                      color: surfaceTint.withOpacity(0.15 * widget.liquidIntensity * _hoverAnimation.value),
                      blurRadius: 40 * widget.liquidIntensity,
                      spreadRadius: -5,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: effectiveBorderRadius as BorderRadius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20 + (10 * _hoverAnimation.value),
                      sigmaY: 20 + (10 * _hoverAnimation.value),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: effectiveBorderRadius,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.2 * widget.liquidIntensity),
                            Colors.white.withOpacity(0.1 * widget.liquidIntensity),
                            surfaceTint.withOpacity(0.05 * widget.liquidIntensity),
                          ],
                          stops: [
                            0.0,
                            0.5 + (0.3 * _liquidAnimation.value),
                            1.0,
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 0.5,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Liquid flowing effect
                          if (widget.enableLiquidAnimation)
                            Positioned.fill(
                              child: CustomPaint(
                                painter: LiquidFlowPainter(
                                  progress: _liquidAnimation.value,
                                  color: surfaceTint,
                                  intensity: widget.liquidIntensity,
                                ),
                              ),
                            ),

                          // Ripple effect
                          if (_tapPosition != null)
                            Positioned.fill(
                              child: CustomPaint(
                                painter: RipplePainter(
                                  center: _tapPosition!,
                                  progress: _rippleAnimation.value,
                                  color: surfaceTint,
                                ),
                              ),
                            ),

                          // Content
                          Container(
                            padding: widget.padding ?? const EdgeInsets.all(IzDimensions.spacingLg),
                            child: widget.child,
                          ),
                        ],
                      ),
                    ),
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

/// Painter for liquid flowing animation
class LiquidFlowPainter extends CustomPainter {
  LiquidFlowPainter({
    required this.progress,
    required this.color,
    required this.intensity,
  });

  final double progress;
  final Color color;
  final double intensity;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.1 * intensity)
      ..style = PaintingStyle.fill;

    // Create flowing liquid effect
    final path = Path();
    final waveHeight = 20 * intensity;
    final waveLength = size.width / 2;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 1) {
      final y = size.height - waveHeight * (1 + 0.5 * math.sin((x / waveLength + progress * 2) * math.pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Add secondary wave
    final paint2 = Paint()
      ..color = color.withOpacity(0.05 * intensity)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    path2.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 1) {
      final y = size.height - waveHeight * 0.7 * (1 + 0.5 * math.sin((x / waveLength + progress * 2.5) * math.pi + math.pi / 3));
      path2.lineTo(x, y);
    }

    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(LiquidFlowPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color || oldDelegate.intensity != intensity;
  }
}

/// Painter for ripple effect
class RipplePainter extends CustomPainter {
  RipplePainter({
    required this.center,
    required this.progress,
    required this.color,
  });

  final Offset center;
  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final paint = Paint()
      ..color = color.withOpacity((1 - progress) * 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final maxRadius = math.sqrt(size.width * size.width + size.height * size.height);
    final radius = maxRadius * progress;

    canvas.drawCircle(center, radius, paint);

    // Secondary ripple
    if (progress > 0.3) {
      final paint2 = Paint()
        ..color = color.withOpacity((1 - progress) * 0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;

      canvas.drawCircle(center, radius * 0.7, paint2);
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return oldDelegate.center != center || oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
