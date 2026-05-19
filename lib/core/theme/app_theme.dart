import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

/// Global ThemeData configuration for the New Mansoura Architecture app.
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.brownPrimary,
        onPrimary: AppColors.textOnDark,
        secondary: AppColors.brownAccent,
        onSecondary: AppColors.textPrimary,
        error: Color(0xFFB00020),
        onError: Colors.white,
        surface: AppColors.creamLight,
        onSurface: AppColors.textPrimary,
      ),
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appBarText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.appBarTitle,
        iconTheme: IconThemeData(color: AppColors.appBarText),
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.display,
        displayMedium: AppTextStyles.displayMedium,
        headlineLarge: AppTextStyles.headingLarge,
        headlineMedium: AppTextStyles.headingMedium,
        headlineSmall: AppTextStyles.headingSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.button,
        labelSmall: AppTextStyles.label,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brownPrimary,
          foregroundColor: AppColors.textOnDark,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 0,
      ),
    );
  }
}
