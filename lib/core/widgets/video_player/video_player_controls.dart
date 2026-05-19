import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:nour_arch/core/theme/app_colors.dart';

class VideoPlayerControls extends StatelessWidget {
  const VideoPlayerControls({
    super.key,
    required this.controller,
    required this.onClose,
  });

  final VideoPlayerController controller;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final isEnded =
            value.position >= value.duration && value.duration > Duration.zero;
        final isPaused = !value.isPlaying && !isEnded;

        return Stack(
          children: [
            if (isEnded)
              Positioned.fill(
                child: ColoredBox(
                  color: const Color(0xBB000000),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: const BoxDecoration(
                            color: AppColors.brownAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.replay_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Replay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else if (isPaused)
              Positioned.fill(
                child: IgnorePointer(
                  child: ColoredBox(
                    color: const Color(0x44000000),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xBB000000),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
            if (!isEnded)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LayoutBuilder(
                  builder: (ctx, constraints) => GestureDetector(
                    onTapDown: (d) {
                      final frac = (d.localPosition.dx / constraints.maxWidth)
                          .clamp(0.0, 1.0);
                      final seekTo = Duration(
                        milliseconds: (frac * value.duration.inMilliseconds)
                            .round(),
                      );
                      controller.seekTo(seekTo);
                    },
                    child: Container(
                      height: 28,
                      color: Colors.transparent,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(height: 3, color: Colors.white24),
                          FractionallySizedBox(
                            widthFactor: value.duration.inMilliseconds > 0
                                ? value.position.inMilliseconds /
                                      value.duration.inMilliseconds
                                : 0.0,
                            child: Container(
                              height: 3,
                              color: AppColors.brownAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
