import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppConstants.animFast,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.brownPrimary.withValues(alpha: 0.85)
                : _hovered
                ? AppColors.brownPrimary.withValues(alpha: 0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: widget.isActive || _hovered
                    ? AppColors.brownAccent
                    : AppColors.footerText,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  widget.label,
                  style: AppTextStyles.navLink.copyWith(
                    color: widget.isActive
                        ? AppColors.appBarText
                        : _hovered
                        ? AppColors.brownAccent
                        : AppColors.footerText,
                    fontWeight: widget.isActive
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ),
              if (widget.isActive)
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: AppColors.brownAccent,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
