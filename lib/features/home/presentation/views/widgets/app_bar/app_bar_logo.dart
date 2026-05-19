import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Mansoura', style: AppTextStyles.appBarTitle),
            Text(
              'development project',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.brownAccent,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
