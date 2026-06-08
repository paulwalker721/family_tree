import 'package:family_tree/family_tree_screen.dart';
import 'package:flutter/material.dart';

import 'theme/presentation/app_theme/app_text_styles.dart';
import 'theme/presentation/app_theme/custom_theme_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family Tree',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF73D7FF),
          brightness: Brightness.dark,
          primary: const Color(0xFF73D7FF),
          surface: const Color(0xFF06264D),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF000D1C),
        cardColor: const Color(0xFF062A56),
        textTheme: AppTextStyles.darkTextTheme,
        fontFamily: 'Manrope',
        useMaterial3: true,
        extensions: <ThemeExtension<dynamic>>[
          CustomThemeColors(
            negativeColor: Colors.white,
            cardBackgroundHigh: const Color(0xFF062A56),
            cardBackgroundLow: const Color(0xFF042247),
            cardBackgroundMedium: const Color(0xFF073465),
            primary: const Color(0xFF73D7FF),
            viewAllTextColor: Colors.white,
            dialogueColor: const Color(0xFF071A34),
            sheetBackgroundColor: const Color(0xFF000D1C),
            surfaceTint: const Color(0xFF0A315D),
            primaryAccent: const Color(0xFF73D7FF).withValues(alpha: .18),
            onCancel: const Color(0xFF17375C),
            iconColor: Colors.white,
            dividerColor: const Color(0xFF9AB8D4).withValues(alpha: .48),
            borderColor: const Color(0xFF9AB8D4).withValues(alpha: .18),
            bottomNavBarBackground: const Color(0xFF001A36),
            subHeadingColor: const Color(0xFFB7CDE3),
            overlayColor: const Color(0xFF0A315D),
            primaryOrWhite: Colors.white,
          ),
        ],
      ),
      home: const FamilyTreeScreen(),
    );
  }
}
