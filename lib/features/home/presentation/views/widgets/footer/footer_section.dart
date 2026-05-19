import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'footer_copyright_block.dart';
import 'footer_logos_row.dart';

/// Footer section with logos and copyright.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);

    return Container(
      color: AppColors.footerBackground,
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: AppConstants.spaceLg,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // --- Copyright (centered) ---
              const FooterCopyrightBlock(center: true),

              // --- Divider ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: AppColors.footerText.withValues(alpha: 0.15),
                  thickness: 1,
                ),
              ),

              // --- Logos row ---
              FooterLogosRow(isDesktop: ResponsiveHelper.isDesktop(context)),

              // --- Powered By ---
              const SizedBox(height: 32),
              Text(
                'Powered by CZ-Team',
                style: AppTextStyles.footerText.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.footerText.withValues(alpha: 0.4),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
