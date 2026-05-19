import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/asset_paths.dart';

class VideoThumbnail extends StatelessWidget {
  const VideoThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AssetPaths.nourPoster1,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.creamDark, AppColors.brownLight],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.landscape_outlined,
                size: 80,
                color: AppColors.brownPrimary,
              ),
            ),
          ),
        ),
        const ColoredBox(color: Color(0x44000000)),
      ],
    );
  }
}
