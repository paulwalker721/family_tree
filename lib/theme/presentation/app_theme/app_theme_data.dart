import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'custom_theme_colors.dart';
import 'otp_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Common helpers
// ─────────────────────────────────────────────────────────────────────────────

/// Shared constants so both themes stay in sync.
class _C {
  static const double radius = 12.0;
  static const double cardRadius = 16.0;
  static const double chipRadius = 50.0;

  static OutlineInputBorder inputBorder({
    Color color = Colors.transparent,
    double width = 1.0,
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color, width: width),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// AppTheme
// ─────────────────────────────────────────────────────────────────────────────

class AppTheme {
  AppTheme._();

  // ── 🌞 Light Theme ──────────────────────────────────────────────────────────
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    brightness: Brightness.light,

    // Scaffold & primary
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primaryDark,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primary,
      surface: Colors.white,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.red,
      onError: AppColors.white,
    ),

    // ── AppBar ────────────────────────────────────────────────────────────
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
    ),

    // ── Text ──────────────────────────────────────────────────────────────
    textTheme: AppTextStyles.lightTextTheme,

    // ── TabBar ────────────────────────────────────────────────────────────
    tabBarTheme: TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyles.baseTextTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w800,
        height: 1.0,
      ),
      labelColor: AppColors.white,
      unselectedLabelStyle: AppTextStyles.baseTextTheme.titleSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.0,
      ),
      unselectedLabelColor: const Color(0xFF181818),
      splashBorderRadius: BorderRadius.circular(_C.chipRadius),
      indicator: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff0A61FF), Color(0xff0040B0)],
        ),
        borderRadius: BorderRadius.circular(_C.chipRadius),
      ),
    ),

    // ── Elevated Button ───────────────────────────────────────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        disabledBackgroundColor: AppColors.disabledGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_C.radius),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // ── Text Button ───────────────────────────────────────────────────────
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),

    // ── Checkbox ──────────────────────────────────────────────────────────
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkColor: const WidgetStatePropertyAll(AppColors.white),
      fillColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? AppColors.primary : null,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // ── Input Decoration ──────────────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: _C.inputBorder(),
      enabledBorder: _C.inputBorder(),
      focusedBorder: _C.inputBorder(color: AppColors.primaryDark, width: 1.5),
      errorBorder: _C.inputBorder(color: AppColors.red),
      focusedErrorBorder: _C.inputBorder(color: AppColors.red, width: 1.5),
      hintStyle: const TextStyle(
        fontSize: 14,
        color: AppColors.textLight,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.red,
        height: 1.3,
      ),
    ),

    // ── Card ──────────────────────────────────────────────────────────────
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_C.cardRadius),
      ),
    ),

    // ── Chip ──────────────────────────────────────────────────────────────
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.cultured,
      selectedColor: AppColors.primary,
      secondarySelectedColor: AppColors.primaryDark,
      labelStyle: const TextStyle(color: AppColors.black),
      secondaryLabelStyle: const TextStyle(color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    // ── Divider ───────────────────────────────────────────────────────────
    dividerColor: AppColors.grey,
    dividerTheme: const DividerThemeData(color: AppColors.grey, thickness: 1),

    // ── Bottom Nav Bar ────────────────────────────────────────────────────
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 26),
      type: BottomNavigationBarType.fixed,
    ),

    // ── SnackBar ──────────────────────────────────────────────────────────
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.black,
      contentTextStyle: TextStyle(color: AppColors.white),
    ),

    // ── Dialog ────────────────────────────────────────────────────────────
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_C.cardRadius),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      contentTextStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.spanishGray,
      ),
    ),

    // ── Bottom Sheet ──────────────────────────────────────────────────────
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.dialogueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // ── Date Picker ───────────────────────────────────────────────────────
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.white,
      dayBackgroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.selected)) return AppColors.primary;
        return null;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) return AppColors.grey;
        if (s.contains(WidgetState.selected)) return AppColors.white;
        return AppColors.black;
      }),
      todayForegroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) return AppColors.grey;
        return AppColors.primary;
      }),
      todayBackgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      headerForegroundColor: AppColors.black,
      weekdayStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),

    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffF9FAFA),
      elevation: 10,
      position: PopupMenuPosition.under,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      textStyle: AppTextStyles.lightTextTheme.bodySmall,
    ),

    // ── Extensions ────────────────────────────────────────────────────────
    extensions: <ThemeExtension<dynamic>>[
      const CustomThemeColors(
        negativeColor: AppColors.black,
        cardBackgroundHigh: AppColors.white,
        viewAllTextColor: AppColors.primary,
        cardBackgroundLow: AppColors.white,
        cardBackgroundMedium: AppColors.white,
        borderColor: AppColors.white,
        primary: AppColors.primary,
        dialogueColor: AppColors.dialogueColor,
        sheetBackgroundColor: AppColors.white,
        surfaceTint: AppColors.cultured,
        primaryAccent: Color(0xFFDDE9FF),
        onCancel: AppColors.disabledGrey,
        iconColor: AppColors.primary,
        dividerColor: AppColors.grey,
        bottomNavBarBackground: AppColors.white,
        subHeadingColor: Color(
          0x99000000,
        ), // AppColors.black.withValues(alpha: 0.6) but const-compatible
        overlayColor: Color(0xffF9FAFA),
        primaryOrWhite: AppColors.primary,
      ),
      OtpTheme.light(AppTextStyles.lightTextTheme),
    ],
  );

  // ── 🌙 Dark Theme ───────────────────────────────────────────────────────────
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    brightness: Brightness.dark,

    // Scaffold & primary
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.primary,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,

      primary: AppColors.primary,
      onPrimary: AppColors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      error: AppColors.red,
      onError: AppColors.white,
    ),

    // ── AppBar ────────────────────────────────────────────────────────────
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: AppColors.darkBackground,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // ── Text ──────────────────────────────────────────────────────────────
    textTheme: AppTextStyles.darkTextTheme,

    // ── TabBar ────────────────────────────────────────────────────────────
    tabBarTheme: TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyles.baseTextTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w800,
        height: 1.0,
      ),
      labelColor: AppColors.white,
      unselectedLabelStyle: AppTextStyles.baseTextTheme.titleSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.0,
      ),
      unselectedLabelColor: AppColors.darkTextSecondary,
      splashBorderRadius: BorderRadius.circular(_C.chipRadius),
      indicator: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff0A61FF), Color(0xff0040B0)],
        ),
        borderRadius: BorderRadius.circular(_C.chipRadius),
      ),
    ),

    // ── Elevated Button ───────────────────────────────────────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        disabledBackgroundColor: AppColors.darkField,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_C.radius),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // ── Text Button ───────────────────────────────────────────────────────
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),

    // ── Checkbox ──────────────────────────────────────────────────────────
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkColor: const WidgetStatePropertyAll(AppColors.white),
      overlayColor: WidgetStatePropertyAll(
        AppColors.primary.withValues(alpha: 0.2),
      ),
      fillColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? AppColors.primary : null,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // ── Input Decoration ──────────────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0x330254B8).withValues(alpha: .20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: _C.inputBorder(color: const Color(0x140254B8).withAlpha(8)),
      enabledBorder: _C.inputBorder(
        color: const Color(0x140254B8).withAlpha(20),
      ),
      focusedBorder: _C.inputBorder(color: AppColors.primary, width: 1.5),
      errorBorder: _C.inputBorder(color: AppColors.red),
      focusedErrorBorder: _C.inputBorder(color: AppColors.red, width: 1.5),
      disabledBorder: _C.inputBorder(
        color: const Color(0x140254B8).withValues(alpha: 0.5),
      ),
      hintStyle: const TextStyle(
        fontSize: 14,
        color: AppColors.darkTextSecondary,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: AppColors.darkTextSecondary,
      suffixIconColor: AppColors.darkTextSecondary,
      errorStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.red,
        height: 1.3,
      ),
    ),

    // ── Card ──────────────────────────────────────────────────────────────
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_C.cardRadius),
      ),
    ),

    // ── Chip ──────────────────────────────────────────────────────────────
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkField,
      selectedColor: AppColors.primary,
      secondarySelectedColor: AppColors.primaryDark,
      labelStyle: const TextStyle(color: AppColors.darkTextPrimary),
      secondaryLabelStyle: const TextStyle(color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    // ── Icon ──────────────────────────────────────────────────────────────
    iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),

    // ── Divider ───────────────────────────────────────────────────────────
    dividerColor: AppColors.darkBorder,
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
    ),

    // ── Bottom Nav Bar ────────────────────────────────────────────────────
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0x4D0254B8),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.darkTextSecondary,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 26),
      type: BottomNavigationBarType.fixed,
    ),

    // ── SnackBar ──────────────────────────────────────────────────────────
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkCard,
      contentTextStyle: const TextStyle(color: AppColors.darkTextPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_C.radius),
      ),
      behavior: SnackBarBehavior.floating,
    ),

    // ── Dialog ────────────────────────────────────────────────────────────
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_C.cardRadius),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
      ),
      contentTextStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.darkTextSecondary,
      ),
    ),

    // ── Bottom Sheet ──────────────────────────────────────────────────────
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.dialogueColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // ── Date Picker ───────────────────────────────────────────────────────
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.darkCard,
      dayBackgroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.selected)) return AppColors.primary;
        return null;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) {
          return AppColors.darkTextSecondary;
        }
        if (s.contains(WidgetState.selected)) return AppColors.white;
        return AppColors.darkTextPrimary;
      }),
      todayForegroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) {
          return AppColors.darkTextSecondary;
        }
        return AppColors.primary;
      }),
      todayBackgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      headerForegroundColor: AppColors.darkTextPrimary,
      weekdayStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextSecondary,
      ),
    ),

    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xff045FD0),
      elevation: 10,
      position: PopupMenuPosition.under,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      textStyle: AppTextStyles.darkTextTheme.bodySmall,
    ),

    // ── Extensions ────────────────────────────────────────────────────────
    extensions: <ThemeExtension<dynamic>>[
      CustomThemeColors(
        negativeColor: AppColors.darkTextPrimary,
        cardBackgroundHigh: AppColors.darkCard,
        cardBackgroundLow: AppColors.smallCard,
        viewAllTextColor: AppColors.white,
        cardBackgroundMedium: const Color(0xff0254B8).withValues(alpha: .20),
        borderColor: const Color(0x140254B8),
        primary: AppColors.primary,
        dialogueColor: AppColors.dialogueColorDark,
        sheetBackgroundColor: const Color(0xFF032144),
        surfaceTint: AppColors.darkField,
        primaryAccent: AppColors.primary.withValues(alpha: 0.15),
        onCancel: AppColors.darkField,
        iconColor: Colors.white,
        dividerColor: AppColors.darkBorder,
        bottomNavBarBackground: const Color(0xff0254B8).withValues(alpha: .30),
        subHeadingColor: AppColors.darkTextPrimary,
        overlayColor: const Color(0xff045FD0),
        primaryOrWhite: Colors.white,
      ),
      OtpTheme.dark(AppTextStyles.darkTextTheme),
    ],
  );
}
