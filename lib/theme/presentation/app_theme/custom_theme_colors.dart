import 'package:flutter/material.dart';

/// Per-brightness semantic color tokens exposed as a [ThemeExtension].
/// Access via: `Theme.of(context).extension<CustomThemeColors>()!`
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color cardBackgroundHigh;
  final Color cardBackgroundLow;
  final Color cardBackgroundMedium;
  final Color negativeColor; // black in light / white in dark
  final Color primary;
  final Color viewAllTextColor;
  final Color dialogueColor;
  final Color sheetBackgroundColor;
  final Color surfaceTint; // input fill tint
  final Color primaryAccent; // lighter primary tint for highlights
  final Color onCancel; // cancel button background
  final Color iconColor;
  final Color dividerColor;
  final Color borderColor;
  final Color bottomNavBarBackground;
  final Color subHeadingColor;
  final Color overlayColor;
  final Color primaryOrWhite;

  const CustomThemeColors({
    required this.cardBackgroundHigh,
    required this.cardBackgroundLow,
    required this.cardBackgroundMedium,
    required this.negativeColor,
    required this.primary,
    required this.viewAllTextColor,
    required this.dialogueColor,
    required this.sheetBackgroundColor,
    required this.surfaceTint,
    required this.primaryAccent,
    required this.onCancel,
    required this.iconColor,
    required this.dividerColor,
    required this.borderColor,
    required this.bottomNavBarBackground,
    required this.subHeadingColor,
    required this.overlayColor,
    required this.primaryOrWhite,
  });

  @override
  CustomThemeColors copyWith({
    Color? cardBackgroundHigh,
    Color? cardBackgroundLow,
    Color? cardBackgroundMedium,
    Color? negativeColor,
    Color? viewAllTextColor,
    Color? primary,
    Color? sheetBackgroundColor,
    Color? surfaceTint,
    Color? primaryAccent,
    Color? onCancel,
    Color? iconColor,
    Color? dividerColor,
    Color? borderColor,
    Color? bottomNavBarBackground,
    Color? dialogueColor,
    Color? subHeadingColor,
    Color? overlayColor,
    Color? primaryOrWhite,
  }) {
    return CustomThemeColors(
      cardBackgroundHigh: cardBackgroundHigh ?? this.cardBackgroundHigh,
      cardBackgroundLow: cardBackgroundLow ?? this.cardBackgroundLow,
      cardBackgroundMedium: cardBackgroundMedium ?? this.cardBackgroundMedium,
      negativeColor: negativeColor ?? this.negativeColor,
      primary: primary ?? this.primary,
      viewAllTextColor: viewAllTextColor ?? this.viewAllTextColor,
      sheetBackgroundColor: sheetBackgroundColor ?? this.sheetBackgroundColor,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      primaryAccent: primaryAccent ?? this.primaryAccent,
      onCancel: onCancel ?? this.onCancel,
      iconColor: iconColor ?? this.iconColor,
      dividerColor: dividerColor ?? this.dividerColor,
      borderColor: borderColor ?? this.borderColor,
      bottomNavBarBackground:
          bottomNavBarBackground ?? this.bottomNavBarBackground,
      dialogueColor: dialogueColor ?? this.dialogueColor,
      subHeadingColor: subHeadingColor ?? this.subHeadingColor,
      overlayColor: overlayColor ?? this.overlayColor,
      primaryOrWhite: primaryOrWhite ?? this.primaryOrWhite,
    );
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) return this;
    return CustomThemeColors(
      cardBackgroundHigh: Color.lerp(
        cardBackgroundHigh,
        other.cardBackgroundHigh,
        t,
      )!,
      cardBackgroundLow: Color.lerp(
        cardBackgroundLow,
        other.cardBackgroundLow,
        t,
      )!,
      cardBackgroundMedium: Color.lerp(
        cardBackgroundMedium,
        other.cardBackgroundMedium,
        t,
      )!,
      viewAllTextColor: Color.lerp(
        viewAllTextColor,
        other.viewAllTextColor,
        t,
      )!,
      negativeColor: Color.lerp(negativeColor, other.negativeColor, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      dialogueColor: Color.lerp(dialogueColor, other.dialogueColor, t)!,
      sheetBackgroundColor: Color.lerp(
        sheetBackgroundColor,
        other.sheetBackgroundColor,
        t,
      )!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      primaryAccent: Color.lerp(primaryAccent, other.primaryAccent, t)!,
      onCancel: Color.lerp(onCancel, other.onCancel, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      bottomNavBarBackground: Color.lerp(
        bottomNavBarBackground,
        other.bottomNavBarBackground,
        t,
      )!,
      subHeadingColor: Color.lerp(subHeadingColor, other.subHeadingColor, t)!,
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t)!,
      primaryOrWhite: Color.lerp(primaryOrWhite, other.primaryOrWhite, t)!,
    );
  }
}
