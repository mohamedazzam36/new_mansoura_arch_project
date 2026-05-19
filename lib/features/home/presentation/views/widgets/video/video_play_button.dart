import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

class VideoPlayButton extends StatefulWidget {
  const VideoPlayButton({super.key});

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _playController;
  late final Animation<double> _playScale;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _playController = AnimationController(
      vsync: this,
      duration: AppConstants.animFast,
    );
    _playScale = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(CurvedAnimation(parent: _playController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _playController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _hovered = true);
          _playController.forward();
        },
        onExit: (_) {
          setState(() => _hovered = false);
          _playController.reverse();
        },
        child: ScaleTransition(
          scale: _playScale,
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.brownPrimary
                  : AppColors.creamLight.withValues(alpha: 0.9),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              size: 34,
              color: _hovered ? AppColors.textOnDark : AppColors.brownPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
