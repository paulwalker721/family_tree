import 'package:flutter/material.dart';

enum FamilyRelationType {
  self,
  spouse,
  parent,
  child,
  sibling,
  grandparent,
  auntOrUncle,
  cousin,
  grandchild,
  other,
}

class FamilyTreeNode {
  const FamilyTreeNode({
    required this.id,
    required this.name,
    required this.relationship,
    required this.imageUrl,
    required this.position,
    required this.relationType,
    this.accentColor = const Color(0xFF4F7C7B),
    this.isMainUser = false,
  });

  final String id;
  final String name;
  final String relationship;
  final String imageUrl;
  final Offset position;
  final FamilyRelationType relationType;
  final Color accentColor;
  final bool isMainUser;

  FamilyTreeNode copyWith({
    String? id,
    String? name,
    String? relationship,
    String? imageUrl,
    Offset? position,
    FamilyRelationType? relationType,
    Color? accentColor,
    bool? isMainUser,
  }) {
    return FamilyTreeNode(
      id: id ?? this.id,
      name: name ?? this.name,
      relationship: relationship ?? this.relationship,
      imageUrl: imageUrl ?? this.imageUrl,
      position: position ?? this.position,
      relationType: relationType ?? this.relationType,
      accentColor: accentColor ?? this.accentColor,
      isMainUser: isMainUser ?? this.isMainUser,
    );
  }
}

class FamilyConnection {
  const FamilyConnection({
    required this.fromId,
    required this.toId,
    this.label,
    this.color = const Color(0xFF9FB5B1),
    this.strokeWidth = 2,
  });

  final String fromId;
  final String toId;
  final String? label;
  final Color color;
  final double strokeWidth;
}
