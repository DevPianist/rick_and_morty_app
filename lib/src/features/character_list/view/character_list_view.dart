import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/l10n/l10n.dart';
import 'package:rick_and_morty_app/src/app/app.dart';
import 'package:rick_and_morty_app/src/features/character_list/character_list.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late final scrollController = ScrollController()..addListener(scrollListener);

  void scrollListener() {
    final bloc = context.read<CharacterListBloc>();
    if (scrollController.remainingHeight < 10) {
      bloc.add(LoadCharacters(bloc.state.page + 1));
    }
  }

  Future<void> characterListBlocListener(
    BuildContext context,
    CharacterListState state,
  ) async {
    if (state is CharacterListLoaded) {
      scrollListener();
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.characterListTitle),
      ),
      floatingActionButton: const ClearCharacterButton(),
      body: BlocListener<CharacterListBloc, CharacterListState>(
        listener: characterListBlocListener,
        child: CharacterListBody(
          scrollController: scrollController,
        ),
      ),
    );
  }
}
