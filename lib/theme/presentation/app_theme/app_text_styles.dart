import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Centralised text theme builder.
/// Change the font family here and it updates everywhere.
class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Manrope';

  /// Base theme with NO colors — colors are applied per-brightness in AppTheme.
  static const TextTheme baseTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: _fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: _fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
  );

  /// Light-mode text theme (dark text on light background)
  static TextTheme get lightTextTheme => baseTextTheme.apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
  );

  /// Dark-mode text theme (light text on dark background)
  static TextTheme get darkTextTheme => baseTextTheme.apply(
    bodyColor: AppColors.darkTextPrimary,
    displayColor: AppColors.darkTextPrimary,
  );
}
