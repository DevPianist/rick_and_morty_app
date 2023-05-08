/// {@template domain.null_data_exception}
/// Null data exception.
/// {@endtemplate}

class NullDataException implements Exception {
  /// {@macro domain.null_data_exception}
  const NullDataException([
    this.message =
        'The body of the request is not valid, please check the request!',
  ]);

  /// `message` The message of the exception.
  final String message;
}
