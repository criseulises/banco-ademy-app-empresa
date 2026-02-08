/// Custom exceptions for the application
library;

/// Base exception class
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException(this.message, {this.code, this.details});

  @override
  String toString() => 'AppException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Server-related exceptions
class ServerException extends AppException {
  const ServerException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Authentication exceptions
class AuthenticationException extends AppException {
  const AuthenticationException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Authorization exceptions
class AuthorizationException extends AppException {
  const AuthorizationException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Validation exceptions
class ValidationException extends AppException {
  const ValidationException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Session expired exception
class SessionExpiredException extends AppException {
  const SessionExpiredException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Biometric authentication exception
class BiometricException extends AppException {
  const BiometricException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Timeout exception
class TimeoutException extends AppException {
  const TimeoutException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Not found exception
class NotFoundException extends AppException {
  const NotFoundException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Conflict exception (e.g., duplicate entry)
class ConflictException extends AppException {
  const ConflictException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Parsing exception
class ParsingException extends AppException {
  const ParsingException(
    super.message, {
    super.code,
    super.details,
  });
}

/// Storage exception
class StorageException extends AppException {
  const StorageException(
    super.message, {
    super.code,
    super.details,
  });
}
