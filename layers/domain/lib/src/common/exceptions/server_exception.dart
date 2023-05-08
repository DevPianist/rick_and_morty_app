/// {@template domain.server_exception}
/// Server exception.
/// {@endtemplate}
class ServerException implements Exception {
  /// {@macro domain.server_exception}
  const ServerException([this.message = 'Server error']);

  /// `message` The exception message.
  final String message;
}
