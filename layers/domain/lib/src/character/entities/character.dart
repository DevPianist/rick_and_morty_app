import 'package:domain/src/character/entities/character_location.dart';

/// {@template domain.character}
/// Character domain entity
/// {@endtemplate}
class Character {
  /// {@macro domain.character}
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  /// `id` The character's unique ID.
  final int id;

  /// `name` The name of the character.
  final String name;

  /// `status` The status of the character ('Alive', 'Dead' or 'unknown').
  final String status;

  /// `species` The species of the character.
  final String species;

  /// `type` The type or subspecies of the character.
  final String type;

  /// `gender` The gender of the character ('Male', 'Female' or 'unknown').
  final String gender;

  /// `origin` Name and link to the character's origin location.
  final CharacterLocation origin;

  /// `location` Name and link to the character's last known location endpoint.
  final CharacterLocation location;

  /// `image` Link to the character's image.
  final String image;

  /// `episode` List of episodes in which this character appeared.
  final List<String> episode;

  /// `url` Link to the character's own URL endpoint.
  final String url;

  /// `created` Time at which the character was created in the database.
  final String created;
}
