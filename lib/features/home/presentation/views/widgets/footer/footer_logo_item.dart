import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';

class FooterLogoItem extends StatelessWidget {
  const FooterLogoItem({
    super.key,
    required this.path,
    required this.label,
    required this.size,
  });

  final String path;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          path,
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => Icon(
            Icons.account_balance_outlined,
            size: size * 0.6,
            color: AppColors.footerText.withValues(alpha: 0.4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.footerText.withValues(alpha: 0.6),
            fontSize: 10,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
