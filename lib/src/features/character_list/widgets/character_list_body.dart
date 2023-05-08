import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/app/app.dart';
import 'package:rick_and_morty_app/src/features/character_detail/character_detail.dart';
import 'package:rick_and_morty_app/src/features/character_list/character_list.dart';

class CharacterListBody extends StatelessWidget {
  const CharacterListBody({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CharacterListBloc>();
    final state = bloc.state;
    final characterDetailBloc = context.watch<CharacterDetailBloc>();
    final characterDetailState = characterDetailBloc.state;
    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const LoadCharacters());
        characterDetailBloc.add(const ClearCharacter());
      },
      child: Scrollbar(
        controller: scrollController,
        radius: const Radius.circular(20),
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final character = state.paginatedCharacterList.results[index];
                  final isSelected =
                      characterDetailState.characterId == character.id;
                  return CharacterTile(
                    value: character,
                    isSelected: isSelected,
                    onTap: () {
                      if (isSelected) {
                        characterDetailBloc.add(const ClearCharacter());
                      } else {
                        characterDetailBloc.add(SelectCharacter(character));
                      }
                    },
                  );
                },
                childCount: state.paginatedCharacterList.results.length,
              ),
            ),
            if (state is CharacterListLoading &&
                state.paginatedCharacterList.results.isEmpty)
              const SliverFillRemaining(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            if (state is CharacterListLoading &&
                state.paginatedCharacterList.results.isNotEmpty)
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 20),
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            if (state is CharacterListError &&
                state.paginatedCharacterList.results.isNotEmpty)
              SliverToBoxAdapter(
                child: Center(
                  child: TextException(
                    value: state.exception,
                  ),
                ),
              )
            else if (state is CharacterListError &&
                state.paginatedCharacterList.results.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextException(
                        value: state.exception,
                      ),
                      IconButton(
                        onPressed: () {
                          bloc.add(const LoadCharacters());
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
