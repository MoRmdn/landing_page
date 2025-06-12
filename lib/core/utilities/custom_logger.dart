import 'package:flutter/foundation.dart';
import '/core/global.dart' show Global;

enum LoggerType { info, success, warning, error }

class CustomLogger {
  static final CustomLogger instance = CustomLogger._internal();

  factory CustomLogger() => instance;

  CustomLogger._internal();

  bool get _disableLogging => Global.remoteConfigProduction && kReleaseMode;

  void call(String msg, {required LoggerType type}) {
    if (_disableLogging) return;

    switch (type) {
      case LoggerType.info:
        info(msg);
        break;
      case LoggerType.success:
        success(msg);
        break;
      case LoggerType.warning:
        warning(msg);
        break;
      case LoggerType.error:
        error(msg);
        break;
    }
  }

  // Blue text
  void info(String msg) {
    if (_disableLogging) return;

    print('\x1B[34m[Info] $msg\x1B[0m');
  }

  // Green text
  void success(String msg) {
    if (_disableLogging) return;

    print('\x1B[32m[Success] $msg\x1B[0m');
  }

  // Yellow text
  void warning(String msg) {
    if (_disableLogging) return;

    print('\x1B[33m[Warning] $msg\x1B[0m');
  }

  // Red text
  void error(String msg) {
    if (_disableLogging) return;

    print('\x1B[31m[Error] $msg\x1B[0m');
  }
}
