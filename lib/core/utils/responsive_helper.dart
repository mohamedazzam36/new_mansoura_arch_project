import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Screen size classification.
enum ScreenSize { mobile, tablet, desktop }

/// Helper class for responsive layout decisions.
/// Use [of] to get the current [ScreenSize] from any widget.
class ResponsiveHelper {
  ResponsiveHelper._();

  /// Returns the [ScreenSize] for the given [constraints] width.
  static ScreenSize fromConstraints(BoxConstraints constraints) {
    return fromWidth(constraints.maxWidth);
  }

  /// Returns the [ScreenSize] for the given [width].
  static ScreenSize fromWidth(double width) {
    if (width < AppConstants.mobileBreakpoint) return ScreenSize.mobile;
    if (width < AppConstants.tabletBreakpoint) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  /// Returns the [ScreenSize] from the nearest [BuildContext].
  static ScreenSize of(BuildContext context) {
    return fromWidth(MediaQuery.of(context).size.width);
  }

  // --- Convenience booleans ---
  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;

  static bool isTablet(BuildContext context) =>
      of(context) == ScreenSize.tablet;

  static bool isDesktop(BuildContext context) =>
      of(context) == ScreenSize.desktop;

  static bool isMobileOrTablet(BuildContext context) =>
      of(context) != ScreenSize.desktop;

  // --- Responsive value helpers ---

  /// Returns a value based on the current screen size.
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    final size = of(context);
    return switch (size) {
      ScreenSize.mobile => mobile,
      ScreenSize.tablet => tablet ?? mobile,
      ScreenSize.desktop => desktop,
    };
  }

  // --- Spacing helpers ---
  static double sectionPadding(BuildContext context) => value(
        context,
        mobile: AppConstants.sectionPaddingMobile,
        tablet: AppConstants.sectionPaddingTablet,
        desktop: AppConstants.sectionPaddingDesktop,
      );

  static double pagePadding(BuildContext context) => value(
        context,
        mobile: AppConstants.pagePaddingMobile,
        tablet: AppConstants.pagePaddingTablet,
        desktop: AppConstants.pagePaddingDesktop,
      );

  static double heroHeight(BuildContext context) => value(
        context,
        mobile: AppConstants.heroHeightMobile,
        tablet: AppConstants.heroHeightTablet,
        desktop: AppConstants.heroHeightDesktop,
      );
}
