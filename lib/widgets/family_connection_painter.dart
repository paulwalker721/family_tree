import 'package:flutter/material.dart';

import '../models/family_tree_node.dart';
import 'family_member_card.dart';

class FamilyConnectionPainter extends CustomPainter {
  const FamilyConnectionPainter({
    required this.nodes,
    required this.connections,
    required this.connectorColor,
    required this.endpointColor,
  });

  final List<FamilyTreeNode> nodes;
  final List<FamilyConnection> connections;
  final Color connectorColor;
  final Color endpointColor;

  @override
  void paint(Canvas canvas, Size size) {
    final nodeMap = {for (final node in nodes) node.id: node};

    for (final connection in connections) {
      final from = nodeMap[connection.fromId];
      final to = nodeMap[connection.toId];
      if (from == null || to == null) continue;

      final anchors = _anchorsFor(from, to);
      final path = _connectorPath(anchors.start, anchors.end);

      final linePaint = Paint()
        ..color = connectorColor
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 1.4;

      _drawDashedPath(canvas, path, linePaint);
      _drawEndpoint(canvas, anchors.start);
      _drawEndpoint(canvas, anchors.end);
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
        Offset(fromRect.center.dx, _bodyBottomFor(from)),
        Offset(toRect.center.dx, _bodyTopFor(to)),
      );
    }

    return _ConnectionAnchors(
      Offset(fromRect.center.dx, _bodyTopFor(from)),
      Offset(toRect.center.dx, _bodyBottomFor(to)),
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

  double _bodyTopFor(FamilyTreeNode node) {
    return node.position.dy + FamilyMemberCard.bodyTopInsetFor(node);
  }

  double _bodyBottomFor(FamilyTreeNode node) {
    final cardSize = node.isMainUser
        ? FamilyMemberCard.mainSize
        : FamilyMemberCard.regularSize;
    return node.position.dy + cardSize.height;
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    const dashLength = 5.0;
    const gapLength = 6.0;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashLength > metric.length
            ? metric.length
            : distance + dashLength;
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += dashLength + gapLength;
      }
    }
  }

  void _drawEndpoint(Canvas canvas, Offset center) {
    canvas.drawCircle(
      center,
      4,
      Paint()
        ..color = endpointColor.withValues(alpha: .18)
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      center,
      2.8,
      Paint()
        ..color = endpointColor
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      center,
      2,
      Paint()
        ..color = Colors.white.withValues(alpha: .92)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant FamilyConnectionPainter oldDelegate) {
    return oldDelegate.nodes != nodes ||
        oldDelegate.connections != connections ||
        oldDelegate.connectorColor != connectorColor ||
        oldDelegate.endpointColor != endpointColor;
  }
}

class _ConnectionAnchors {
  const _ConnectionAnchors(this.start, this.end);

  final Offset start;
  final Offset end;
}
