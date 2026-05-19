import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

/// A button with a smooth hover scale + color animation effect.
/// Works on desktop (mouse hover) and degrades gracefully on touch.
class HoverButton extends StatefulWidget {
  const HoverButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.brownPrimary,
    this.foregroundColor = AppColors.textOnDark,
    this.hoverColor = AppColors.brownDeep,
    this.borderColor,
    this.outlined = false,
  });

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color hoverColor;
  final Color? borderColor;

  /// If true, renders as an outlined (ghost) button.
  final bool outlined;

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppConstants.animFast,
    );
    _scale = Tween<double>(begin: 1.0, end: 1.04).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _colorAnim = ColorTween(
      begin: widget.outlined ? Colors.transparent : widget.backgroundColor,
      end: widget.hoverColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(_) => _controller.forward();
  void _onExit(_) => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _onEnter,
      onExit: _onExit,
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedBuilder(
          animation: _colorAnim,
          builder: (context, child) {
            return GestureDetector(
              onTap: widget.onPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: widget.outlined
                      ? _colorAnim.value
                      : _colorAnim.value ?? widget.backgroundColor,
                  borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                  border: widget.outlined
                      ? Border.all(
                          color: widget.borderColor ?? widget.backgroundColor,
                          width: 1.5,
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(widget.label, style: AppTextStyles.button),
              ),
            );
          },
        ),
      ),
    );
  }
}
