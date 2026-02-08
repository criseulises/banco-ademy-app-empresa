/// Environment configuration for the Banco Ademi application
/// 
/// Manages different environment settings (development, staging, production)
class Environment {
  Environment._();

  static late String apiBaseUrl;
  static late int apiTimeout;
  static late String environment;
  static late bool enableBiometricAuth;
  static late bool enableFacePhiValidation;
  static late bool enableAnalytics;
  static late bool enableCrashlytics;
  static late String encryptionKey;
  static late String apiKey;
  static late bool certificatePinningEnabled;
  static late String facePhiLicenseKey;
  static late String whatsappNumber;
  static late bool debugMode;
  static late String logLevel;
  static late String appName;
  static late String defaultLanguage;
  static late List<String> supportedLanguages;
  static late int sessionTimeoutMinutes;
  static late int maxLoginAttempts;
  static late int otpLength;
  static late int otpExpirySeconds;
  
  /// Get current environment name
  static String get currentEnvironment => environment;

  /// Initialize environment variables
  /// 
  /// TODO: Load from .env file using flutter_dotenv or similar package
  static Future<void> init() async {
    // TODO: Load environment variables from .env file
    // await dotenv.load(fileName: '.env');

    // Default values - replace with actual .env loading
    apiBaseUrl = const String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.bancoademi.com',
    );
    apiTimeout = const int.fromEnvironment('API_TIMEOUT', defaultValue: 30000);
    environment = const String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'development',
    );
    enableBiometricAuth = const bool.fromEnvironment(
      'ENABLE_BIOMETRIC_AUTH',
      defaultValue: true,
    );
    enableFacePhiValidation = const bool.fromEnvironment(
      'ENABLE_FACEPHI_VALIDATION',
      defaultValue: true,
    );
    enableAnalytics = const bool.fromEnvironment(
      'ENABLE_ANALYTICS',
      defaultValue: false,
    );
    enableCrashlytics = const bool.fromEnvironment(
      'ENABLE_CRASHLYTICS',
      defaultValue: false,
    );
    encryptionKey = const String.fromEnvironment(
      'ENCRYPTION_KEY',
      defaultValue: '',
    );
    apiKey = const String.fromEnvironment('API_KEY', defaultValue: '');
    certificatePinningEnabled = const bool.fromEnvironment(
      'CERTIFICATE_PINNING_ENABLED',
      defaultValue: false,
    );
    facePhiLicenseKey = const String.fromEnvironment(
      'FACEPHI_LICENSE_KEY',
      defaultValue: '',
    );
    whatsappNumber = const String.fromEnvironment(
      'WHATSAPP_NUMBER',
      defaultValue: '+1234567890',
    );
    debugMode = const bool.fromEnvironment('DEBUG_MODE', defaultValue: true);
    logLevel = const String.fromEnvironment('LOG_LEVEL', defaultValue: 'debug');
    appName = const String.fromEnvironment(
      'APP_NAME',
      defaultValue: 'Banco Ademi',
    );
    defaultLanguage = const String.fromEnvironment(
      'DEFAULT_LANGUAGE',
      defaultValue: 'es',
    );
    supportedLanguages = const String.fromEnvironment(
      'SUPPORTED_LANGUAGES',
      defaultValue: 'es,en',
    ).split(',');
    sessionTimeoutMinutes = const int.fromEnvironment(
      'SESSION_TIMEOUT_MINUTES',
      defaultValue: 15,
    );
    maxLoginAttempts = const int.fromEnvironment(
      'MAX_LOGIN_ATTEMPTS',
      defaultValue: 3,
    );
    otpLength = const int.fromEnvironment('OTP_LENGTH', defaultValue: 6);
    otpExpirySeconds = const int.fromEnvironment(
      'OTP_EXPIRY_SECONDS',
      defaultValue: 180,
    );
  }

  /// Check if running in development environment
  static bool get isDevelopment => environment == 'development';

  /// Check if running in staging environment
  static bool get isStaging => environment == 'staging';

  /// Check if running in production environment
  static bool get isProduction => environment == 'production';
}
