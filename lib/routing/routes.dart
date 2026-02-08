import '../core/constants/route_constants.dart';

/// Named route definitions for type-safe navigation
/// 
/// Provides helper methods to generate route paths with parameters
class Routes {
  Routes._();

  // ============================================================================
  // AUTHENTICATION
  // ============================================================================

  static String splash() => RouteConstants.splash;
  static String login() => RouteConstants.login;
  static String biometricLogin() => RouteConstants.biometricLogin;
  static String register() => RouteConstants.register;
  static String forgotPassword() => RouteConstants.forgotPassword;
  static String resetPassword() => RouteConstants.resetPassword;
  static String otpVerification() => RouteConstants.otpVerification;

  // ============================================================================
  // ONBOARDING
  // ============================================================================

  static String onboarding1() => RouteConstants.onboarding1;
  static String onboarding2() => RouteConstants.onboarding2;
  static String onboarding3() => RouteConstants.onboarding3;
  static String onboarding4() => RouteConstants.onboarding4;
  static String onboarding5() => RouteConstants.onboarding5;
  static String onboarding() => RouteConstants.onboarding;
  static String onboardingPersonalInfo() => RouteConstants.onboardingPersonalInfo;
  static String onboardingDocuments() => RouteConstants.onboardingDocuments;
  static String onboardingFacePhi() => RouteConstants.onboardingFacePhi;
  static String onboardingKyc() => RouteConstants.onboardingKyc;
  static String onboardingSignature() => RouteConstants.onboardingSignature;
  static String onboardingComplete() => RouteConstants.onboardingComplete;

  // ============================================================================
  // MAIN APP
  // ============================================================================

  static String home() => RouteConstants.home;
  static String dashboard() => RouteConstants.dashboard;

  // ============================================================================
  // ACCOUNTS
  // ============================================================================

  static String accounts() => RouteConstants.accounts;
  static String accountDetails(String accountId) =>
      RouteConstants.accountDetails.replaceAll(':id', accountId);
  static String accountTransactions(String accountId) =>
      RouteConstants.accountTransactions.replaceAll(':id', accountId);
  static String accountStatement(String accountId) =>
      RouteConstants.accountStatement.replaceAll(':id', accountId);

  // ============================================================================
  // CARDS
  // ============================================================================

  static String cards() => RouteConstants.cards;
  static String cardDetails(String cardId) =>
      RouteConstants.cardDetails.replaceAll(':id', cardId);
  static String cardTransactions(String cardId) =>
      RouteConstants.cardTransactions.replaceAll(':id', cardId);
  static String cardBlock(String cardId) =>
      RouteConstants.cardBlock.replaceAll(':id', cardId);
  static String cardActivate(String cardId) =>
      RouteConstants.cardActivate.replaceAll(':id', cardId);
  static String cardPin(String cardId) =>
      RouteConstants.cardPin.replaceAll(':id', cardId);
  static String cardLimits(String cardId) =>
      RouteConstants.cardLimits.replaceAll(':id', cardId);

  // ============================================================================
  // TRANSFERS
  // ============================================================================

  static String transfers() => RouteConstants.transfers;
  static String ownTransfer() => RouteConstants.ownTransfer;
  static String internalTransfer() => RouteConstants.internalTransfer;
  static String achTransfer() => RouteConstants.achTransfer;
  static String lbtrTransfer() => RouteConstants.lbtrTransfer;
  static String scheduledTransfers() => RouteConstants.scheduledTransfers;
  static String transferBeneficiaries() => RouteConstants.transferBeneficiaries;
  static String addBeneficiary() => RouteConstants.addBeneficiary;
  static String transferConfirmation() => RouteConstants.transferConfirmation;
  static String transferReceipt() => RouteConstants.transferReceipt;

  // ============================================================================
  // PAYMENTS
  // ============================================================================

  static String payments() => RouteConstants.payments;
  static String paymentServices() => RouteConstants.paymentServices;
  static String payBill() => RouteConstants.payBill;
  static String mobileTopUp() => RouteConstants.mobileTopUp;
  static String paymentAffiliations() => RouteConstants.paymentAffiliations;
  static String scheduledPayments() => RouteConstants.scheduledPayments;
  static String paymentConfirmation() => RouteConstants.paymentConfirmation;
  static String paymentReceipt() => RouteConstants.paymentReceipt;

  // ============================================================================
  // LOANS
  // ============================================================================

  static String loans() => RouteConstants.loans;
  static String loanDetails(String loanId) =>
      RouteConstants.loanDetails.replaceAll(':id', loanId);
  static String loanPayment(String loanId) =>
      RouteConstants.loanPayment.replaceAll(':id', loanId);
  static String loanPaymentSchedule(String loanId) =>
      RouteConstants.loanPaymentSchedule.replaceAll(':id', loanId);
  static String loanApplications() => RouteConstants.loanApplications;
  static String applyForLoan() => RouteConstants.applyForLoan;

  // ============================================================================
  // INVESTMENTS
  // ============================================================================

  static String investments() => RouteConstants.investments;
  static String investmentDetails(String investmentId) =>
      RouteConstants.investmentDetails.replaceAll(':id', investmentId);
  static String investmentProducts() => RouteConstants.investmentProducts;
  static String createInvestment() => RouteConstants.createInvestment;

  // ============================================================================
  // PROFILE
  // ============================================================================

  static String profile() => RouteConstants.profile;
  static String editProfile() => RouteConstants.editProfile;
  static String changePassword() => RouteConstants.changePassword;
  static String notificationSettings() => RouteConstants.notificationSettings;
  static String securitySettings() => RouteConstants.securitySettings;
  static String deviceManagement() => RouteConstants.deviceManagement;
  static String language() => RouteConstants.language;

  // ============================================================================
  // NOTIFICATIONS
  // ============================================================================

  static String notifications() => RouteConstants.notifications;
  static String notificationDetails(String notificationId) =>
      RouteConstants.notificationDetails.replaceAll(':id', notificationId);

  // ============================================================================
  // SUPPORT
  // ============================================================================

  static String support() => RouteConstants.support;
  static String contactUs() => RouteConstants.contactUs;
  static String faq() => RouteConstants.faq;
  static String chat() => RouteConstants.chat;

  // ============================================================================
  // SETTINGS
  // ============================================================================

  static String settings() => RouteConstants.settings;
  static String about() => RouteConstants.about;
  static String termsAndConditions() => RouteConstants.termsAndConditions;
  static String privacyPolicy() => RouteConstants.privacyPolicy;

  // ============================================================================
  // ERROR
  // ============================================================================

  static String error() => RouteConstants.error;
  static String notFound() => RouteConstants.notFound;
  static String maintenance() => RouteConstants.maintenance;
  static String noInternet() => RouteConstants.noInternet;
}
