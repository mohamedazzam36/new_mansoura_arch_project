import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';

class MediaDetailImage extends StatefulWidget {
  const MediaDetailImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.maxHeight,
  });

  final String imagePath;
  final double width;
  final double maxHeight;

  @override
  State<MediaDetailImage> createState() => _MediaDetailImageState();
}

class _MediaDetailImageState extends State<MediaDetailImage> {
  final _controller = TransformationController();

  void _resetZoom() {
    _controller.value = Matrix4.identity();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBaseImage() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: widget.maxHeight),
      child: Image.asset(
        widget.imagePath,
        width: widget.width,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => SizedBox(
          width: widget.width,
          height: widget.width / 2.0,
          child: const ColoredBox(
            color: AppColors.brownMedium,
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: 64,
                color: AppColors.creamLight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _resetZoom,
      child: InteractiveViewer(
        transformationController: _controller,
        minScale: 1.0,
        maxScale: 5.0,
        clipBehavior: Clip.none,
        child: _buildBaseImage(),
      ),
    );
  }
}
