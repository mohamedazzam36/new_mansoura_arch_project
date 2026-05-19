import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';

/// A styled section heading with an optional decorative underline accent.
///
/// Automatically scales font size based on screen size.
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.color = AppColors.textPrimary,
    this.showAccent = true,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final Color color;

  /// Whether to show the small brown accent bar beneath the title.
  final bool showAccent;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    final TextStyle style = isMobile
        ? AppTextStyles.headingMedium.copyWith(color: color)
        : isDesktop
            ? AppTextStyles.headingLarge.copyWith(color: color)
            : AppTextStyles.headingMedium.copyWith(
                fontSize: 28,
                color: color,
              );

    return Column(
      crossAxisAlignment: textAlign == TextAlign.start
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: style, textAlign: textAlign),
        if (showAccent) ...[
          const SizedBox(height: 12),
          Container(
            width: 48,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.brownAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ],
    );
  }
}
