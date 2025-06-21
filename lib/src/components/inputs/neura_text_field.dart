import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import '../../theme/color_schemes.dart';
import '../../theme/typography.dart';
import '../../constants/dimensions.dart';

/// A futuristic text field with scanning animations and enhanced styling
class NeuraTextField extends StatefulWidget {
  const NeuraTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    // IzUI specific properties
    this.scanLineAnimation = true,
    this.glowOnFocus = true,
    this.scanlineColor,
    this.glowColor,
    this.borderRadius,
    this.glassMorphism = false,
  });

  // Standard TextField properties
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;

  // IzUI specific properties
  final bool scanLineAnimation;
  final bool glowOnFocus;
  final Color? scanlineColor;
  final Color? glowColor;
  final BorderRadius? borderRadius;
  final bool glassMorphism;

  @override
  State<NeuraTextField> createState() => _NeuraTextFieldState();
}

class _NeuraTextFieldState extends State<NeuraTextField> with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _scanlineController;
  late AnimationController _glowController;
  late Animation<double> _scanlineAnimation;
  late Animation<double> _glowAnimation;

  bool get _isFocused => _focusNode.hasFocus;
  bool get _isEnabled => widget.enabled ?? true;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _initAnimations();
    _focusNode.addListener(_handleFocusChange);
  }

  void _initAnimations() {
    // Scanline animation
    _scanlineController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scanlineAnimation = Tween<double>(
      begin: -1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scanlineController,
      curve: Curves.easeInOut,
    ));

    // Glow animation
    _glowController = AnimationController(
      duration: IzDimensions.animationMedium,
      vsync: this,
    );

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeOut,
    ));
  }

  void _handleFocusChange() {
    if (_isFocused) {
      if (widget.scanLineAnimation) {
        _scanlineController.forward().then((_) {
          if (_isFocused) {
            _scanlineController.reset();
          }
        });
      }
      if (widget.glowOnFocus) {
        _glowController.forward();
      }
    } else {
      if (widget.glowOnFocus) {
        _glowController.reverse();
      }
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _scanlineController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  Color get _borderColor {
    if (!_isEnabled) return IzColorSchemes.darkTextDisabled;
    if (_isFocused) return widget.glowColor ?? IzColorSchemes.neonBlue;
    return IzColorSchemes.darkBorder;
  }

  Color get _fillColor {
    if (widget.glassMorphism) {
      return IzColorSchemes.glassOverlay;
    }
    return IzColorSchemes.darkContainer;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = widget.borderRadius ?? BorderRadius.circular(IzDimensions.radiusLg);

    return AnimatedBuilder(
      animation: Listenable.merge([_scanlineAnimation, _glowAnimation]),
      builder: (context, child) {
        return Container(
          decoration: widget.glowOnFocus && _isFocused
              ? BoxDecoration(
                  borderRadius: effectiveBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: (widget.glowColor ?? IzColorSchemes.neonBlue).withOpacity(0.3 * _glowAnimation.value),
                      blurRadius: IzDimensions.neonBlurRadius * _glowAnimation.value,
                      spreadRadius: IzDimensions.neonSpreadRadius * _glowAnimation.value,
                      offset: const Offset(0, 0),
                    ),
                  ],
                )
              : null,
          child: Stack(
            children: [
              TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: (widget.decoration ?? const InputDecoration()).copyWith(
                  filled: true,
                  fillColor: _fillColor,
                  border: OutlineInputBorder(
                    borderRadius: effectiveBorderRadius,
                    borderSide: const BorderSide(
                      color: IzColorSchemes.darkBorder,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: effectiveBorderRadius,
                    borderSide: BorderSide(
                      color: _borderColor,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: effectiveBorderRadius,
                    borderSide: BorderSide(
                      color: _borderColor,
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: effectiveBorderRadius,
                    borderSide: const BorderSide(
                      color: IzColorSchemes.darkTextDisabled,
                      width: 1.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: effectiveBorderRadius,
                    borderSide: const BorderSide(
                      color: IzColorSchemes.error,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: effectiveBorderRadius,
                    borderSide: const BorderSide(
                      color: IzColorSchemes.error,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: IzDimensions.spacingMd,
                    vertical: IzDimensions.spacingMd,
                  ),
                  labelStyle: IzTypography.labelMedium.copyWith(
                    color: _isFocused ? (widget.glowColor ?? IzColorSchemes.neonBlue) : IzColorSchemes.darkTextSecondary,
                  ),
                  hintStyle: IzTypography.bodyMedium.copyWith(
                    color: IzColorSchemes.darkTextDisabled,
                  ),
                ),
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                style: widget.style ??
                    IzTypography.bodyMedium.copyWith(
                      color: IzColorSchemes.darkText,
                    ),
                strutStyle: widget.strutStyle,
                textAlign: widget.textAlign,
                textAlignVertical: widget.textAlignVertical,
                textDirection: widget.textDirection,
                readOnly: widget.readOnly,
                showCursor: widget.showCursor,
                autofocus: widget.autofocus,
                obscureText: widget.obscureText,
                autocorrect: widget.autocorrect,
                smartDashesType: widget.smartDashesType,
                smartQuotesType: widget.smartQuotesType,
                enableSuggestions: widget.enableSuggestions,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                expands: widget.expands,
                maxLength: widget.maxLength,
                maxLengthEnforcement: widget.maxLengthEnforcement,
                onChanged: widget.onChanged,
                onEditingComplete: widget.onEditingComplete,
                onSubmitted: widget.onSubmitted,
                onAppPrivateCommand: widget.onAppPrivateCommand,
                inputFormatters: widget.inputFormatters,
                enabled: widget.enabled,
                cursorWidth: widget.cursorWidth,
                cursorHeight: widget.cursorHeight,
                cursorRadius: widget.cursorRadius,
                cursorColor: widget.cursorColor ?? (widget.glowColor ?? IzColorSchemes.neonBlue),
                keyboardAppearance: widget.keyboardAppearance,
                scrollPadding: widget.scrollPadding,
                dragStartBehavior: widget.dragStartBehavior,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                selectionControls: widget.selectionControls,
                onTap: widget.onTap,
                mouseCursor: widget.mouseCursor,
                buildCounter: widget.buildCounter,
                scrollController: widget.scrollController,
                scrollPhysics: widget.scrollPhysics,
                autofillHints: widget.autofillHints,
                clipBehavior: widget.clipBehavior,
                restorationId: widget.restorationId,
                scribbleEnabled: widget.scribbleEnabled,
                enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
              ),

              // Scanline animation overlay
              if (widget.scanLineAnimation && _isFocused)
                Positioned.fill(
                  child: IgnorePointer(
                    child: ClipRRect(
                      borderRadius: effectiveBorderRadius,
                      child: AnimatedBuilder(
                        animation: _scanlineAnimation,
                        builder: (context, child) {
                          return CustomPaint(
                            painter: ScanlinePainter(
                              progress: _scanlineAnimation.value,
                              color: widget.scanlineColor ?? (widget.glowColor ?? IzColorSchemes.neonBlue),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Custom painter for the scanning line effect
class ScanlinePainter extends CustomPainter {
  ScanlinePainter({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress < -0.8 || progress > 0.8) return;

    final paint = Paint()
      ..color = color.withOpacity(0.6)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final scanlineY = (progress + 1) * size.height / 2;

    // Draw the main scanline
    canvas.drawLine(
      Offset(0, scanlineY),
      Offset(size.width, scanlineY),
      paint,
    );

    // Draw a softer glow effect
    final glowPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, scanlineY),
      Offset(size.width, scanlineY),
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(ScanlinePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
