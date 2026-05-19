import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/features/home/data/models/carousel_item_model.dart';

class HeroCarouselSlide extends StatelessWidget {
  const HeroCarouselSlide({super.key, required this.item});
  final CarouselItemModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          item.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const ColoredBox(
            color: AppColors.brownMedium,
            child: Center(
              child: Icon(
                Icons.image_outlined,
                color: AppColors.creamLight,
                size: 64,
              ),
            ),
          ),
        ),
        IgnorePointer(child: const ColoredBox(color: Color(0x22000000))),
        // Title overlay at bottom-left
        if (item.title != null)
          Positioned(
            bottom: 32,
            left: 20,
            right: 80,
            child: IgnorePointer(
              child: Text(
                item.title!,
                style: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black54)],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
