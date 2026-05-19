import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'package:nour_arch/core/widgets/common/animated_fade_widget.dart';
import 'member_card.dart';

/// Displays the 3 project members as premium tap-to-navigate cards.
class MembersSection extends StatelessWidget {
  const MembersSection({super.key, required this.members});

  final List<MemberModel> members;

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);
    final vPad = ResponsiveHelper.sectionPadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      color: AppColors.creamLight,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: AnimatedFadeWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section heading
                Text(
                  'Project Team',
                  style: AppTextStyles.headingLarge.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 48,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.brownAccent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 32),

                // Member cards
                isMobile
                    ? Column(
                        children: members
                            .map(
                              (m) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: MemberCard(member: m),
                              ),
                            )
                            .toList(),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: members.map((m) {
                          final idx = members.indexOf(m);
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: idx < members.length - 1 ? 16 : 0,
                              ),
                              child: MemberCard(member: m),
                            ),
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
