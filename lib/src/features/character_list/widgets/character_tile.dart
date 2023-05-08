import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    super.key,
    required this.value,
    required this.onTap,
    required this.isSelected,
  });
  final Character value;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey('character-${value.id}'),
      onTap: onTap,
      selected: isSelected,
      title: Text(value.name),
      subtitle: Text(value.species),
      trailing: CircleAvatar(
        backgroundImage: NetworkImage(value.image),
        radius: 30,
      ),
    );
  }
}
