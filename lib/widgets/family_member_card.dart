import 'package:flutter/material.dart';

import '../models/family_tree_node.dart';

class FamilyMemberCard extends StatelessWidget {
  const FamilyMemberCard({
    super.key,
    required this.member,
    this.onPressed,
    this.onAddPressed,
  });

  static const Size regularSize = Size(142, 160);
  static const Size mainSize = Size(170, 186);

  final FamilyTreeNode member;
  final VoidCallback? onPressed;
  final VoidCallback? onAddPressed;

  @override
  Widget build(BuildContext context) {
    final size = member.isMainUser ? mainSize : regularSize;
    final imageSize = member.isMainUser ? 76.0 : 64.0;
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      color: const Color(0xFF1D2827),
      fontWeight: FontWeight.w800,
      fontSize: member.isMainUser ? 18 : 15,
    );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: member.isMainUser
                        ? member.accentColor
                        : member.accentColor.withValues(alpha: .22),
                    width: member.isMainUser ? 2 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: member.accentColor.withValues(alpha: .18),
                      blurRadius: member.isMainUser ? 28 : 18,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: member.accentColor.withValues(alpha: .45),
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: imageSize / 2,
                        backgroundColor: member.accentColor.withValues(
                          alpha: .14,
                        ),
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
                    const SizedBox(height: 10),
                    Text(
                      member.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: titleStyle,
                    ),
                    const SizedBox(height: 6),
                    Container(
                      constraints: const BoxConstraints(minHeight: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: member.accentColor.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        member.relationship,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: member.accentColor,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: _AddMemberButton(
                  color: member.accentColor,
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
        color: Colors.white,
        shape: const CircleBorder(),
        elevation: 4,
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add_rounded),
          color: color,
          iconSize: 18,
          constraints: const BoxConstraints.tightFor(width: 30, height: 30),
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
          color: color,
          fontSize: size * .32,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
