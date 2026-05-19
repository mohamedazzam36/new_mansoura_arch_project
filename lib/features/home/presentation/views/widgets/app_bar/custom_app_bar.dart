import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'app_bar_logo.dart';
import 'app_bar_nav_link.dart';

class _NavItem {
  const _NavItem({required this.label, required this.sectionKey});
  final String label;
  final String sectionKey;
}

/// Top app bar. On mobile/tablet shows hamburger; on desktop shows inline nav.
/// The hamburger calls [onMenuTap] to open the side drawer.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.onMenuTap, this.onLogoTap, this.onNavItemTap});

  final VoidCallback? onMenuTap;
  final VoidCallback? onLogoTap;
  final void Function(String)? onNavItemTap;

  static const List<_NavItem> _navItems = [
    _NavItem(label: 'Vision', sectionKey: 'vision'),
    _NavItem(label: 'Video', sectionKey: 'video'),
    _NavItem(label: 'Contact', sectionKey: 'contact'),
  ];

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppConstants.appBarHeightDesktop);

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return AppBar(
      backgroundColor: AppColors.appBarBackground,
      toolbarHeight: AppConstants.appBarHeightDesktop,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.pagePadding(context),
        ),
        child: Row(
          children: [
            // Desktop inline nav
            if (isDesktop)
              Row(
                children: _navItems
                    .map((item) => AppBarNavLink(
                          label: item.label,
                          onTap: () => onNavItemTap?.call(item.sectionKey),
                        ))
                    .toList(),
              )
            // Mobile/Tablet hamburger → opens side drawer
            else
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.appBarText),
                onPressed: onMenuTap,
                tooltip: 'Menu',
              ),
            const Spacer(),
            AppBarLogo(onTap: onLogoTap),
          ],
        ),
      ),
    );
  }
}
