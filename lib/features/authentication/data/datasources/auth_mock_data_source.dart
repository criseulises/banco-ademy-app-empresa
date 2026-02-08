import 'package:injectable/injectable.dart';

/// Mock authentication data source (DEMO MODE)
/// NO real API calls - all data from JSON
@LazySingleton()
class AuthMockDataSource {
  /// Demo login - validates against mock users
  /// 
  /// Valid credentials:
  /// - Email: juan.perez@email.com, PIN: 1234
  /// - Email: maria.rodriguez@email.com, PIN: 5678
  /// - Email: carlos.martinez@email.com, PIN: 9999
  Future<Map<String, dynamic>> login({
    required String email,
    required String pin,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Mock validation
    final mockUsers = {
      'juan.perez@email.com': {'pin': '1234', 'userId': 'user_001'},
      'maria.rodriguez@email.com': {'pin': '5678', 'userId': 'user_002'},
      'carlos.martinez@email.com': {'pin': '9999', 'userId': 'user_003'},
    };

    final user = mockUsers[email];
    if (user == null || user['pin'] != pin) {
      throw Exception('Credenciales inválidas');
    }

    return {
      'accessToken': 'mock_token_${user['userId']}',
      'refreshToken': 'mock_refresh_token_${user['userId']}',
      'userId': user['userId'],
      'expiresIn': 3600,
    };
  }

  /// Demo biometric login
  Future<Map<String, dynamic>> biometricLogin({
    required String userId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return {
      'accessToken': 'mock_token_$userId',
      'refreshToken': 'mock_refresh_token_$userId',
      'userId': userId,
      'expiresIn': 3600,
    };
  }

  /// Demo OTP generation
  Future<void> generateOTP({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 600));
    // Mock OTP sent - in demo, any 6-digit code works
  }

  /// Demo OTP validation
  Future<void> validateOTP({
    required String email,
    required String otp,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    // In demo mode, accept any 6-digit code
    if (otp.length != 6) {
      throw Exception('Código OTP inválido');
    }
  }

  /// Demo logout
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Mock logout
  }

  /// Demo password change
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await Future.delayed(const Duration(milliseconds: 700));
    // Mock password change
  }

  /// Demo PIN change
  Future<void> changePIN({
    required String currentPin,
    required String newPin,
  }) async {
    await Future.delayed(const Duration(milliseconds: 700));
    // Mock PIN change
  }
}
