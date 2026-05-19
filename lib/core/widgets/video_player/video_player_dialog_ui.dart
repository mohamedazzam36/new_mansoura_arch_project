import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'video_player_controls.dart';
import 'video_info_panel.dart';

class VideoPlayerDialogUi extends StatefulWidget {
  const VideoPlayerDialogUi({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
    required this.designer,
  });

  final String assetPath;
  final String title;
  final String description;
  final String designer;

  @override
  State<VideoPlayerDialogUi> createState() => _VideoPlayerDialogUiState();
}

class _VideoPlayerDialogUiState extends State<VideoPlayerDialogUi> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    print('togglePlay');
    if (!_isInitialized) return;

    if (_controller.value.position >= _controller.value.duration) {
      _controller.seekTo(Duration.zero);
      _controller.play();
      return;
    }

    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    print('current position: ${_controller.value.position}');
    print('duration: ${_controller.value.duration}');
    print('isPlaying: ${_controller.value.isPlaying}');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final dialogWidth = isDesktop
        ? (size.width * 0.80).clamp(500.0, 920.0)
        : size.width * 0.96;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: dialogWidth,
          constraints: BoxConstraints(maxHeight: size.height * 0.92),
          decoration: BoxDecoration(
            color: AppColors.appBarBackground,
            borderRadius: BorderRadius.circular(AppConstants.radiusXl),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 60,
                spreadRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusXl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _togglePlay,
                  child: Stack(
                    children: [
                      if (_isInitialized)
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      else
                        const AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.brownAccent,
                            ),
                          ),
                        ),
                      // Transparent overlay to catch clicks on Web before the DOM <video> element swallows them
                      if (_isInitialized)
                        Positioned.fill(
                          child: Container(color: Colors.transparent),
                        ),
                      if (_isInitialized)
                        Positioned.fill(
                          child: VideoPlayerControls(
                            controller: _controller,
                            onClose: () => Navigator.of(context).pop(),
                          ),
                        ),
                      if (!_isInitialized)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xBB000000),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                VideoInfoPanel(
                  title: widget.title,
                  description: widget.description,
                  designer: widget.designer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
