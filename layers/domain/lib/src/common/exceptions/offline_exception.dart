/// {@template domain.offline_exception}
/// Offline exception.
/// {@endtemplate}
class OfflineException implements Exception {
  /// {@macro domain.offline_exception}
  const OfflineException([
    this.message = 'Device Offline, please check your connection!',
  ]) : super();

  /// `message` The exception message.
  final String message;
}
