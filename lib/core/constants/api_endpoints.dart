/// API endpoints for all backend services
/// 
/// Organized by feature/domain
class ApiEndpoints {
  ApiEndpoints._();

  // Base paths
  static const String api = '/api/v1';

  // ============================================================================
  // AUTHENTICATION & SECURITY
  // ============================================================================

  /// Authentication endpoints
  static const String authBase = '$api/auth';
  static const String login = '$authBase/login';
  static const String logout = '$authBase/logout';
  static const String refreshToken = '$authBase/refresh';
  static const String validateToken = '$authBase/validate';
  static const String biometricLogin = '$authBase/biometric/login';
  static const String register = '$authBase/register';
  static const String forgotPassword = '$authBase/forgot-password';
  static const String resetPassword = '$authBase/reset-password';
  static const String changePassword = '$authBase/change-password';
  static const String validateOtp = '$authBase/validate-otp';
  static const String resendOtp = '$authBase/resend-otp';

  /// Device management
  static const String devicesBase = '$authBase/devices';
  static const String registerDevice = '$devicesBase/register';
  static const String listDevices = '$devicesBase';
  static String deviceDetails(String deviceId) => '$devicesBase/$deviceId';
  static String removeDevice(String deviceId) => '$devicesBase/$deviceId';

  // ============================================================================
  // ONBOARDING
  // ============================================================================

  static const String onboardingBase = '$api/onboarding';
  static const String startOnboarding = '$onboardingBase/start';
  static const String personalInfo = '$onboardingBase/personal-info';
  static const String documentValidation = '$onboardingBase/documents';
  static const String facePhiValidation = '$onboardingBase/facephi';
  static const String kycValidation = '$onboardingBase/kyc';
  static const String electronicSignature = '$onboardingBase/signature';
  static const String completeOnboarding = '$onboardingBase/complete';

  // ============================================================================
  // USER PROFILE
  // ============================================================================

  static const String profileBase = '$api/profile';
  static const String getProfile = profileBase;
  static const String updateProfile = profileBase;
  static const String updateAvatar = '$profileBase/avatar';
  static const String updateEmail = '$profileBase/email';
  static const String updatePhone = '$profileBase/phone';
  static const String getNotificationSettings = '$profileBase/notifications';
  static const String updateNotificationSettings = '$profileBase/notifications';
  static const String getSecuritySettings = '$profileBase/security';

  // ============================================================================
  // ACCOUNTS
  // ============================================================================

  static const String accountsBase = '$api/accounts';
  static const String listAccounts = accountsBase;
  static String accountDetails(String accountId) => '$accountsBase/$accountId';
  static String accountBalance(String accountId) =>
      '$accountsBase/$accountId/balance';
  static String accountTransactions(String accountId) =>
      '$accountsBase/$accountId/transactions';
  static String accountStatement(String accountId) =>
      '$accountsBase/$accountId/statement';
  static const String accountTypes = '$accountsBase/types';

  // ============================================================================
  // CARDS
  // ============================================================================

  static const String cardsBase = '$api/cards';
  static const String listCards = cardsBase;
  static String cardDetails(String cardId) => '$cardsBase/$cardId';
  static String cardTransactions(String cardId) =>
      '$cardsBase/$cardId/transactions';
  static String blockCard(String cardId) => '$cardsBase/$cardId/block';
  static String unblockCard(String cardId) => '$cardsBase/$cardId/unblock';
  static String activateCard(String cardId) => '$cardsBase/$cardId/activate';
  static String setCardPin(String cardId) => '$cardsBase/$cardId/pin';
  static String cardLimits(String cardId) => '$cardsBase/$cardId/limits';
  static String updateCardLimits(String cardId) => '$cardsBase/$cardId/limits';

  // ============================================================================
  // TRANSFERS
  // ============================================================================

  static const String transfersBase = '$api/transfers';
  static const String ownTransfer = '$transfersBase/own';
  static const String internalTransfer = '$transfersBase/internal';
  static const String achTransfer = '$transfersBase/ach';
  static const String lbtrTransfer = '$transfersBase/lbtr';
  static const String scheduledTransfers = '$transfersBase/scheduled';
  static String cancelScheduledTransfer(String transferId) =>
      '$transfersBase/scheduled/$transferId/cancel';
  static const String transferBeneficiaries = '$transfersBase/beneficiaries';
  static String transferDetails(String transferId) =>
      '$transfersBase/$transferId';
  static const String validateTransfer = '$transfersBase/validate';

  // ============================================================================
  // PAYMENTS
  // ============================================================================

  static const String paymentsBase = '$api/payments';
  static const String paymentServices = '$paymentsBase/services';
  static const String paymentAffiliations = '$paymentsBase/affiliations';
  static const String payBill = '$paymentsBase/bill';
  static const String mobileTopUp = '$paymentsBase/mobile-topup';
  static const String scheduledPayments = '$paymentsBase/scheduled';
  static String paymentDetails(String paymentId) => '$paymentsBase/$paymentId';
  static const String validatePayment = '$paymentsBase/validate';
  static const String paymentHistory = '$paymentsBase/history';

  // ============================================================================
  // LOANS
  // ============================================================================

  static const String loansBase = '$api/loans';
  static const String listLoans = loansBase;
  static String loanDetails(String loanId) => '$loansBase/$loanId';
  static String loanPayments(String loanId) => '$loansBase/$loanId/payments';
  static String loanPaymentSchedule(String loanId) =>
      '$loansBase/$loanId/schedule';
  static const String loanApplications = '$loansBase/applications';
  static const String applyForLoan = '$loansBase/apply';
  static String loanApplicationStatus(String applicationId) =>
      '$loansBase/applications/$applicationId';

  // ============================================================================
  // INVESTMENTS
  // ============================================================================

  static const String investmentsBase = '$api/investments';
  static const String listInvestments = investmentsBase;
  static String investmentDetails(String investmentId) =>
      '$investmentsBase/$investmentId';
  static const String investmentProducts = '$investmentsBase/products';
  static const String createInvestment = investmentsBase;
  static String investmentTransactions(String investmentId) =>
      '$investmentsBase/$investmentId/transactions';

  // ============================================================================
  // NOTIFICATIONS
  // ============================================================================

  static const String notificationsBase = '$api/notifications';
  static const String listNotifications = notificationsBase;
  static String markNotificationAsRead(String notificationId) =>
      '$notificationsBase/$notificationId/read';
  static const String markAllNotificationsAsRead =
      '$notificationsBase/read-all';
  static String deleteNotification(String notificationId) =>
      '$notificationsBase/$notificationId';
  static const String notificationPreferences =
      '$notificationsBase/preferences';
  static const String registerPushToken = '$notificationsBase/push-token';

  // ============================================================================
  // SUPPORT
  // ============================================================================

  static const String supportBase = '$api/support';
  static const String contactInfo = '$supportBase/contact';
  static const String faq = '$supportBase/faq';
  static const String submitTicket = '$supportBase/tickets';
  static const String chatSupport = '$supportBase/chat';

  // ============================================================================
  // UTILITIES
  // ============================================================================

  static const String utilsBase = '$api/utils';
  static const String countriesList = '$utilsBase/countries';
  static const String citiesList = '$utilsBase/cities';
  static const String banksList = '$utilsBase/banks';
  static const String currenciesList = '$utilsBase/currencies';
  static const String exchangeRates = '$utilsBase/exchange-rates';
}
