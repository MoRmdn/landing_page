import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A service class that handles showing toast messages throughout the application.
class ToastService {
  /// Private constructor to prevent direct instantiation
  ToastService._();

  /// Singleton instance
  static final ToastService _instance = ToastService._();

  /// Factory constructor to return the singleton instance
  factory ToastService() => _instance;

  /// Shows a toast message with the specified message and state
  ///
  /// [msg] - The message to display
  /// [state] - The type of toast (success, error, warning, info)
  /// [duration] - Optional duration in seconds (defaults to 5 seconds)
  /// [position] - Optional position of the toast (defaults to bottom)
  void show({
    required String msg,
    required ToastState state,
    int duration = 5,
    ToastGravity position = ToastGravity.BOTTOM,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: position,
      timeInSecForIosWeb: duration,
      backgroundColor: _getBackgroundColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// Shows a success toast message
  void showSuccess(String msg) => show(msg: msg, state: ToastState.success);

  /// Shows an error toast message
  void showError(String msg) => show(msg: msg, state: ToastState.error);

  /// Shows a warning toast message
  void showWarning(String msg) => show(msg: msg, state: ToastState.warning);

  /// Shows an info toast message
  void showInfo(String msg) => show(msg: msg, state: ToastState.info);

  /// Returns the appropriate background color for the given toast state
  Color? _getBackgroundColor(ToastState state) {
    switch (state) {
      case ToastState.success:
        return Colors.green;
      case ToastState.warning:
        return Colors.amber;
      case ToastState.error:
        return Colors.red;
      case ToastState.info:
        return null;
    }
  }
}

/// Enum representing different types of toast messages
enum ToastState { success, error, warning, info }
