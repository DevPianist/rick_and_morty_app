import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

/// {@template data.extensions}
/// Extensions for the data layer.
/// {@endtemplate}

extension XResponse<T extends Object> on Response<T> {
  /// `isSuccessful` returns `true` if the response is successful.
  bool get isSuccessful {
    if (statusCode == null) return false;
    return statusCode! >= 200 && statusCode! < 300;
  }

  /// `handleApiResponse` handles the response from the API.
  Result<E> handleApiResponse<E>(
    E Function(T body) map,
  ) {
    if (isSuccessful) {
      if (data != null) {
        return Result.success(map(data!));
      } else {
        return Result.error(const NullDataException());
      }
    } else {
      return Result.error(
        ServerException(
          'The server has returned an invalid response. $data',
        ),
      );
    }
  }
}
