import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';

class FooterCopyrightBlock extends StatelessWidget {
  const FooterCopyrightBlock({super.key, this.center = false});
  final bool center;

  @override
  Widget build(BuildContext context) {
    final align = center ? TextAlign.center : TextAlign.start;
    final cross = center ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: cross,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '© 2029 Architectural Engineering Department',
          style: AppTextStyles.footerText,
          textAlign: align,
        ),
        Text(
          '— Mansoura University',
          style: AppTextStyles.footerText.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.footerText,
          ),
          textAlign: align,
        ),
        const SizedBox(height: 24),
        Text(
          'Supervised By',
          style: AppTextStyles.footerText.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.footerText.withValues(alpha: 0.7),
          ),
          textAlign: align,
        ),
        const SizedBox(height: 4),
        Text(
          '( Prof. Mokhtar Akl )',
          style: AppTextStyles.footerText.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.brownAccent,
            letterSpacing: 1.1,
          ),
          textAlign: align,
        ),
        const SizedBox(height: 12),
        Text(
          '( Eng / Aya )  ,  ( Eng / Eslam )  ,  ( Eng / Shrouk )',
          style: AppTextStyles.footerText.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.footerText.withValues(alpha: 0.9),
            letterSpacing: 0.5,
          ),
          textAlign: align,
        ),
      ],
    );
  }
}
