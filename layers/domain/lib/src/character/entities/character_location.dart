/// {@template domain.character_location}
/// Character location domain entity
/// {@endtemplate}

class CharacterLocation {
  /// {@macro domain.character_location}
  const CharacterLocation({
    required this.name,
    required this.url,
  });

  /// `name` The name of the location.
  final String name;

  /// `url` Link to the location's own URL endpoint.
  final String url;
}
