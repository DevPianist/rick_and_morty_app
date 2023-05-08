import 'package:domain/domain.dart';

/// {@template data.safe_api_call}
/// A class that wraps an API call in a try/catch block.
/// {@endtemplate}
class SafeApiCall {
  /// {@macro data.safe_api_call}
  const SafeApiCall({
    required this.isConnected,
  });

  /// `isConnected` returns `true` if the device is connected to the internet.
  final bool Function() isConnected;

  /// `call` wraps an API call in a try/catch block.
  Future<Result<T>> call<T>(Future<Result<T>> Function() apiCall) async {
    if (isConnected()) {
      try {
        final result = await apiCall();
        return result;
      } on Exception catch (e) {
        return Result.error(e);
      }
    } else {
      return Result.error(const OfflineException());
    }
  }
}
