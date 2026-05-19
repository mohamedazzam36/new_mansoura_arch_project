import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';

class MemberSectionHeader extends StatelessWidget {
  const MemberSectionHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, 36, hPad, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.headingSmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.brownAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
