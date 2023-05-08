/// {@template domain.result}
/// Result entity.
/// {@endtemplate}
abstract class Result<T> {
  /// {@macro domain.result}
  const Result();

  /// `success` The result is successful.
  factory Result.success(T data) = SuccessResult<T>;

  /// `error` The result is an error.
  factory Result.error(Exception exception) = ErrorResult<T>;
}

/// {@template domain.success_result}
/// Success result.
/// {@endtemplate}
class SuccessResult<T> implements Result<T> {
  /// {@macro domain.success_result}
  const SuccessResult(this.data);

  /// `data` The data wrapped by the result.
  final T data;
}

/// {@template domain.error_result}
/// Error result.
/// {@endtemplate}
class ErrorResult<T> implements Result<T> {
  /// {@macro domain.error_result}
  const ErrorResult(this.exception);

  /// `exception` The exception wrapped by the result.
  final Exception exception;
}
