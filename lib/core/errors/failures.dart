import 'package:equatable/equatable.dart';

/// Failure classes for clean architecture error handling
/// 
/// These are returned from the domain layer instead of throwing exceptions
abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

/// Server failure
class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

/// Network failure (no internet, timeout, etc.)
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.code});
}

/// Cache failure
class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code});
}

/// Validation failure
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {super.code});
}

/// Authentication failure
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message, {super.code});
}

/// Authorization failure
class AuthorizationFailure extends Failure {
  const AuthorizationFailure(super.message, {super.code});
}

/// Session expired failure
class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure(super.message, {super.code});
}

/// Not found failure
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, {super.code});
}

/// Conflict failure
class ConflictFailure extends Failure {
  const ConflictFailure(super.message, {super.code});
}

/// Parsing failure
class ParsingFailure extends Failure {
  const ParsingFailure(super.message, {super.code});
}

/// Biometric failure
class BiometricFailure extends Failure {
  const BiometricFailure(super.message, {super.code});
}

/// Timeout failure
class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message, {super.code});
}

/// Generic/Unknown failure
class UnknownFailure extends Failure {
  const UnknownFailure(super.message, {super.code});
}
