import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'drawer_item.dart';

class NavEntry {
  const NavEntry(this.icon, this.label, this.section);
  final IconData icon;
  final String label;
  final HomeSection section;
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.onNavTap,
    required this.onMemberTap,
    required this.members,
  });

  final void Function(HomeSection) onNavTap;
  final void Function(MemberModel) onMemberTap;
  final List<MemberModel> members;

  static const _navItems = [
    NavEntry(Icons.home_outlined, 'Home', HomeSection.hero),
    NavEntry(Icons.visibility_outlined, 'Vision', HomeSection.vision),
    NavEntry(Icons.play_circle_outline, 'Video', HomeSection.video),
    NavEntry(Icons.location_on_outlined, 'Contact', HomeSection.contact),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.appBarBackground,
      width: 280,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New Mansoura', style: AppTextStyles.appBarTitle),
                  const SizedBox(height: 4),
                  Text(
                    'Development Project',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.brownAccent,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.footerText.withValues(alpha: 0.15),
              thickness: 1,
            ),
            const SizedBox(height: 8),
            BlocBuilder<HomeCubit, HomeSection>(
              builder: (ctx, active) => Column(
                children: _navItems
                    .map((e) => DrawerItem(
                          icon: e.icon,
                          label: e.label,
                          isActive: e.section == active,
                          onTap: () => onNavTap(e.section),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: AppColors.brownAccent.withValues(alpha: 0.4),
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.group_outlined, size: 14, color: AppColors.brownAccent),
                      const SizedBox(width: 8),
                      Text(
                        'Team Members',
                        style: AppTextStyles.headingSmall.copyWith(
                          color: AppColors.brownAccent,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
            ...members.map(
              (m) => DrawerItem(
                icon: Icons.person_outline,
                label: m.name,
                isActive: false,
                onTap: () => onMemberTap(m),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
