import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';

class VideoInfoPanel extends StatelessWidget {
  const VideoInfoPanel({
    super.key,
    required this.title,
    required this.description,
    required this.designer,
  });

  final String title;
  final String description;
  final String designer;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.headingSmall.copyWith(
                color: AppColors.appBarText,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 32,
              height: 2.5,
              decoration: BoxDecoration(
                color: AppColors.brownAccent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 14),
            if (description.isNotEmpty)
              Text(
                description,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.footerText,
                ),
              ),
            if (description.isNotEmpty) const SizedBox(height: 16),
            Divider(
              color: AppColors.footerText.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.movie_outlined,
                  size: 16,
                  color: AppColors.brownAccent,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    designer,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.brownAccent,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
