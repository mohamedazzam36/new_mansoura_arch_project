import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

class HeroCarouselIndicator extends StatelessWidget {
  const HeroCarouselIndicator({super.key, required this.isActive, required this.onTap});
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.animMedium,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: isActive ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: isActive ? AppColors.brownPrimary : AppColors.creamDark,
          borderRadius: BorderRadius.circular(AppConstants.radiusCircle),
        ),
      ),
    );
  }
}
