part of 'character_detail_bloc.dart';

abstract class CharacterDetailEvent {
  const CharacterDetailEvent();
}

class SelectCharacter extends CharacterDetailEvent {
  const SelectCharacter(this.character);

  final Character character;
}

class ClearCharacter extends CharacterDetailEvent {
  const ClearCharacter();
}
