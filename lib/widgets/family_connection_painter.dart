import 'package:flutter/material.dart';

import '../models/family_tree_node.dart';
import 'family_member_card.dart';

class FamilyConnectionPainter extends CustomPainter {
  const FamilyConnectionPainter({
    required this.nodes,
    required this.connections,
  });

  final List<FamilyTreeNode> nodes;
  final List<FamilyConnection> connections;

  @override
  void paint(Canvas canvas, Size size) {
    final nodeMap = {for (final node in nodes) node.id: node};

    for (final connection in connections) {
      final from = nodeMap[connection.fromId];
      final to = nodeMap[connection.toId];
      if (from == null || to == null) continue;

      final anchors = _anchorsFor(from, to);
      final path = _connectorPath(anchors.start, anchors.end);

      final shadowPaint = Paint()
        ..color = Colors.white.withValues(alpha: .85)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = connection.strokeWidth + 4;

      final linePaint = Paint()
        ..color = connection.color
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = connection.strokeWidth;

      canvas.drawPath(path, shadowPaint);
      canvas.drawPath(path, linePaint);
      _drawEndpoint(canvas, anchors.start, connection.color);
      _drawEndpoint(canvas, anchors.end, connection.color);
    }
  }

  _ConnectionAnchors _anchorsFor(FamilyTreeNode from, FamilyTreeNode to) {
    final fromRect = _rectFor(from);
    final toRect = _rectFor(to);

    if ((toRect.center.dy - fromRect.center.dy).abs() < 72) {
      if (toRect.center.dx >= fromRect.center.dx) {
        return _ConnectionAnchors(fromRect.centerRight, toRect.centerLeft);
      }
      return _ConnectionAnchors(fromRect.centerLeft, toRect.centerRight);
    }

    if (toRect.center.dy > fromRect.center.dy) {
      return _ConnectionAnchors(
        Offset(fromRect.center.dx, fromRect.bottom),
        Offset(toRect.center.dx, toRect.top),
      );
    }

    return _ConnectionAnchors(
      Offset(fromRect.center.dx, fromRect.top),
      Offset(toRect.center.dx, toRect.bottom),
    );
  }

  Path _connectorPath(Offset start, Offset end) {
    final path = Path()..moveTo(start.dx, start.dy);

    if ((end.dy - start.dy).abs() < 72) {
      final bridgeY = start.dy - 44;
      path
        ..lineTo(start.dx, bridgeY)
        ..lineTo(end.dx, bridgeY)
        ..lineTo(end.dx, end.dy);
      return path;
    }

    final bridgeY = start.dy + (end.dy - start.dy) / 2;
    path
      ..lineTo(start.dx, bridgeY)
      ..lineTo(end.dx, bridgeY)
      ..lineTo(end.dx, end.dy);

    return path;
  }

  Rect _rectFor(FamilyTreeNode node) {
    final cardSize = node.isMainUser
        ? FamilyMemberCard.mainSize
        : FamilyMemberCard.regularSize;
    return Rect.fromLTWH(
      node.position.dx,
      node.position.dy,
      cardSize.width,
      cardSize.height,
    );
  }

  void _drawEndpoint(Canvas canvas, Offset center, Color color) {
    canvas.drawCircle(
      center,
      4,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      center,
      3,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant FamilyConnectionPainter oldDelegate) {
    return oldDelegate.nodes != nodes || oldDelegate.connections != connections;
  }
}

class _ConnectionAnchors {
  const _ConnectionAnchors(this.start, this.end);

  final Offset start;
  final Offset end;
}
