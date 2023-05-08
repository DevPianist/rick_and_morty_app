/// Data layer
library data;

import 'package:data/src/character/character.dart';
import 'package:data/src/common/common.dart';
import 'package:dio/dio.dart';

export 'src/data.dart';

final _client = Dio(
  BaseOptions(
    baseUrl: const String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: '-',
    ),
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  ),
);
final _safeApiCall = SafeApiCall(
  isConnected: () => true,
);

/// `RemoteCharacterRepository` is a concrete
/// implementation of `CharacterRepository`
final remoteCharacterRepository = RemoteCharacterRepository(
  remoteCharacterService: RemoteCharacterService(
    client: _client,
  ),
  safeApiCall: _safeApiCall,
);
