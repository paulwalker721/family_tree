import 'family_tree_node.dart';

class AddFamilyMemberResult {
  const AddFamilyMemberResult({
    required this.name,
    required this.relationship,
    required this.imageUrl,
    required this.relationType,
  });

  final String name;
  final String relationship;
  final String imageUrl;
  final FamilyRelationType relationType;
}
