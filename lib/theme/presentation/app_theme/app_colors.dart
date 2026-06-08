import 'package:flutter/material.dart';

class AppColors {
  // ── Brand ──────────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF0254B8);
  static const Color primaryDark = Color(0xff0254B8);
  static const Color dialogueColor = Color(0xFFF6F6F6);
  static const Color dialogueColorDark = Color(0xFF000D1C);

  static Color primaryGrey = const Color(0xff181818).withValues(alpha: 0.6);
  static Color get primaryGry => primaryGrey;

  // ── Neutrals ───────────────────────────────────────────────────────────────
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color cultured = Color(0xFFF6F6F6);
  static const Color disabledGrey = Color(0xFFE7E7E8);
  static const Color grey = Color(0xFFA6A7A8);
  static const Color spanishGray = Color(0xFF9E9E9E);
  static const Color gry = Color(0xFFEAEAEA);

  // ── Semantic ───────────────────────────────────────────────────────────────
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color orangeRed = Color(0xFFFF5C28);

  // ── Light-mode surfaces ────────────────────────────────────────────────────
  static const Color background = Color(0xFFF9FAFA);
  static const Color textLight = Color(0xFF898A8D);
  static const Color textExtraLight = Color(0xFFF7F7F7);
  static const Color lightBlue = Color(0xFF92FFD8);
  static const Color transparent = Colors.transparent;

  // ── Dark-mode surfaces ─────────────────────────────────────────────────────
  /// Main scaffold background in dark mode
  static const Color darkBackground = Color(0xFF0D1117);

  /// Card / sheet surface in dark mode
  static const Color darkSurface = Color(0xFF161B22);

  /// Elevated card in dark mode
  static Color darkCard = const Color(0xff0254B8).withValues(alpha: 0.30);
  static Color smallCard = const Color(0xff0254B8).withValues(alpha: 0.08);

  /// Input field fill in dark mode
  static const Color darkField = Color(0xFF21262D);

  /// Subtle divider / border in dark mode
  static const Color darkBorder = Color(0xFF30363D);

  /// Body text in dark mode
  static const Color darkTextPrimary = Color(0xFFE6EDF3);

  /// Secondary / hint text in dark mode
  static const Color darkTextSecondary = Color(0xFF8B949E);
}
