import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography scale using Google Fonts equivalents via Flutter's native font
/// support. Playfair Display is used for headings (elegant serif),
/// Inter for body text (clean sans-serif).
class AppTextStyles {
  AppTextStyles._();

  // --- Display / Hero ---
  static const TextStyle display = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.15,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.3,
  );

  // --- Section Headings ---
  static const TextStyle headingLarge = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headingSmall = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.35,
  );

  // --- Body Text ---
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.7,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.65,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.6,
  );

  // --- Labels & Captions ---
  static const TextStyle label = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
    letterSpacing: 1.8,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    letterSpacing: 0.5,
  );

  // --- Navigation ---
  static const TextStyle navLink = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.appBarText,
    letterSpacing: 0.3,
  );

  // --- Button ---
  static const TextStyle button = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    letterSpacing: 0.8,
  );

  // --- Footer ---
  static const TextStyle footerText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.footerText,
    height: 1.6,
  );

  static const TextStyle footerLink = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.footerLink,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.footerLink,
  );

  // --- App Bar Title ---
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.appBarText,
    letterSpacing: 0.2,
  );
}
