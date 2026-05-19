import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

class AppBarNavLink extends StatefulWidget {
  const AppBarNavLink({super.key, required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  State<AppBarNavLink> createState() => _AppBarNavLinkState();
}

class _AppBarNavLinkState extends State<AppBarNavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: AppConstants.animFast,
            style: AppTextStyles.navLink.copyWith(
              color: _hovered ? AppColors.brownAccent : AppColors.appBarText,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
