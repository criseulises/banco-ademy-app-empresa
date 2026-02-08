import 'package:dio/dio.dart';

import '../constants/app_constants.dart';
import 'exceptions.dart';
import 'failures.dart';

/// Global error handler for the application
/// 
/// Converts exceptions to failures and provides user-friendly error messages
class ErrorHandler {
  ErrorHandler._();

  /// Convert exceptions to failures
  static Failure handleException(Exception exception) {
    if (exception is DioException) {
      return _handleDioException(exception);
    } else if (exception is ServerException) {
      return ServerFailure(exception.message, code: exception.code);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message, code: exception.code);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message, code: exception.code);
    } else if (exception is AuthenticationException) {
      return AuthenticationFailure(exception.message, code: exception.code);
    } else if (exception is AuthorizationException) {
      return AuthorizationFailure(exception.message, code: exception.code);
    } else if (exception is ValidationException) {
      return ValidationFailure(exception.message, code: exception.code);
    } else if (exception is SessionExpiredException) {
      return SessionExpiredFailure(exception.message, code: exception.code);
    } else if (exception is BiometricException) {
      return BiometricFailure(exception.message, code: exception.code);
    } else if (exception is TimeoutException) {
      return TimeoutFailure(exception.message, code: exception.code);
    } else if (exception is NotFoundException) {
      return NotFoundFailure(exception.message, code: exception.code);
    } else if (exception is ConflictException) {
      return ConflictFailure(exception.message, code: exception.code);
    } else if (exception is ParsingException) {
      return ParsingFailure(exception.message, code: exception.code);
    }

    return UnknownFailure(
      exception.toString(),
      code: 'UNKNOWN_ERROR',
    );
  }

  /// Handle Dio (HTTP client) exceptions
  static Failure _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure(
          'La solicitud tardó demasiado tiempo. Por favor, intenta nuevamente.',
          code: 'TIMEOUT',
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(exception);

      case DioExceptionType.cancel:
        return const UnknownFailure(
          'La solicitud fue cancelada.',
          code: 'REQUEST_CANCELLED',
        );

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return NetworkFailure(
          AppConstants.networkErrorMessage,
          code: 'NETWORK_ERROR',
        );

      case DioExceptionType.badCertificate:
        return const NetworkFailure(
          'Error de certificado SSL. Por favor, contacta con soporte.',
          code: 'SSL_ERROR',
        );
    }
  }

  /// Handle HTTP response errors
  static Failure _handleResponseError(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final data = exception.response?.data;

    // Try to extract error message from response
    String message = AppConstants.genericErrorMessage;
    String? code;

    if (data is Map<String, dynamic>) {
      message = data['message'] ?? data['error'] ?? message;
      code = data['code']?.toString();
    }

    switch (statusCode) {
      case 400:
        return ValidationFailure(message, code: code ?? 'BAD_REQUEST');

      case 401:
        return AuthenticationFailure(
          message,
          code: code ?? 'UNAUTHORIZED',
        );

      case 403:
        return AuthorizationFailure(
          message,
          code: code ?? 'FORBIDDEN',
        );

      case 404:
        return NotFoundFailure(message, code: code ?? 'NOT_FOUND');

      case 409:
        return ConflictFailure(message, code: code ?? 'CONFLICT');

      case 422:
        return ValidationFailure(
          message,
          code: code ?? 'UNPROCESSABLE_ENTITY',
        );

      case 429:
        return const ServerFailure(
          'Demasiadas solicitudes. Por favor, espera un momento.',
          code: 'TOO_MANY_REQUESTS',
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return ServerFailure(
          'Error del servidor. Por favor, intenta más tarde.',
          code: code ?? 'SERVER_ERROR',
        );

      default:
        return ServerFailure(message, code: code ?? 'UNKNOWN_SERVER_ERROR');
    }
  }

  /// Get user-friendly error message from failure
  static String getErrorMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return failure.message;
    } else if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is ValidationFailure) {
      return failure.message;
    } else if (failure is AuthenticationFailure) {
      return failure.message;
    } else if (failure is SessionExpiredFailure) {
      return AppConstants.sessionExpiredMessage;
    } else if (failure is TimeoutFailure) {
      return 'La solicitud tardó demasiado tiempo. Por favor, intenta nuevamente.';
    }

    return failure.message.isNotEmpty
        ? failure.message
        : AppConstants.genericErrorMessage;
  }
}
