import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/l10n/l10n.dart';
import 'package:rick_and_morty_app/src/app/widgets/text_exception.dart';
import 'package:rick_and_morty_app/src/features/character_detail/character_detail.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.characterDetailTitle),
      ),
      body: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case CharacterDetailInitial:
              return Center(
                child: Text(l10n.characterDetailEmptyState),
              );
            case CharacterDetailLoaded:
              return CharacterDetailContent(
                character: (state as CharacterDetailLoaded).character!,
              );
            case CharacterDetailLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case CharacterDetailError:
            default:
              return Center(
                child: TextException(
                  value: (state as CharacterDetailError).exception,
                ),
              );
          }
        },
      ),
    );
  }
}
