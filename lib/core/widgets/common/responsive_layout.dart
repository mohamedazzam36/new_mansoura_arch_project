import 'package:flutter/material.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';

/// A layout switcher that renders a different widget based on screen size.
///
/// Usage:
/// ```dart
/// ResponsiveLayout(
///   mobile: MobileView(),
///   tablet: TabletView(),   // optional — falls back to mobile
///   desktop: DesktopView(),
/// )
/// ```
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = ResponsiveHelper.fromConstraints(constraints);
        return switch (size) {
          ScreenSize.mobile => mobile,
          ScreenSize.tablet => tablet ?? mobile,
          ScreenSize.desktop => desktop,
        };
      },
    );
  }
}
