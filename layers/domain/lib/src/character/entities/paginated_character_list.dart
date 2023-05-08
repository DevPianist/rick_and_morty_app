import 'package:domain/src/character/entities/character.dart';
import 'package:domain/src/common/entities/paginated_info.dart';

/// {@template domain.paginated_character_list}
/// Paginated character list entity.
/// {@endtemplate}
class PaginatedCharacterList {
  /// {@macro domain.paginated_character_list}
  const PaginatedCharacterList({
    this.info,
    required this.results,
  });

  /// `results` The list of characters.
  final List<Character> results;

  /// `info` Information about the pages.
  final PaginatedInfo? info;
}
