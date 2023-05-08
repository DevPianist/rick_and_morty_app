import 'package:data/src/character/character.dart';
import 'package:data/src/common/common.dart';
import 'package:domain/domain.dart';

/// {@template data.remote_character_repository}
/// A character repository that uses the [RemoteCharacterService]
/// to retrieve data.
/// {@endtemplate}

class RemoteCharacterRepository extends CharacterRepository
    with RemoteCharacterRepositoryMapper {
  /// {@macro data.remote_character_repository}
  RemoteCharacterRepository({
    required RemoteCharacterService remoteCharacterService,
    required SafeApiCall safeApiCall,
  })  : _remoteCharacterService = remoteCharacterService,
        _safeApiCall = safeApiCall;
  final RemoteCharacterService _remoteCharacterService;
  final SafeApiCall _safeApiCall;

  @override
  Future<Result<PaginatedCharacterList>> findByPage(int page) {
    return _safeApiCall(
      () async {
        final response = await _remoteCharacterService.findByPage(page);
        final result =
            response.handleApiResponse(paginatedCharacterListFromMap);
        return result;
      },
    );
  }

  @override
  Future<Result<Character>> findById(int id) {
    return _safeApiCall(() async {
      final response = await _remoteCharacterService.findById(id);
      final result = response.handleApiResponse(
        characterFromMap,
      );
      return result;
    });
  }
}
