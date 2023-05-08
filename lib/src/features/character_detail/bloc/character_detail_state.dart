part of 'character_detail_bloc.dart';

abstract class CharacterDetailState extends Equatable {
  const CharacterDetailState({
    this.character,
    this.characterId,
  });
  final Character? character;
  final int? characterId;

  @override
  List<Object?> get props => [character, characterId];
}

class CharacterDetailInitial extends CharacterDetailState {
  const CharacterDetailInitial();
}

class CharacterDetailLoading extends CharacterDetailState {
  const CharacterDetailLoading({
    required super.characterId,
  });
}

class CharacterDetailLoaded extends CharacterDetailState {
  const CharacterDetailLoaded({
    required Character character,
    required super.characterId,
  }) : super(character: character);

  @override
  List<Object?> get props => [character, characterId];
}

class CharacterDetailError extends CharacterDetailState {
  const CharacterDetailError(
    this.exception, {
    super.character,
    super.characterId,
  });

  final Exception exception;

  @override
  List<Object?> get props => [character, characterId, exception];
}
