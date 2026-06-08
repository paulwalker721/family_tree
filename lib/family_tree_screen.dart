import 'package:flutter/material.dart';

import 'data/sample_family_tree_data.dart';
import 'models/add_family_member_result.dart';
import 'models/family_tree_node.dart';
import 'widgets/add_family_member_dialog.dart';
import 'widgets/family_member_card.dart';
import 'widgets/family_tree_canvas.dart';
import 'widgets/family_tree_header.dart';

class FamilyTreeScreen extends StatefulWidget {
  const FamilyTreeScreen({super.key});

  @override
  State<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  late final AnimationController _viewAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 360),
  );
  Animation<Matrix4>? _viewAnimation;

  List<FamilyTreeNode> _nodes = SampleFamilyTreeData.nodes();
  List<FamilyConnection> _connections = SampleFamilyTreeData.connections();

  @override
  void initState() {
    super.initState();
    _viewAnimationController.addListener(_updateViewAnimation);
  }

  @override
  void dispose() {
    _viewAnimationController.removeListener(_updateViewAnimation);
    _viewAnimationController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2F1),
      body: SafeArea(
        child: Column(
          children: [
            FamilyTreeHeader(onResetView: _resetView),
            Expanded(
              child: FamilyTreeCanvas(
                canvasSize: _canvasSize,
                nodes: _nodes,
                connections: _connections,
                transformationController: _transformationController,
                onNodePressed: _focusNode,
                onAddMember: _showAddMemberDialog,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size get _canvasSize {
    var maxRight = SampleFamilyTreeData.canvasSize.width;
    var maxBottom = SampleFamilyTreeData.canvasSize.height;

    for (final node in _nodes) {
      final cardSize = node.isMainUser
          ? FamilyMemberCard.mainSize
          : FamilyMemberCard.regularSize;
      maxRight = maxRight < node.position.dx + cardSize.width + 220
          ? node.position.dx + cardSize.width + 220
          : maxRight;
      maxBottom = maxBottom < node.position.dy + cardSize.height + 220
          ? node.position.dy + cardSize.height + 220
          : maxBottom;
    }

    return Size(maxRight, maxBottom);
  }

  Future<void> _showAddMemberDialog(FamilyTreeNode parent) async {
    final result = await showDialog<AddFamilyMemberResult>(
      context: context,
      builder: (context) => AddFamilyMemberDialog(parent: parent),
    );
    if (result == null || !mounted) return;

    final newNode = _buildNewMemberNode(parent, result);
    setState(() {
      _nodes = [..._nodes, newNode];
      _connections = [
        ..._connections,
        FamilyConnection(
          fromId: parent.id,
          toId: newNode.id,
          color: parent.accentColor,
          strokeWidth: 2.6,
        ),
      ];
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode(newNode);
    });
  }

  FamilyTreeNode _buildNewMemberNode(
    FamilyTreeNode parent,
    AddFamilyMemberResult result,
  ) {
    const horizontalSpacing = 185.0;
    const verticalSpacing = 235.0;

    final parentSize = parent.isMainUser
        ? FamilyMemberCard.mainSize
        : FamilyMemberCard.regularSize;
    final childIndex = _connections
        .where((connection) => connection.fromId == parent.id)
        .length;
    final side = childIndex.isOdd ? -1 : 1;
    final ring = (childIndex + 1) ~/ 2;
    final offsetX = childIndex == 0 ? 0.0 : side * ring * horizontalSpacing;
    final parentCenterX = parent.position.dx + parentSize.width / 2;
    final position = Offset(
      parentCenterX + offsetX - FamilyMemberCard.regularSize.width / 2,
      parent.position.dy + parentSize.height + verticalSpacing,
    );

    return FamilyTreeNode(
      id: 'member-${DateTime.now().microsecondsSinceEpoch}',
      name: result.name,
      relationship: result.relationship,
      imageUrl: result.imageUrl,
      position: _avoidNodeOverlap(position),
      relationType: result.relationType,
      accentColor: parent.accentColor,
    );
  }

  Offset _avoidNodeOverlap(Offset preferredPosition) {
    var position = preferredPosition;
    var attempts = 0;

    while (_nodes.any((node) => _overlaps(node, position)) && attempts < 10) {
      attempts += 1;
      position = preferredPosition + Offset(92.0 * attempts, 34.0 * attempts);
    }

    return position;
  }

  bool _overlaps(FamilyTreeNode node, Offset position) {
    final nodeSize = node.isMainUser
        ? FamilyMemberCard.mainSize
        : FamilyMemberCard.regularSize;
    final existing = Rect.fromLTWH(
      node.position.dx,
      node.position.dy,
      nodeSize.width,
      nodeSize.height,
    ).inflate(28);
    final candidate = Rect.fromLTWH(
      position.dx,
      position.dy,
      FamilyMemberCard.regularSize.width,
      FamilyMemberCard.regularSize.height,
    );
    return existing.overlaps(candidate);
  }

  void _resetView() {
    _animateToMatrix(Matrix4.identity());
  }

  void _focusNode(FamilyTreeNode node) {
    final cardSize = node.isMainUser
        ? FamilyMemberCard.mainSize
        : FamilyMemberCard.regularSize;
    final center =
        node.position + Offset(cardSize.width / 2, cardSize.height / 2);
    final viewportCenter = Offset(
      MediaQuery.sizeOf(context).width / 2,
      (MediaQuery.sizeOf(context).height - 110) / 2,
    );
    final scale = node.isMainUser ? 1.0 : 1.18;
    final matrix = Matrix4.identity()
      ..translateByDouble(
        viewportCenter.dx - center.dx * scale,
        viewportCenter.dy - center.dy * scale,
        0,
        1,
      )
      ..scaleByDouble(scale, scale, 1, 1);

    _animateToMatrix(matrix);
  }

  void _animateToMatrix(Matrix4 target) {
    _viewAnimationController.stop();
    _viewAnimationController.reset();
    _viewAnimation =
        Matrix4Tween(
          begin: _transformationController.value,
          end: target,
        ).animate(
          CurvedAnimation(
            parent: _viewAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );
    _viewAnimationController.forward();
  }

  void _updateViewAnimation() {
    final animation = _viewAnimation;
    if (animation == null) return;
    _transformationController.value = animation.value;
  }
}
