import 'package:flutter/material.dart';

import '../models/family_tree_node.dart';
import '../widgets/family_member_card.dart';

class SampleFamilyTreeData {
  const SampleFamilyTreeData._();

  static const Size canvasSize = Size(1320, 1020);

  static List<FamilyTreeNode> nodes() {
    const center = Offset(660, 510);
    const teal = Color(0xFF2F7D7E);
    const sage = Color(0xFF5F8D6B);
    const rose = Color(0xFFB76E79);
    const amber = Color(0xFFB97835);
    const indigo = Color(0xFF5967B0);
    const plum = Color(0xFF8A5A87);

    Offset regularAt(double dx, double dy) {
      return Offset(
        center.dx + dx - FamilyMemberCard.regularSize.width / 2,
        center.dy + dy - FamilyMemberCard.regularSize.height / 2,
      );
    }

    return [
      FamilyTreeNode(
        id: 'ava',
        name: 'Ava Khan',
        relationship: 'Main User',
        imageUrl: 'https://i.pravatar.cc/220?img=47',
        position: center - const Offset(85, 93),
        relationType: FamilyRelationType.self,
        accentColor: teal,
        isMainUser: true,
      ),
      FamilyTreeNode(
        id: 'father',
        name: 'Omar Khan',
        relationship: 'Father',
        imageUrl: 'https://i.pravatar.cc/220?img=12',
        position: regularAt(-170, -215),
        relationType: FamilyRelationType.parent,
        accentColor: sage,
      ),
      FamilyTreeNode(
        id: 'mother',
        name: 'Lina Khan',
        relationship: 'Mother',
        imageUrl: 'https://i.pravatar.cc/220?img=32',
        position: regularAt(170, -215),
        relationType: FamilyRelationType.parent,
        accentColor: rose,
      ),
      FamilyTreeNode(
        id: 'grandfather',
        name: 'Hassan Ali',
        relationship: 'Grandfather',
        imageUrl: 'https://i.pravatar.cc/220?img=15',
        position: regularAt(-310, -420),
        relationType: FamilyRelationType.grandparent,
        accentColor: sage,
      ),
      FamilyTreeNode(
        id: 'grandmother',
        name: 'Maryam Ali',
        relationship: 'Grandmother',
        imageUrl: 'https://i.pravatar.cc/220?img=49',
        position: regularAt(0, -430),
        relationType: FamilyRelationType.grandparent,
        accentColor: rose,
      ),
      FamilyTreeNode(
        id: 'uncle',
        name: 'Rafi Ali',
        relationship: 'Uncle',
        imageUrl: 'https://i.pravatar.cc/220?img=53',
        position: regularAt(-470, -180),
        relationType: FamilyRelationType.auntOrUncle,
        accentColor: amber,
      ),
      FamilyTreeNode(
        id: 'aunt',
        name: 'Nadia Ali',
        relationship: 'Aunt',
        imageUrl: 'https://i.pravatar.cc/220?img=45',
        position: regularAt(460, -160),
        relationType: FamilyRelationType.auntOrUncle,
        accentColor: amber,
      ),
      FamilyTreeNode(
        id: 'brother',
        name: 'Zayn Khan',
        relationship: 'Brother',
        imageUrl: 'https://i.pravatar.cc/220?img=60',
        position: regularAt(-330, 5),
        relationType: FamilyRelationType.sibling,
        accentColor: indigo,
      ),
      FamilyTreeNode(
        id: 'sister',
        name: 'Mira Khan',
        relationship: 'Sister',
        imageUrl: 'https://i.pravatar.cc/220?img=41',
        position: regularAt(330, 20),
        relationType: FamilyRelationType.sibling,
        accentColor: indigo,
      ),
      FamilyTreeNode(
        id: 'spouse',
        name: 'Noah Reed',
        relationship: 'Spouse',
        imageUrl: 'https://i.pravatar.cc/220?img=11',
        position: regularAt(230, 230),
        relationType: FamilyRelationType.spouse,
        accentColor: plum,
      ),
      FamilyTreeNode(
        id: 'son',
        name: 'Leo Reed',
        relationship: 'Son',
        imageUrl: 'https://i.pravatar.cc/220?img=5',
        position: regularAt(-125, 330),
        relationType: FamilyRelationType.child,
        accentColor: teal,
      ),
      FamilyTreeNode(
        id: 'daughter',
        name: 'Ivy Reed',
        relationship: 'Daughter',
        imageUrl: 'https://i.pravatar.cc/220?img=25',
        position: regularAt(115, 345),
        relationType: FamilyRelationType.child,
        accentColor: teal,
      ),
      FamilyTreeNode(
        id: 'cousin',
        name: 'Sam Ali',
        relationship: 'Cousin',
        imageUrl: 'https://i.pravatar.cc/220?img=8',
        position: regularAt(-470, 245),
        relationType: FamilyRelationType.cousin,
        accentColor: amber,
      ),
      FamilyTreeNode(
        id: 'grandchild',
        name: 'Nora Reed',
        relationship: 'Grandchild',
        imageUrl: 'https://i.pravatar.cc/220?img=29',
        position: regularAt(0, 535),
        relationType: FamilyRelationType.grandchild,
        accentColor: teal,
      ),
    ];
  }

  static List<FamilyConnection> connections() {
    const parentLine = Color(0xFF74A086);
    const mainLine = Color(0xFF2F7D7E);
    const siblingLine = Color(0xFF7B85C4);
    const extendedLine = Color(0xFFC99A62);

    return const [
      FamilyConnection(
        fromId: 'grandfather',
        toId: 'father',
        color: parentLine,
      ),
      FamilyConnection(
        fromId: 'grandmother',
        toId: 'father',
        color: parentLine,
      ),
      FamilyConnection(
        fromId: 'grandfather',
        toId: 'uncle',
        color: extendedLine,
      ),
      FamilyConnection(
        fromId: 'grandmother',
        toId: 'aunt',
        color: extendedLine,
      ),
      FamilyConnection(
        fromId: 'father',
        toId: 'ava',
        color: mainLine,
        strokeWidth: 3,
      ),
      FamilyConnection(
        fromId: 'mother',
        toId: 'ava',
        color: mainLine,
        strokeWidth: 3,
      ),
      FamilyConnection(fromId: 'brother', toId: 'ava', color: siblingLine),
      FamilyConnection(fromId: 'sister', toId: 'ava', color: siblingLine),
      FamilyConnection(fromId: 'spouse', toId: 'ava', color: Color(0xFF9B6A9A)),
      FamilyConnection(
        fromId: 'ava',
        toId: 'son',
        color: mainLine,
        strokeWidth: 3,
      ),
      FamilyConnection(
        fromId: 'ava',
        toId: 'daughter',
        color: mainLine,
        strokeWidth: 3,
      ),
      FamilyConnection(fromId: 'uncle', toId: 'cousin', color: extendedLine),
      FamilyConnection(fromId: 'aunt', toId: 'cousin', color: extendedLine),
      FamilyConnection(fromId: 'son', toId: 'grandchild', color: mainLine),
    ];
  }
}
