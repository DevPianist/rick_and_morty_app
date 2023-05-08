import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CharacterDetailContent extends StatelessWidget {
  const CharacterDetailContent({
    super.key,
    required this.character,
  });
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(character.image),
            radius: 100,
          ),
          const SizedBox(height: 20),
          Text(character.id.toString()),
          Text(character.name),
          Text(character.status),
          Text(character.species),
          if (character.type.isNotEmpty) Text(character.type),
          Text(character.gender),
          Text(character.origin.name),
          Text(character.location.name),
          Text(character.created),
        ],
      ),
    );
  }
}
