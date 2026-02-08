/// Secure storage keys for storing sensitive data
/// 
/// Used with flutter_secure_storage for encrypted local storage
class StorageKeys {
  StorageKeys._();

  // ============================================================================
  // AUTHENTICATION & SESSION
  // ============================================================================

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String username = 'username';
  static const String email = 'email';
  static const String deviceId = 'device_id';
  static const String sessionId = 'session_id';
  static const String lastLoginTimestamp = 'last_login_timestamp';
  static const String loginAttempts = 'login_attempts';
  static const String isLoggedIn = 'is_logged_in';

  // ============================================================================
  // BIOMETRIC & SECURITY
  // ============================================================================

  static const String biometricEnabled = 'biometric_enabled';
  static const String biometricPublicKey = 'biometric_public_key';
  static const String biometricCredentials = 'biometric_credentials';
  static const String pinCode = 'pin_code';
  static const String encryptionKey = 'encryption_key';
  static const String encryptionIv = 'encryption_iv';

  // ============================================================================
  // USER PREFERENCES
  // ============================================================================

  static const String languageCode = 'language_code';
  static const String themeMode = 'theme_mode';
  static const String currencyCode = 'currency_code';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String pushNotificationsEnabled = 'push_notifications_enabled';
  static const String emailNotificationsEnabled = 'email_notifications_enabled';
  static const String smsNotificationsEnabled = 'sms_notifications_enabled';
  static const String biometricAuthEnabled = 'biometric_auth_enabled';

  // ============================================================================
  // ONBOARDING & APP STATE
  // ============================================================================

  static const String hasCompletedOnboarding = 'has_completed_onboarding';
  static const String hasSeenTutorial = 'has_seen_tutorial';
  static const String appVersion = 'app_version';
  static const String lastAppOpenTimestamp = 'last_app_open_timestamp';
  static const String firstInstallTimestamp = 'first_install_timestamp';

  // ============================================================================
  // CACHE & DATA
  // ============================================================================

  static const String cachedUserProfile = 'cached_user_profile';
  static const String cachedAccounts = 'cached_accounts';
  static const String cachedCards = 'cached_cards';
  static const String cachedTransactions = 'cached_transactions';
  static const String lastSyncTimestamp = 'last_sync_timestamp';

  // ============================================================================
  // FEATURE FLAGS
  // ============================================================================

  static const String featureFacePhiEnabled = 'feature_facephi_enabled';
  static const String featureCardManagementEnabled =
      'feature_card_management_enabled';
  static const String featureInvestmentsEnabled =
      'feature_investments_enabled';
  static const String featureChatSupportEnabled =
      'feature_chat_support_enabled';

  // ============================================================================
  // TEMPORARY DATA
  // ============================================================================

  static const String tempOtpToken = 'temp_otp_token';
  static const String tempResetToken = 'temp_reset_token';
  static const String tempOnboardingData = 'temp_onboarding_data';
  static const String tempTransferData = 'temp_transfer_data';
  static const String tempPaymentData = 'temp_payment_data';

  // ============================================================================
  // DEVICE INFO
  // ============================================================================

  static const String deviceName = 'device_name';
  static const String deviceModel = 'device_model';
  static const String devicePlatform = 'device_platform';
  static const String deviceOsVersion = 'device_os_version';
  static const String appVersionCode = 'app_version_code';
  static const String fcmToken = 'fcm_token';
}
