import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'package:nour_arch/core/widgets/common/section_title.dart';
import 'package:nour_arch/core/widgets/common/animated_fade_widget.dart';
import 'package:nour_arch/core/widgets/common/responsive_layout.dart';

/// "The Vision of New Mansoura" section.
/// Stacks vertically on mobile/tablet; side-by-side on desktop.
class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  static const String _title = 'The Vision of\nNew Mansoura';
  static const String _body =
      'A comprehensive urban development initiative reshaping the modern '
      'landscape through innovative architectural solutions and '
      'community-focused design. New Mansoura stands as a beacon of '
      'Egypt\'s future — a city built for sustainability, culture, and progress.\n\n'
      'This project is a graduation work by students of the Architectural Engineering '
      'Department, presenting a new vision for public space, monument design, and urban '
      'identity along the Mediterranean coastline.';

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);
    final vPad = ResponsiveHelper.sectionPadding(context);

    return Container(
      color: AppColors.cream,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: AnimatedFadeWidget(
            child: ResponsiveLayout(
              mobile: _MobileLayout(title: _title, body: _body),
              desktop: _DesktopLayout(title: _title, body: _body),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        const SizedBox(height: 20),
        Text(body, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Title takes 40% width
        Expanded(
          flex: 4,
          child: SectionTitle(title: title),
        ),
        const SizedBox(width: 64),
        // Right: Body text
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(body, style: AppTextStyles.bodyLarge),
          ),
        ),
      ],
    );
  }
}
