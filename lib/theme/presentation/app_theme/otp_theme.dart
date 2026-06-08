import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'app_colors.dart';

/// Specialized theme for OTP inputs using the Pinput package.
/// Access via `Theme.of(context).extension<OtpTheme>()!`.
class OtpTheme extends ThemeExtension<OtpTheme> {
  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  final PinTheme submittedPinTheme;
  final PinTheme errorPinTheme;

  const OtpTheme({
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.submittedPinTheme,
    required this.errorPinTheme,
  });

  /// Presets for light mode.
  static OtpTheme light(TextTheme textTheme) {
    final defaultTheme = PinTheme(
      width: 48,
      height: 52,
      textStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gry),
      ),
    );

    return OtpTheme(
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyWith(
        decoration: defaultTheme.decoration?.copyWith(
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
      ),
      submittedPinTheme: defaultTheme.copyWith(
        decoration: defaultTheme.decoration?.copyWith(
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
      ),
      errorPinTheme: defaultTheme.copyBorderWith(
        border: Border.all(color: AppColors.red),
      ),
    );
  }

  /// Presets for dark mode.
  static OtpTheme dark(TextTheme textTheme) {
    final defaultTheme = PinTheme(
      width: 48,
      height: 52,
      textStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.darkTextPrimary,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkField,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkBorder),
      ),
    );

    return OtpTheme(
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyWith(
        decoration: defaultTheme.decoration?.copyWith(
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
      ),
      submittedPinTheme: defaultTheme.copyWith(
        decoration: defaultTheme.decoration?.copyWith(
          color: AppColors.primary.withValues(alpha: 0.15),
        ),
      ),
      errorPinTheme: defaultTheme.copyBorderWith(
        border: Border.all(color: AppColors.red),
      ),
    );
  }

  @override
  OtpTheme copyWith({
    PinTheme? defaultPinTheme,
    PinTheme? focusedPinTheme,
    PinTheme? submittedPinTheme,
    PinTheme? errorPinTheme,
  }) {
    return OtpTheme(
      defaultPinTheme: defaultPinTheme ?? this.defaultPinTheme,
      focusedPinTheme: focusedPinTheme ?? this.focusedPinTheme,
      submittedPinTheme: submittedPinTheme ?? this.submittedPinTheme,
      errorPinTheme: errorPinTheme ?? this.errorPinTheme,
    );
  }

  @override
  OtpTheme lerp(covariant OtpTheme? other, double t) {
    if (other == null) return this;
    return OtpTheme(
      defaultPinTheme: t < 0.5 ? defaultPinTheme : other.defaultPinTheme,
      focusedPinTheme: t < 0.5 ? focusedPinTheme : other.focusedPinTheme,
      submittedPinTheme: t < 0.5 ? submittedPinTheme : other.submittedPinTheme,
      errorPinTheme: t < 0.5 ? errorPinTheme : other.errorPinTheme,
    );
  }
}
