/// App-wide design constants: spacing, border radii, breakpoints, durations.
class AppConstants {
  AppConstants._();

  // --- Responsive Breakpoints ---
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  // --- Spacing Scale (8-pt grid) ---
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 16;
  static const double spaceLg = 24;
  static const double spaceXl = 32;
  static const double space2xl = 48;
  static const double space3xl = 64;
  static const double space4xl = 96;

  // --- Section Vertical Padding ---
  static const double sectionPaddingMobile = 48;
  static const double sectionPaddingTablet = 64;
  static const double sectionPaddingDesktop = 96;

  // --- Horizontal Page Padding ---
  static const double pagePaddingMobile = 20;
  static const double pagePaddingTablet = 40;
  static const double pagePaddingDesktop = 80;

  // --- Max Content Width ---
  static const double maxContentWidth = 1200;

  // --- Border Radii ---
  static const double radiusSm = 4;
  static const double radiusMd = 8;
  static const double radiusLg = 12;
  static const double radiusXl = 20;
  static const double radiusCircle = 9999;

  // --- Elevation ---
  static const double elevationSm = 2;
  static const double elevationMd = 6;
  static const double elevationLg = 16;

  // --- Animation Durations ---
  static const Duration animFast = Duration(milliseconds: 200);
  static const Duration animMedium = Duration(milliseconds: 400);
  static const Duration animSlow = Duration(milliseconds: 700);

  // --- Carousel ---
  static const Duration carouselAutoScrollInterval = Duration(seconds: 4);
  static const Duration carouselTransitionDuration = Duration(milliseconds: 600);

  // --- Hero Carousel Height ---
  static const double heroHeightMobile = 260;
  static const double heroHeightTablet = 380;
  static const double heroHeightDesktop = 520;

  // --- AppBar ---
  static const double appBarHeightMobile = 56;
  static const double appBarHeightDesktop = 70;
}
