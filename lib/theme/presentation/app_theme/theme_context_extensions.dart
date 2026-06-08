import 'package:flutter/material.dart';

import 'custom_theme_colors.dart';

extension ThemeContextExtensions on BuildContext {
  CustomThemeColors get appColors =>
      Theme.of(this).extension<CustomThemeColors>()!;

  TextTheme get appTextStyles => Theme.of(this).textTheme;
}
