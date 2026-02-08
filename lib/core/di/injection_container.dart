/// Dependency injection container setup
/// 
/// Uses get_it and injectable for dependency management
library;

import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';

// TODO: Import generated file after running build_runner
// import 'injection_container.config.dart';

final getIt = GetIt.instance;

/// Configure all dependencies
/// 
/// Run `flutter pub run build_runner build` to generate the configuration
Future<void> configureDependencies() async {
  // TODO: Initialize injectable
  // getIt.init();

  // Manual registration until injectable is configured
  await _registerCoreDependencies();
  await _registerFeatureDependencies();
}

/// Register core layer dependencies
Future<void> _registerCoreDependencies() async {
  // TODO: Register core services
  // Network
  // getIt.registerLazySingleton<Dio>(() => Dio());
  // getIt.registerLazySingleton<DioClient>(() => DioClient(getIt()));
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Security
  // getIt.registerLazySingleton<BiometricService>(() => BiometricServiceImpl());
  // getIt.registerLazySingleton<EncryptionService>(() => EncryptionServiceImpl());
  // getIt.registerLazySingleton<SecureStorageService>(() => SecureStorageServiceImpl());

  // Storage
  // getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Services
  // getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  // getIt.registerLazySingleton<NotificationService>(() => NotificationService());
  // getIt.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
}

/// Register feature layer dependencies
Future<void> _registerFeatureDependencies() async {
  // TODO: Register feature dependencies
  // Authentication
  // getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(getIt()));
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt(), getIt()));
  // getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt()));
  // getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt()));

  // Add other features...
}
