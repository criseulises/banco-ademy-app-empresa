import 'environment.dart';

/// API configuration and endpoints management
class ApiConfig {
  ApiConfig._();

  /// Base URL for API requests
  static String get baseUrl => Environment.apiBaseUrl;

  /// API timeout duration in milliseconds
  static int get timeout => Environment.apiTimeout;

  /// API key for authentication
  static String get apiKey => Environment.apiKey;

  /// Enable certificate pinning
  static bool get certificatePinningEnabled =>
      Environment.certificatePinningEnabled;

  /// API version
  static const String apiVersion = 'v1';

  /// Content type for requests
  static const String contentType = 'application/json';

  /// Accept header value
  static const String accept = 'application/json';

  /// Common headers for all requests
  static Map<String, String> get commonHeaders => {
        'Content-Type': contentType,
        'Accept': accept,
        'X-API-Version': apiVersion,
        if (apiKey.isNotEmpty) 'X-API-Key': apiKey,
      };

  /// Certificate pins for SSL pinning
  /// TODO: Add actual certificate hashes for production
  static const List<String> certificatePins = [
    // 'sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=',
    // 'sha256/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=',
  ];
}
