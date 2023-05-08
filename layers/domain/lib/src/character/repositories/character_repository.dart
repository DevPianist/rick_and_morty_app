import 'package:domain/src/character/entities/entities.dart';
import 'package:domain/src/common/entities/result.dart';

/// {@template domain.character_repository}
/// Character repository interface for retrieving character data.
/// {@endtemplate}
abstract class CharacterRepository {
  /// Retrieves a list of characters by page.
  Future<Result<PaginatedCharacterList>> findByPage(int page);

  /// Retrieves a character by id.
  Future<Result<Character>> findById(int id);
}
