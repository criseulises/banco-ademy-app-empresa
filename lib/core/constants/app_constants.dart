/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Information
  static const String appName = 'Banco Ademi';
  static const String appTagline = 'Tu banco, siempre contigo';

  // Date & Time Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String monthYearFormat = 'MMMM yyyy';

  // Currency
  static const String currencySymbol = 'RD\$';
  static const String currencyCode = 'DOP';
  static const String usCurrencyCode = 'USD';

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 20;
  static const int minUsernameLength = 4;
  static const int maxUsernameLength = 20;
  static const int otpLength = 6;
  static const int otpResendTimeSeconds = 60;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Session
  static const int sessionTimeoutMinutes = 15;
  static const int sessionWarningMinutes = 2;

  // Biometric
  static const String biometricReason = 'Autenticar para acceder a tu cuenta';
  static const int maxBiometricAttempts = 3;

  // Transaction Limits (example values - should come from backend)
  static const double minTransferAmount = 1.0;
  static const double maxTransferAmount = 1000000.0;
  static const double minPaymentAmount = 1.0;

  // Cache Duration
  static const int cacheExpiryHours = 24;
  static const int accountsCacheMinutes = 5;
  static const int transactionsCacheMinutes = 2;

  // Animation Durations
  static const int shortAnimationDurationMs = 200;
  static const int mediumAnimationDurationMs = 300;
  static const int longAnimationDurationMs = 500;

  // Network
  static const int connectionTimeoutSeconds = 30;
  static const int receiveTimeoutSeconds = 30;
  static const int maxRetryAttempts = 3;

  // Image & File
  static const int maxImageSizeBytes = 5 * 1024 * 1024; // 5MB
  static const int maxFileSizeBytes = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageExtensions = ['jpg', 'jpeg', 'png'];
  static const List<String> allowedDocumentExtensions = ['pdf', 'jpg', 'jpeg', 'png'];

  // Contact
  static const String supportEmail = 'soporte@bancoademi.com';
  static const String supportPhone = '+1-809-555-0100';
  static const String whatsappNumber = '+18095550100';
  static const String websiteUrl = 'https://www.bancoademi.com';

  // Social Media
  static const String facebookUrl = 'https://facebook.com/bancoademi';
  static const String instagramUrl = 'https://instagram.com/bancoademi';
  static const String twitterUrl = 'https://twitter.com/bancoademi';
  static const String linkedinUrl = 'https://linkedin.com/company/bancoademi';

  // Features Toggle (should ideally come from remote config)
  static const bool enableFacialRecognition = true;
  static const bool enableFingerprint = true;
  static const bool enablePushNotifications = true;
  static const bool enableBiometricLogin = true;

  // Error Messages
  static const String genericErrorMessage =
      'Ha ocurrido un error. Por favor, intenta nuevamente.';
  static const String networkErrorMessage =
      'No se pudo conectar al servidor. Verifica tu conexión a internet.';
  static const String sessionExpiredMessage =
      'Tu sesión ha expirado. Por favor, inicia sesión nuevamente.';
  static const String unauthorizedMessage = 'No tienes autorización para realizar esta acción.';

  // Success Messages
  static const String genericSuccessMessage = 'Operación completada exitosamente.';
  static const String loginSuccessMessage = 'Bienvenido de nuevo.';
  static const String logoutSuccessMessage = 'Has cerrado sesión correctamente.';

  // Regex Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^\+?1?\d{10,15}$';
  static const String alphanumericPattern = r'^[a-zA-Z0-9]+$';
  static const String numbersOnlyPattern = r'^[0-9]+$';

  // API Retry Configuration
  static const List<int> retryStatusCodes = [408, 429, 500, 502, 503, 504];
}
