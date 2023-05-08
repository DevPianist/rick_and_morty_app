import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc({
    required CharacterRepository characterRepository,
  })  : _characterRepository = characterRepository,
        super(const CharacterDetailInitial()) {
    on<SelectCharacter>(_onSelectCharacter);
    on<ClearCharacter>(_onClearCharacter);
  }

  final CharacterRepository _characterRepository;

  Future<void> _onSelectCharacter(
    SelectCharacter event,
    Emitter<CharacterDetailState> emit,
  ) async {
    emit(CharacterDetailLoading(characterId: event.character.id));
    try {
      final result = await _characterRepository.findById(event.character.id);
      if (result is SuccessResult<Character>) {
        emit(
          CharacterDetailLoaded(
            character: result.data,
            characterId: result.data.id,
          ),
        );
      } else if (result is ErrorResult<Character>) {
        throw result.exception;
      }
    } on Exception catch (e) {
      emit(CharacterDetailError(e));
    }
  }

  void _onClearCharacter(
    ClearCharacter event,
    Emitter<CharacterDetailState> emit,
  ) {
    emit(const CharacterDetailInitial());
  }
}
