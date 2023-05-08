import 'package:dio/dio.dart';

/// {@template data.remote_character_service}
/// Remote character service that uses the [Dio] package to retrieve data.
/// {@endtemplate}
class RemoteCharacterService {
  /// {@macro data.remote_character_service}
  const RemoteCharacterService({
    required Dio client,
  }) : _client = client;

  final Dio _client;

  /// `findByPage` Retrieves a list of characters by page.
  Future<Response<Map<String, dynamic>>> findByPage(int page) {
    return _client.get<Map<String, dynamic>>(
      '/api/character/?page=$page',
    );
  }

  /// `findById` Retrieves a character by id.
  Future<Response<Map<String, dynamic>>> findById(int id) {
    return _client.get<Map<String, dynamic>>(
      '/api/character/$id',
    );
  }
}
