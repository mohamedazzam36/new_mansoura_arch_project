import 'package:flutter/material.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

/// Wraps [child] in a fade + slide-up animation that triggers on build.
/// Use this to give scroll sections a smooth reveal effect.
class AnimatedFadeWidget extends StatefulWidget {
  const AnimatedFadeWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppConstants.animSlow,
    this.slideOffset = 24.0,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;

  /// How many logical pixels to slide up from (0 = no slide, just fade).
  final double slideOffset;

  @override
  State<AnimatedFadeWidget> createState() => _AnimatedFadeWidgetState();
}

class _AnimatedFadeWidgetState extends State<AnimatedFadeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.slideOffset / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
