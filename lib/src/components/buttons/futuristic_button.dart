import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../theme/color_schemes.dart';
import '../../theme/typography.dart';
import '../../constants/dimensions.dart';
import '../../utils/animations.dart';

/// A futuristic button with neon glow effects and animations
class FuturisticButton extends StatefulWidget {
  const FuturisticButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = FuturisticButtonVariant.primary,
    this.size = FuturisticButtonSize.medium,
    this.glowColor,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
  });

  /// The callback that is called when the button is tapped
  final VoidCallback? onPressed;

  /// The widget below this widget in the tree
  final Widget child;

  /// The visual variant of the button
  final FuturisticButtonVariant variant;

  /// The size of the button
  final FuturisticButtonSize size;

  /// Custom glow color (overrides variant color)
  final Color? glowColor;

  /// Whether to show loading indicator
  final bool isLoading;

  /// Whether the button is enabled
  final bool enabled;

  /// Custom width
  final double? width;

  /// Custom height
  final double? height;

  /// Custom border radius
  final BorderRadius? borderRadius;

  /// Custom padding
  final EdgeInsets? padding;

  @override
  State<FuturisticButton> createState() => _FuturisticButtonState();
}

class _FuturisticButtonState extends State<FuturisticButton> with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _pressController;
  late AnimationController _glowController;
  late AnimationController _loadingController;

  late Animation<double> _hoverAnimation;
  late Animation<double> _pressAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _rotationAnimation;

  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _hoverController = AnimationController(
      duration: IzDimensions.animationFast,
      vsync: this,
    );

    _pressController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _glowController = IzAnimations.createGlowController(this);

    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _hoverAnimation = IzAnimations.createPulseAnimation(_hoverController);
    _pressAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(parent: _pressController, curve: Curves.easeInOut));
    _glowAnimation = IzAnimations.createGlowAnimation(_glowController);
    _rotationAnimation = IzAnimations.createRotationAnimation(_loadingController);

    if (widget.isLoading) {
      _loadingController.repeat();
    }
  }

  @override
  void didUpdateWidget(FuturisticButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _loadingController.repeat();
      } else {
        _loadingController.stop();
      }
    }
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _pressController.dispose();
    _glowController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _pressController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _pressController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _pressController.reverse();
  }

  void _handleHoverEnter(PointerEnterEvent event) {
    setState(() => _isHovered = true);
    _hoverController.forward();
  }

  void _handleHoverExit(PointerExitEvent event) {
    setState(() => _isHovered = false);
    _hoverController.reverse();
  }

  Color get _buttonColor {
    switch (widget.variant) {
      case FuturisticButtonVariant.primary:
        return IzColorSchemes.neonBlue;
      case FuturisticButtonVariant.secondary:
        return IzColorSchemes.neonPurple;
      case FuturisticButtonVariant.success:
        return IzColorSchemes.neonGreen;
      case FuturisticButtonVariant.warning:
        return IzColorSchemes.neonOrange;
      case FuturisticButtonVariant.danger:
        return IzColorSchemes.neonPink;
      case FuturisticButtonVariant.outline:
        return Colors.transparent;
      case FuturisticButtonVariant.glass:
        return IzColorSchemes.glassOverlay;
    }
  }

  Color get _glowColor {
    return widget.glowColor ?? _buttonColor;
  }

  double get _buttonHeight {
    switch (widget.size) {
      case FuturisticButtonSize.small:
        return widget.height ?? IzDimensions.buttonHeightSm;
      case FuturisticButtonSize.medium:
        return widget.height ?? IzDimensions.buttonHeightMd;
      case FuturisticButtonSize.large:
        return widget.height ?? IzDimensions.buttonHeightLg;
    }
  }

  EdgeInsets get _buttonPadding {
    if (widget.padding != null) return widget.padding!;

    switch (widget.size) {
      case FuturisticButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: IzDimensions.spacingMd,
          vertical: IzDimensions.spacingSm,
        );
      case FuturisticButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: IzDimensions.spacingLg,
          vertical: IzDimensions.spacingMd,
        );
      case FuturisticButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: IzDimensions.spacingXl,
          vertical: IzDimensions.spacingLg,
        );
    }
  }

  TextStyle get _textStyle {
    final baseStyle = switch (widget.size) {
      FuturisticButtonSize.small => IzTypography.labelMedium,
      FuturisticButtonSize.medium => IzTypography.labelLarge,
      FuturisticButtonSize.large => IzTypography.titleMedium,
    };

    return IzTypography.buttonTextStyle(baseStyle);
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.enabled && widget.onPressed != null;

    return AnimatedBuilder(
      animation: Listenable.merge([
        _hoverAnimation,
        _pressAnimation,
        _glowAnimation,
      ]),
      builder: (context, child) {
        return Transform.scale(
          scale: _pressAnimation.value,
          child: MouseRegion(
            onEnter: isEnabled ? _handleHoverEnter : null,
            onExit: isEnabled ? _handleHoverExit : null,
            cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
            child: GestureDetector(
              onTapDown: isEnabled ? _handleTapDown : null,
              onTapUp: isEnabled ? _handleTapUp : null,
              onTapCancel: isEnabled ? _handleTapCancel : null,
              onTap: isEnabled && !widget.isLoading ? widget.onPressed : null,
              child: Container(
                width: widget.width,
                height: _buttonHeight,
                padding: _buttonPadding,
                decoration: BoxDecoration(
                  color: isEnabled ? _buttonColor : IzColorSchemes.darkTextDisabled,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(IzDimensions.radiusLg),
                  border: widget.variant == FuturisticButtonVariant.outline || widget.variant == FuturisticButtonVariant.glass
                      ? Border.all(
                          color: isEnabled ? _glowColor : IzColorSchemes.darkTextDisabled,
                          width: 1.5,
                        )
                      : null,
                  boxShadow: isEnabled && _isHovered
                      ? [
                          BoxShadow(
                            color: _glowColor.withOpacity(_glowAnimation.value * 0.8),
                            blurRadius: IzDimensions.neonBlurRadius * _hoverAnimation.value,
                            spreadRadius: IzDimensions.neonSpreadRadius * _hoverAnimation.value,
                            offset: const Offset(0, 0),
                          ),
                          BoxShadow(
                            color: _glowColor.withOpacity(_glowAnimation.value * 0.4),
                            blurRadius: IzDimensions.neonBlurRadius * 2 * _hoverAnimation.value,
                            spreadRadius: IzDimensions.neonSpreadRadius * 2 * _hoverAnimation.value,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: widget.isLoading
                      ? AnimatedBuilder(
                          animation: _rotationAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _rotationAnimation.value * 2 * 3.14159,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    widget.variant == FuturisticButtonVariant.outline || widget.variant == FuturisticButtonVariant.glass
                                        ? _glowColor
                                        : IzColorSchemes.darkBg,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : DefaultTextStyle(
                          style: _textStyle.copyWith(
                            color: widget.variant == FuturisticButtonVariant.outline || widget.variant == FuturisticButtonVariant.glass
                                ? _glowColor
                                : IzColorSchemes.darkBg,
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

/// Button variants for different styles
enum FuturisticButtonVariant {
  primary,
  secondary,
  success,
  warning,
  danger,
  outline,
  glass,
}

/// Button sizes
enum FuturisticButtonSize {
  small,
  medium,
  large,
}
