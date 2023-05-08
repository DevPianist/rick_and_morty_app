import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/features/character_detail/character_detail.dart';

class ClearCharacterButton extends StatelessWidget {
  const ClearCharacterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final characterDetailBloc = context.watch<CharacterDetailBloc>();
    final characterDetailState = characterDetailBloc.state;
    return characterDetailState.characterId != null
        ? FloatingActionButton(
            child: const Icon(Icons.cleaning_services),
            onPressed: () {
              context.read<CharacterDetailBloc>().add(const ClearCharacter());
            },
          )
        : const SizedBox.shrink();
  }
}
