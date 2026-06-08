import 'package:flutter/material.dart';

class FamilyTreeHeader extends StatelessWidget {
  const FamilyTreeHeader({super.key, required this.onResetView});

  final VoidCallback onResetView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF2F7D7E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.account_tree_rounded, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Family Tree',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF1D2827),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Radial relationship map',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF617371),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            onPressed: onResetView,
            tooltip: 'Reset view',
            icon: const Icon(Icons.center_focus_strong_rounded),
          ),
        ],
      ),
    );
  }
}
