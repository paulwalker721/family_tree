import 'package:flutter/material.dart';

import '../models/add_family_member_result.dart';
import '../models/family_tree_node.dart';
import '../theme/presentation/app_theme/theme_context_extensions.dart';

class AddFamilyMemberDialog extends StatefulWidget {
  const AddFamilyMemberDialog({super.key, required this.parent});

  final FamilyTreeNode parent;

  @override
  State<AddFamilyMemberDialog> createState() => _AddFamilyMemberDialogState();
}

class _AddFamilyMemberDialogState extends State<AddFamilyMemberDialog> {
  static const List<_RelationshipOption> _relationships = [
    _RelationshipOption('Father', FamilyRelationType.parent),
    _RelationshipOption('Mother', FamilyRelationType.parent),
    _RelationshipOption('Brother', FamilyRelationType.sibling),
    _RelationshipOption('Sister', FamilyRelationType.sibling),
    _RelationshipOption('Uncle', FamilyRelationType.auntOrUncle),
    _RelationshipOption('Aunt', FamilyRelationType.auntOrUncle),
    _RelationshipOption('Son', FamilyRelationType.child),
    _RelationshipOption('Daughter', FamilyRelationType.child),
    _RelationshipOption('Cousin', FamilyRelationType.cousin),
    _RelationshipOption('Grandchild', FamilyRelationType.grandchild),
    _RelationshipOption('Other', FamilyRelationType.other),
  ];

  static const List<String> _avatarOptions = [
    'https://i.pravatar.cc/220?img=1',
    'https://i.pravatar.cc/220?img=6',
    'https://i.pravatar.cc/220?img=16',
    'https://i.pravatar.cc/220?img=20',
    'https://i.pravatar.cc/220?img=31',
    'https://i.pravatar.cc/220?img=44',
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController(text: _avatarOptions.first);
  _RelationshipOption _selectedRelationship = _relationships.first;
  String _selectedImageUrl = _avatarOptions.first;

  @override
  void dispose() {
    _nameController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return AlertDialog(
      backgroundColor: colors.dialogueColor,
      surfaceTintColor: colors.dialogueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('Add relative to ${widget.parent.name}'),
      content: SizedBox(
        width: 420,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile Image',
                  style: context.appTextStyles.labelLarge?.copyWith(
                    color: colors.negativeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final avatarUrl in _avatarOptions)
                      _AvatarChoice(
                        imageUrl: avatarUrl,
                        isSelected: avatarUrl == _selectedImageUrl,
                        onPressed: () => _selectAvatar(avatarUrl),
                      ),
                  ],
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    prefixIcon: Icon(Icons.image_outlined),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() => _selectedImageUrl = value.trim());
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<_RelationshipOption>(
                  value: _selectedRelationship,
                  decoration: const InputDecoration(
                    labelText: 'Relationship',
                    prefixIcon: Icon(Icons.family_restroom_rounded),
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final option in _relationships)
                      DropdownMenuItem(
                        value: option,
                        child: Text(option.label),
                      ),
                  ],
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _selectedRelationship = value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton.icon(
          onPressed: _save,
          icon: const Icon(Icons.check_rounded),
          label: const Text('Save'),
        ),
      ],
    );
  }

  void _selectAvatar(String avatarUrl) {
    setState(() {
      _selectedImageUrl = avatarUrl;
      _imageUrlController.text = avatarUrl;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.of(context).pop(
      AddFamilyMemberResult(
        name: _nameController.text.trim(),
        relationship: _selectedRelationship.label,
        imageUrl: _imageUrlController.text.trim().isEmpty
            ? _avatarOptions.first
            : _imageUrlController.text.trim(),
        relationType: _selectedRelationship.relationType,
      ),
    );
  }
}

class _AvatarChoice extends StatelessWidget {
  const _AvatarChoice({
    required this.imageUrl,
    required this.isSelected,
    required this.onPressed,
  });

  final String imageUrl;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? colors.primary : Colors.transparent,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: colors.cardBackgroundMedium,
          child: ClipOval(
            child: Image.network(
              imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => const Icon(
                Icons.person_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RelationshipOption {
  const _RelationshipOption(this.label, this.relationType);

  final String label;
  final FamilyRelationType relationType;
}
