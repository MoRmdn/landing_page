import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../utilities/custom_logger.dart' show CustomLogger;

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService._(this._remoteConfig);

  static Future<RemoteConfigService> initialize() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(microseconds: 30),
        ),
      );

      // Set default values (optional)
      await remoteConfig.setDefaults(<String, dynamic>{
        'android_version': 1,
        'ios_version': 1,
        'isProduction': false,
      });

      // Fetch and activate values with retry
      int retryCount = 0;
      const maxRetries = 3;

      while (retryCount < maxRetries) {
        try {
          await remoteConfig.fetchAndActivate();
          break;
        } catch (e) {
          retryCount++;
          if (retryCount == maxRetries) {
            CustomLogger.instance.error("Remote config error: $e");
            // Continue with default values if all retries fail
            break;
          }
          // Wait before retrying
          await Future.delayed(Duration(seconds: 1 * retryCount));
        }
      }

      return RemoteConfigService._(remoteConfig);
    } catch (e) {
      CustomLogger.instance.error("Remote config initialization error: $e");
      // Return instance with default values if initialization fails
      return RemoteConfigService._(remoteConfig);
    }
  }

  String getSConfig(String value) {
    return _remoteConfig.getString(value);
  }

  int getIConfig(String value) {
    return _remoteConfig.getInt(value);
  }

  bool getBConfig(String value) {
    return _remoteConfig.getBool(value);
  }
}
