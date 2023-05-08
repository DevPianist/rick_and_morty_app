import 'package:domain/domain.dart';

/// {@template data_remote_character_repository_mapper}
/// A mixin that maps data from the [CharacterRepository].
/// {@endtemplate}
mixin RemoteCharacterRepositoryMapper on CharacterRepository {
  int? _pageFromUrl(String? url) {
    final uri = Uri.parse(url ?? '');
    final page = uri.queryParameters['page'];
    return int.tryParse(page ?? '');
  }

  /// `paginatedInfoFromMap` maps the [PaginatedInfo] from a [Map].
  PaginatedInfo paginatedInfoFromMap(Map<String, dynamic> map) => PaginatedInfo(
        count: map['count'] as int,
        pages: map['pages'] as int,
        nextPage: _pageFromUrl(map['next'] as String?),
        prevPage: _pageFromUrl(map['prev'] as String?),
      );

  /// `paginatedCharacterListFromMap` maps the [PaginatedCharacterList]
  /// from a [Map].
  PaginatedCharacterList paginatedCharacterListFromMap(
    Map<String, dynamic> map,
  ) =>
      PaginatedCharacterList(
        info: paginatedInfoFromMap(map['info'] as Map<String, dynamic>),
        results: List<Character>.from(
          (map['results'] as List<dynamic>)
              .map((dynamic e) => characterFromMap(e as Map<String, dynamic>)),
        ),
      );

  /// `characterLocationFromMap` maps the [CharacterLocation] from a [Map].
  CharacterLocation characterLocationFromMap(Map<String, dynamic> map) =>
      CharacterLocation(
        name: (map['name'] as String?) ?? '',
        url: (map['url'] as String?) ?? '',
      );

  /// `characterFromMap` maps the [Character] from a [Map].
  Character characterFromMap(Map<String, dynamic> map) => Character(
        id: map['id'] as int,
        name: map['name'] as String,
        status: map['status'] as String,
        species: map['species'] as String,
        type: map['type'] as String,
        gender: map['gender'] as String,
        origin: characterLocationFromMap(map['origin'] as Map<String, dynamic>),
        location:
            characterLocationFromMap(map['location'] as Map<String, dynamic>),
        image: map['image'] as String,
        episode: List<String>.from(map['episode'] as List<dynamic>),
        url: map['url'] as String,
        created: map['created'] as String,
      );
}
