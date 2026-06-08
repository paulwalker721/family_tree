import 'package:flutter/material.dart';

import '../models/family_tree_node.dart';
import '../theme/presentation/app_theme/theme_context_extensions.dart';
import 'family_connection_painter.dart';
import 'family_member_card.dart';

class FamilyTreeCanvas extends StatelessWidget {
  const FamilyTreeCanvas({
    super.key,
    required this.canvasSize,
    required this.nodes,
    required this.connections,
    required this.transformationController,
    required this.onNodePressed,
    required this.onAddMember,
  });

  final Size canvasSize;
  final List<FamilyTreeNode> nodes;
  final List<FamilyConnection> connections;
  final TransformationController transformationController;
  final ValueChanged<FamilyTreeNode> onNodePressed;
  final ValueChanged<FamilyTreeNode> onAddMember;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return InteractiveViewer(
      transformationController: transformationController,
      boundaryMargin: const EdgeInsets.all(420),
      minScale: .42,
      maxScale: 2.2,
      constrained: false,
      child: SizedBox(
        width: canvasSize.width,
        height: canvasSize.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: FamilyConnectionPainter(
                  nodes: nodes,
                  connections: connections,
                  connectorColor: colors.dividerColor,
                  endpointColor: colors.primary,
                ),
              ),
            ),
            for (final node in nodes)
              Positioned(
                left: node.position.dx,
                top: node.position.dy,
                child: FamilyMemberCard(
                  member: node,
                  onPressed: () => onNodePressed(node),
                  onAddPressed: () => onAddMember(node),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
