import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/asset_paths.dart';
import 'footer_logo_item.dart';

class FooterLogosRow extends StatelessWidget {
  const FooterLogosRow({super.key, required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final logoSize = isDesktop ? 80.0 : 64.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Faculty of Engineering Logo
        FooterLogoItem(
          path: AssetPaths.facultyLogo,
          label: 'Faculty of Engineering',
          size: logoSize,
        ),

        // Separator
        Container(
          width: 1,
          height: logoSize * 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 28),
          color: AppColors.footerText.withValues(alpha: 0.2),
        ),

        // Department Logo
        FooterLogoItem(
          path: AssetPaths.departmentLogo,
          label: 'Architectural Engineering Dept.',
          size: logoSize,
        ),
      ],
    );
  }
}
