part of 'character_list_bloc.dart';

abstract class CharacterListState extends Equatable {
  const CharacterListState({
    required this.paginatedCharacterList,
    required this.page,
  });

  final PaginatedCharacterList paginatedCharacterList;
  final int page;

  @override
  List<Object> get props => [];
}

class CharacterListInitial extends CharacterListState {
  const CharacterListInitial()
      : super(
          paginatedCharacterList: const PaginatedCharacterList(
            results: [],
          ),
          page: 0,
        );
}

class CharacterListLoading extends CharacterListState {
  const CharacterListLoading({
    required super.paginatedCharacterList,
    required super.page,
  });
}

class CharacterListError extends CharacterListState {
  const CharacterListError({
    required super.paginatedCharacterList,
    required super.page,
    required this.exception,
  });

  final Exception exception;
}

class CharacterListLoaded extends CharacterListState {
  const CharacterListLoaded({
    required super.page,
    required super.paginatedCharacterList,
  });
}
