import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc({
    required CharacterRepository characterRepository,
  })  : _characterRepository = characterRepository,
        super(const CharacterListInitial()) {
    on<LoadCharacters>(_onLoadCharacters);
  }
  final CharacterRepository _characterRepository;

  Future<void> _onLoadCharacters(
    LoadCharacters event,
    Emitter<CharacterListState> emit,
  ) async {
    if (state is CharacterListLoading) return;

    final newState = CharacterListLoading(
      paginatedCharacterList: state.paginatedCharacterList,
      page: event.page,
    );
    emit(newState);
    try {
      final paginatedCharacterList =
          await _characterRepository.findByPage(event.page);
      if (paginatedCharacterList is SuccessResult<PaginatedCharacterList>) {
        final newPaginatedCharacterList = PaginatedCharacterList(
          results: event.page == 1
              ? paginatedCharacterList.data.results
              : [
                  ...state.paginatedCharacterList.results,
                  ...paginatedCharacterList.data.results,
                ],
          info: paginatedCharacterList.data.info,
        );
        final newState = CharacterListLoaded(
          paginatedCharacterList: newPaginatedCharacterList,
          page: event.page,
        );
        emit(newState);
      } else if (paginatedCharacterList
          is ErrorResult<PaginatedCharacterList>) {
        throw paginatedCharacterList.exception;
      }
    } on Exception catch (e) {
      final newState = CharacterListError(
        paginatedCharacterList: state.paginatedCharacterList,
        page: event.page,
        exception: e,
      );
      emit(newState);
    }
  }
}
