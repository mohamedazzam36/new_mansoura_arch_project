import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'package:nour_arch/features/member/presentation/views/member_view.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key, required this.member});
  final MemberModel member;

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MemberView(member: widget.member)),
        ),
        child: AnimatedContainer(
          duration: AppConstants.animMedium,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _hovered
                  ? [AppColors.brownPrimary, AppColors.brownDeep]
                  : [AppColors.brownDeep, const Color(0xFF100805)],
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusLg),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? AppColors.brownPrimary.withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.15),
                blurRadius: _hovered ? 24 : 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar circle
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.brownAccent.withValues(alpha: 0.2),
                child: Text(
                  widget.member.name[0],
                  style: AppTextStyles.headingMedium.copyWith(
                    color: AppColors.brownAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                widget.member.name,
                style: AppTextStyles.headingSmall.copyWith(
                  color: AppColors.creamLight,
                ),
              ),
              const SizedBox(height: 6),

              // Role
              Text(
                widget.member.projectName,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.brownAccent,
                ),
              ),
              const SizedBox(height: 24),

              // CTA row
              Row(
                children: [
                  Text(
                    'View Projects',
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.creamDark,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedSlide(
                    offset: _hovered ? const Offset(0.3, 0) : Offset.zero,
                    duration: AppConstants.animFast,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.brownAccent,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
