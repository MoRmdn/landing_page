import 'dart:ui' show PlatformDispatcher;

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;
import 'package:flutter/material.dart';
import '/app.dart' show MyApp;
import '/firebase_options.dart' show DefaultFirebaseOptions;
import '/injection.dart' show configureInjection;

import 'core/utilities/custom_logger.dart' show CustomLogger;
import 'core/widgets/page_not_found_view.dart' show PageNotFoundView;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure dependency injection first
  configureInjection();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (error) {
    CustomLogger.instance.error("init app error $error");
  }

  ErrorWidget.builder = (errorDetails) => const PageNotFoundView();

  runApp(const MyApp());
}
