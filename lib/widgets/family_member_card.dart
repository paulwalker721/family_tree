import 'package:flutter/material.dart';

import '../models/family_tree_node.dart';
import '../theme/presentation/app_theme/theme_context_extensions.dart';

class FamilyMemberCard extends StatelessWidget {
  const FamilyMemberCard({
    super.key,
    required this.member,
    this.onPressed,
    this.onAddPressed,
  });

  static const Size regularSize = Size(148, 154);
  static const Size mainSize = Size(168, 170);

  static double bodyTopInsetFor(FamilyTreeNode member) {
    return member.isMainUser ? 48 : 42;
  }

  final FamilyTreeNode member;
  final VoidCallback? onPressed;
  final VoidCallback? onAddPressed;

  @override
  Widget build(BuildContext context) {
    final size = member.isMainUser ? mainSize : regularSize;
    final colors = context.appColors;
    final imageSize = member.isMainUser ? 82.0 : 72.0;
    final bodyTop = bodyTopInsetFor(member);
    final titleStyle = context.appTextStyles.titleMedium?.copyWith(
      color: colors.negativeColor,
      fontWeight: FontWeight.w700,
      fontSize: member.isMainUser ? 15 : 13,
      height: 1.15,
    );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: bodyTop,
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.fromLTRB(
                    14,
                    imageSize / 2 + 14,
                    14,
                    14,
                  ),
                  decoration: BoxDecoration(
                    color: colors.cardBackgroundHigh,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: member.isMainUser
                          ? colors.primary.withValues(alpha: .48)
                          : colors.borderColor,
                      width: member.isMainUser ? 1.4 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .30),
                        blurRadius: 22,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        member.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        member.relationship,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: context.appTextStyles.bodySmall?.copyWith(
                          color: colors.subHeadingColor,
                          fontWeight: FontWeight.w500,
                          height: 1.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: (size.width - imageSize) / 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: member.accentColor.withValues(alpha: .95),
                    border: Border.all(
                      color: colors.sheetBackgroundColor,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: member.accentColor.withValues(alpha: .25),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: imageSize / 2,
                    backgroundColor: member.accentColor.withValues(alpha: .20),
                    child: ClipOval(
                      child: Image.network(
                        member.imageUrl,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                        errorBuilder: (_, error, stackTrace) =>
                            _AvatarFallback(
                              name: member.name,
                              color: member.accentColor,
                              size: imageSize,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: bodyTop + 8,
                right: 8,
                child: _AddMemberButton(
                  color: colors.primary,
                  onPressed: onAddPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddMemberButton extends StatelessWidget {
  const _AddMemberButton({required this.color, required this.onPressed});

  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Add family member',
      child: Material(
        color: const Color(0xFF0D315F),
        shape: const CircleBorder(),
        elevation: 0,
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add_rounded),
          color: color,
          iconSize: 16,
          constraints: const BoxConstraints.tightFor(width: 26, height: 26),
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback({
    required this.name,
    required this.color,
    required this.size,
  });

  final String name;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final initials = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part.substring(0, 1).toUpperCase())
        .join();

    return Container(
      width: size,
      height: size,
      color: color.withValues(alpha: .18),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * .32,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
