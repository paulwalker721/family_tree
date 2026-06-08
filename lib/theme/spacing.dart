import 'package:flutter/widgets.dart';

class AppSpacing {
  // Base spacing unit (change this to scale everything)
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  // Common paddings
  static const EdgeInsets screenPadding = EdgeInsets.all(md);
  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: md);

  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );
}
