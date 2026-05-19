import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';

class MediaDetailInfo extends StatelessWidget {
  const MediaDetailInfo({
    super.key,
    this.title,
    required this.description,
    required this.designer,
  });

  final String? title;
  final String description;
  final String designer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: AppTextStyles.headingSmall.copyWith(
                color: AppColors.textPrimary,
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
          ],
          if (description.isNotEmpty)
            Text(
              description,
              style: AppTextStyles.bodyMedium,
            ),
          if (description.isNotEmpty) const SizedBox(height: 16),
          const Divider(color: AppColors.divider),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                size: 16,
                color: AppColors.brownAccent,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  designer,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.brownPrimary,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
