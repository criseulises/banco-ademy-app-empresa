import 'environment.dart';

/// Application-wide configuration
class AppConfig {
  AppConfig._();

  /// Application name
  static String get appName => Environment.appName;

  /// Application version - TODO: Get from package_info_plus
  static const String appVersion = '1.0.0';

  /// Build number
  static const String buildNumber = '1';

  /// API base URL
  static String get apiBaseUrl => Environment.apiBaseUrl;

  /// API timeout in milliseconds
  static int get apiTimeout => Environment.apiTimeout;

  /// Enable biometric authentication
  static bool get enableBiometricAuth => Environment.enableBiometricAuth;

  /// Enable FacePhi validation
  static bool get enableFacePhiValidation => Environment.enableFacePhiValidation;

  /// Session timeout in minutes
  static int get sessionTimeoutMinutes => Environment.sessionTimeoutMinutes;

  /// Maximum login attempts before lockout
  static int get maxLoginAttempts => Environment.maxLoginAttempts;

  /// OTP length
  static int get otpLength => Environment.otpLength;

  /// OTP expiry time in seconds
  static int get otpExpirySeconds => Environment.otpExpirySeconds;

  /// WhatsApp support number
  static String get whatsappNumber => Environment.whatsappNumber;

  /// Default language code
  static String get defaultLanguage => Environment.defaultLanguage;

  /// Supported language codes
  static List<String> get supportedLanguages => Environment.supportedLanguages;

  /// Enable analytics
  static bool get enableAnalytics => Environment.enableAnalytics;

  /// Enable crashlytics
  static bool get enableCrashlytics => Environment.enableCrashlytics;

  /// Debug mode
  static bool get debugMode => Environment.debugMode;

  /// Check if app is in production
  static bool get isProduction => Environment.isProduction;

  /// Check if app is in development
  static bool get isDevelopment => Environment.isDevelopment;

  /// Check if app is in staging
  static bool get isStaging => Environment.isStaging;
}
