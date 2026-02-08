import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/config/environment.dart';
import 'core/di/injection_container.dart';
import 'core/utils/logger.dart';
import 'core/data/mock_data_service.dart';

/// Main entry point of the Banco Ademi application
/// 
/// ⚠️ DEMO MODE: This app uses 100% MOCK DATA from JSON files
/// NO real database or API calls are made
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  AppLogger.init();
  AppLogger.info('🚀 Starting Banco ADEMI Demo App...');

  // Load environment variables
  await Environment.init();
  AppLogger.info('✅ Environment: ${Environment.currentEnvironment}');

  // Initialize dependency injection
  await configureDependencies();
  AppLogger.info('✅ Dependencies configured');

  // DEMO MODE: Load mock data from JSON files
  await MockDataService.instance.init();
  AppLogger.info('✅ Mock data loaded (DEMO MODE - NO REAL DATABASE)');

  // TODO: Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // TODO: Initialize Firebase Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  AppLogger.info('✅ App initialization complete');

  runApp(const BancoAdemiApp());
}
