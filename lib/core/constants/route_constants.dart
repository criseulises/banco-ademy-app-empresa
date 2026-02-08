/// Route names for navigation
/// 
/// Centralized location for all route names used in the application
class RouteConstants {
  RouteConstants._();

  // ============================================================================
  // AUTHENTICATION ROUTES
  // ============================================================================

  static const String splash = '/';
  static const String login = '/login';
  static const String biometricLogin = '/biometric-login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String verifyCode = '/verify-code';
  static const String resetPassword = '/reset-password';
  static const String otpVerification = '/otp-verification';

  // ============================================================================
  // ONBOARDING ROUTES
  // ============================================================================

  static const String onboarding = '/onboarding';
  static const String onboardingPersonalInfo = '/onboarding/personal-info';
  static const String onboardingDocuments = '/onboarding/documents';
  static const String onboardingFacePhi = '/onboarding/facephi';
  static const String onboardingKyc = '/onboarding/kyc';
  static const String onboardingSignature = '/onboarding/signature';
  static const String onboardingComplete = '/onboarding/complete';

  // ============================================================================
  // MAIN APP ROUTES
  // ============================================================================

  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String transactions = '/transactions';
  static const String transactionHistory = '/transactions/history';

  // ============================================================================
  // ACCOUNTS ROUTES
  // ============================================================================

  static const String accounts = '/accounts';
  static const String accountDetails = '/accounts/:id';
  static const String accountTransactions = '/accounts/:id/transactions';
  static const String accountStatement = '/accounts/:id/statement';

  // ============================================================================
  // CARDS ROUTES
  // ============================================================================

  static const String cards = '/cards';
  static const String cardDetails = '/cards/:id';
  static const String cardTransactions = '/cards/:id/transactions';
  static const String cardBlock = '/cards/:id/block';
  static const String cardActivate = '/cards/:id/activate';
  static const String cardPin = '/cards/:id/pin';
  static const String cardLimits = '/cards/:id/limits';

  // ============================================================================
  // TRANSFERS ROUTES
  // ============================================================================

  static const String transfers = '/transfers';
  static const String ownTransfer = '/transfers/own';
  static const String thirdPartyTransfer = '/transfers/third-party';
  static const String internalTransfer = '/transfers/internal';
  static const String achTransfer = '/transfers/ach';
  static const String lbtrTransfer = '/transfers/lbtr';
  static const String scheduledTransfers = '/transfers/scheduled';
  static const String transferBeneficiaries = '/transfers/beneficiaries';
  static const String addBeneficiary = '/transfers/beneficiaries/add';
  static const String transferConfirmation = '/transfers/confirmation';
  static const String transferReceipt = '/transfers/receipt';

  // ============================================================================
  // PAYMENTS ROUTES
  // ============================================================================

  static const String payments = '/payments';
  static const String cardPayment = '/payments/card';
  static const String servicePayment = '/payments/service';
  static const String paymentServices = '/payments/services';
  static const String payBill = '/payments/bill';
  static const String mobileTopUp = '/payments/mobile-topup';
  static const String paymentAffiliations = '/payments/affiliations';
  static const String scheduledPayments = '/payments/scheduled';
  static const String paymentConfirmation = '/payments/confirmation';
  static const String paymentReceipt = '/payments/receipt';

  // ============================================================================
  // SCHEDULED ROUTES
  // ============================================================================

  static const String scheduled = '/scheduled';
  static const String scheduledThirdPartyTransfer = '/scheduled/third-party-transfer';

  // ============================================================================
  // LOANS ROUTES
  // ============================================================================

  static const String loans = '/loans';
  static const String loanDetails = '/loans/:id';
  static const String loanPayment = '/loans/:id/payment';
  static const String loanPaymentSchedule = '/loans/:id/schedule';
  static const String loanApplications = '/loans/applications';
  static const String applyForLoan = '/loans/apply';

  // ============================================================================
  // INVESTMENTS ROUTES
  // ============================================================================

  static const String investments = '/investments';
  static const String investmentDetails = '/investments/:id';
  static const String investmentProducts = '/investments/products';
  static const String createInvestment = '/investments/create';

  // ============================================================================
  // PROFILE ROUTES
  // ============================================================================

  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String changePassword = '/profile/change-password';
  static const String notificationSettings = '/profile/notifications';
  static const String securitySettings = '/profile/security';
  static const String deviceManagement = '/profile/devices';
  static const String language = '/profile/language';

  // ============================================================================
  // NOTIFICATIONS ROUTES
  // ============================================================================

  static const String notifications = '/notifications';
  static const String notificationDetails = '/notifications/:id';

  // ============================================================================
  // SUPPORT ROUTES
  // ============================================================================

  static const String support = '/support';
  static const String contactUs = '/support/contact';
  static const String faq = '/support/faq';
  static const String chat = '/support/chat';

  // ============================================================================
  // SETTINGS ROUTES
  // ============================================================================

  static const String settings = '/settings';
  static const String about = '/settings/about';
  static const String termsAndConditions = '/settings/terms';
  static const String privacyPolicy = '/settings/privacy';

  // ============================================================================
  // ERROR ROUTES
  // ============================================================================

  static const String error = '/error';
  static const String notFound = '/404';
  static const String maintenance = '/maintenance';
  static const String noInternet = '/no-internet';
}
