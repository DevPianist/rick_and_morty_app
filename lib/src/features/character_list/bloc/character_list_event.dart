part of 'character_list_bloc.dart';

abstract class CharacterListEvent {
  const CharacterListEvent();
}

class LoadCharacters extends CharacterListEvent {
  const LoadCharacters([this.page = 1]);

  final int page;
}
