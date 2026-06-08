import 'package:flutter/material.dart';

import '../theme/presentation/app_theme/theme_context_extensions.dart';

class FamilyTreeHeader extends StatelessWidget {
  const FamilyTreeHeader({super.key, required this.onResetView});

  final VoidCallback onResetView;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.sheetBackgroundColor,
        border: Border(
          bottom: BorderSide(color: colors.borderColor, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: colors.cardBackgroundMedium,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.borderColor),
              ),
              child: Icon(
                Icons.account_tree_rounded,
                color: colors.primary,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Family Tree',
                    style: context.appTextStyles.headlineSmall?.copyWith(
                      color: colors.negativeColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Relationship hierarchy',
                    style: context.appTextStyles.bodyMedium?.copyWith(
                      color: colors.subHeadingColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            IconButton.filledTonal(
              onPressed: onResetView,
              tooltip: 'Reset view',
              style: IconButton.styleFrom(
                backgroundColor: colors.cardBackgroundMedium,
                foregroundColor: colors.primaryOrWhite,
                side: BorderSide(color: colors.borderColor),
              ),
              icon: const Icon(Icons.center_focus_strong_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
