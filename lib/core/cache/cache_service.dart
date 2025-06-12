import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utilities/custom_logger.dart';

abstract interface class CacheService {
  Future<bool> writeToCache({
    required String key,
    required String value,
  });

  Future<String?> readFromCache({required String key});

  Future<bool> containsKey({required String key});

  Future<bool> deleteKey({required String key});

  Future<bool> clearCache();
}

class CacheServiceImpl implements CacheService {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();
  final CustomLogger _logger = CustomLogger.instance;

  @override
  Future<bool> writeToCache({
    required String key,
    required String value,
  }) async {
    try {
      _logger.success("Write Data: [$value] to key: [$key]");

      await _flutterSecureStorage.write(key: key, value: value.toString());

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> readFromCache({required String key}) async {
    try {
      final dataAsString = await _flutterSecureStorage.read(key: key);

      _logger.success("Read Data: [$dataAsString] from key: [$key]");

      if (dataAsString == null) return null;

      return dataAsString;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> containsKey({required String key}) async {
    try {
      _logger.success("Deleted key: [$key]");
      return _flutterSecureStorage.containsKey(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteKey({required String key}) async {
    try {
      _logger.success("Cache Cleared");
      await _flutterSecureStorage.delete(key: key);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> clearCache() async {
    try {
      await _flutterSecureStorage.deleteAll();

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
