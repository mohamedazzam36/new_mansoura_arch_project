import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/asset_paths.dart';
import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'package:nour_arch/features/member/presentation/views/widgets/member_gallery_section.dart';
import 'package:nour_arch/features/member/presentation/views/widgets/member_perspective_section.dart';
import 'package:nour_arch/features/member/presentation/views/widgets/member_section_header.dart';

/// Full-page member portfolio: photos grid and 360° perspective.
class MemberView extends StatelessWidget {
  const MemberView({super.key, required this.member});

  final MemberModel member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appBarText,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(member.name, style: AppTextStyles.appBarTitle),
            Text(
              member.projectName,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.brownAccent,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Photos Section ────────────────────────────────────────
            const MemberSectionHeader(title: 'Gallery'),
            MemberGallerySection(images: member.images),

            // ── Perspective Section ──────────────────────────────────
            const MemberSectionHeader(title: 'Perspective'),
            MemberPerspectiveSection(
              assetPath: member.panoramaPath ?? AssetPaths.nourPanorama,
            ),

            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

