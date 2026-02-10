import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/route_constants.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/reset_password_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/verify_code_page.dart';
import '../features/accounts/presentation/pages/account_detail_page.dart';
import '../features/cards/presentation/pages/card_detail_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/loans/presentation/pages/loan_detail_page.dart';
import '../features/notifications/presentation/pages/notifications_page.dart';
import '../features/payments/presentation/pages/card_payment_page.dart';
import '../features/payments/presentation/pages/employee_payment_page.dart';
import '../features/payments/presentation/pages/payments_page.dart';
import '../features/payments/presentation/pages/service_payment_page.dart';
import '../features/profile/presentation/pages/more_page.dart';
import '../features/profile/presentation/pages/contact_page.dart';
import '../features/profile/presentation/pages/beneficiaries_page.dart';
import '../features/profile/presentation/pages/scheduled_transfers_page.dart';
import '../features/profile/presentation/pages/settings_page.dart';
import '../features/scheduled/presentation/pages/scheduled_page.dart';
import '../features/scheduled/presentation/pages/scheduled_third_party_transfer_page.dart';
import '../features/transactions/presentation/pages/transaction_history_page.dart';
import '../features/transactions/presentation/pages/transactions_page.dart';
import '../features/transfers/presentation/pages/own_transfer_page.dart';
import '../features/transfers/presentation/pages/third_party_transfer_page.dart';
import '../features/transfers/presentation/pages/transfer_receipt_page.dart';
import '../features/transfers/presentation/pages/transfers_page.dart';
import '../features/onboarding/presentation/pages/onboarding_1_page.dart';
import '../features/onboarding/presentation/pages/onboarding_2_page.dart';
import '../features/onboarding/presentation/pages/onboarding_3_page.dart';
import '../features/onboarding/presentation/pages/onboarding_4_page.dart';
import '../features/onboarding/presentation/pages/onboarding_5_page.dart';
import '../features/requests/presentation/pages/requests_page.dart';

/// Application router configuration using go_router
/// 
/// Defines all routes and navigation structure for the app
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteConstants.onboarding1,
    debugLogDiagnostics: true,
    routes: [
      // ======================================================================
      // AUTHENTICATION ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: RouteConstants.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: RouteConstants.biometricLogin,
        name: 'biometric-login',
        builder: (context, state) {
          // TODO: Return BiometricLoginPage()
          throw UnimplementedError('Biometric login page not implemented');
        },
      ),

      GoRoute(
        path: RouteConstants.register,
        name: 'register',
        builder: (context, state) {
          // TODO: Return RegisterPage()
          throw UnimplementedError('Register page not implemented');
        },
      ),

      GoRoute(
        path: RouteConstants.forgotPassword,
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      GoRoute(
        path: RouteConstants.verifyCode,
        name: 'verify-code',
        builder: (context, state) => const VerifyCodePage(),
      ),

      GoRoute(
        path: RouteConstants.resetPassword,
        name: 'reset-password',
        builder: (context, state) => const ResetPasswordPage(),
      ),

      GoRoute(
        path: RouteConstants.otpVerification,
        name: 'otp-verification',
        builder: (context, state) {
          // TODO: Return OtpVerificationPage()
          throw UnimplementedError('OTP verification page not implemented');
        },
      ),

      // ======================================================================
      // ONBOARDING ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.onboarding1,
        name: 'onboarding-1',
        builder: (context, state) => const Onboarding1Page(),
      ),

      GoRoute(
        path: RouteConstants.onboarding2,
        name: 'onboarding-2',
        builder: (context, state) => const Onboarding2Page(),
      ),

      GoRoute(
        path: RouteConstants.onboarding3,
        name: 'onboarding-3',
        builder: (context, state) => const Onboarding3Page(),
      ),

      GoRoute(
        path: RouteConstants.onboarding4,
        name: 'onboarding-4',
        builder: (context, state) => const Onboarding4Page(),
      ),

      GoRoute(
        path: RouteConstants.onboarding5,
        name: 'onboarding-5',
        builder: (context, state) => const Onboarding5Page(),
      ),

      GoRoute(
        path: RouteConstants.onboarding,
        name: 'onboarding',
        builder: (context, state) {
          // TODO: Return OnboardingPage()
          throw UnimplementedError('Onboarding page not implemented');
        },
      ),

      // ======================================================================
      // MAIN APP ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.home,
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.transactions,
        name: 'transactions',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TransactionsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.transactionHistory,
        name: 'transaction-history',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TransactionHistoryPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      // ======================================================================
      // ACCOUNTS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.accounts,
        name: 'accounts',
        builder: (context, state) {
          // TODO: Return AccountsListPage()
          throw UnimplementedError('Accounts page not implemented');
        },
      ),

      GoRoute(
        path: RouteConstants.accountDetails,
        name: 'account-details',
        builder: (context, state) {
          final extra = state.extra as Map<String, String>? ?? {};
          return AccountDetailPage(
            title: extra['title'] ?? '',
            subtitle: extra['subtitle'] ?? '',
            accountNumber: extra['accountNumber'] ?? '',
            balance: extra['balance'] ?? '',
          );
        },
      ),

      // ======================================================================
      // CARDS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.cards,
        name: 'cards',
        builder: (context, state) {
          // TODO: Return CardsListPage()
          throw UnimplementedError('Cards page not implemented');
        },
      ),

      GoRoute(
        path: RouteConstants.cardDetails,
        name: 'card-details',
        builder: (context, state) {
          final extra = state.extra as Map<String, String>? ?? {};
          return CardDetailPage(
            cardName: extra['cardName'] ?? '',
            cardNumber: extra['cardNumber'] ?? '',
            cardHolder: extra['cardHolder'] ?? '',
            available: extra['available'] ?? '',
            balance: extra['balance'] ?? '',
            brand: extra['brand'] ?? '',
          );
        },
      ),

      // ======================================================================
      // TRANSFERS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.transfers,
        name: 'transfers',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TransfersPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.ownTransfer,
        name: 'own-transfer',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OwnTransferPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.thirdPartyTransfer,
        name: 'third-party-transfer',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ThirdPartyTransferPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.transferReceipt,
        name: 'transfer-receipt',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return TransferReceiptPage(
            origen: extra['origen'] as String? ?? '',
            destino: extra['destino'] as String? ?? '',
            concepto: extra['concepto'] as String? ?? '',
            monto: extra['monto'] as double? ?? 0.0,
          );
        },
      ),

      // ======================================================================
      // PAYMENTS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.payments,
        name: 'payments',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PaymentsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.cardPayment,
        name: 'card-payment',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CardPaymentPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.servicePayment,
        name: 'service-payment',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ServicePaymentPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.employeePayment,
        name: 'employee-payment',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EmployeePaymentPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      // ======================================================================
      // SCHEDULED ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.scheduled,
        name: 'scheduled',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ScheduledPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.scheduledThirdPartyTransfer,
        name: 'scheduled-third-party-transfer',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ScheduledThirdPartyTransferPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      // ======================================================================
      // LOANS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.loans,
        name: 'loans',
        builder: (context, state) {
          // TODO: Return LoansPage()
          throw UnimplementedError('Loans page not implemented');
        },
      ),

      GoRoute(
        path: RouteConstants.loanDetails,
        name: 'loan-details',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return LoanDetailPage(
            title: extra['title'] as String? ?? '',
            subtitle: extra['subtitle'] as String? ?? '',
            loanNumber: extra['loanNumber'] as String? ?? '',
            remainingAmount: extra['remainingAmount'] as String? ?? '',
            originalAmount: extra['originalAmount'] as String? ?? '',
            rate: extra['rate'] as String? ?? '',
            totalInstallments: extra['totalInstallments'] as int? ?? 0,
            paidInstallments: extra['paidInstallments'] as int? ?? 0,
          );
        },
      ),

      // ======================================================================
      // INVESTMENTS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.investments,
        name: 'investments',
        builder: (context, state) {
          // TODO: Return InvestmentsPage()
          throw UnimplementedError('Investments page not implemented');
        },
      ),

      // ======================================================================
      // PROFILE ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.profile,
        name: 'profile',
        builder: (context, state) {
          // TODO: Return ProfilePage()
          throw UnimplementedError('Profile page not implemented');
        },
      ),

      // ======================================================================
      // NOTIFICATIONS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.notifications,
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),

      // ======================================================================
      // REQUESTS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.requests,
        name: 'requests',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RequestsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      // ======================================================================
      // SUPPORT ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.support,
        name: 'support',
        builder: (context, state) {
          // TODO: Return SupportPage()
          throw UnimplementedError('Support page not implemented');
        },
      ),

      // ======================================================================
      // SETTINGS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),

      // ======================================================================
      // OTHER OPTIONS
      // ======================================================================

      GoRoute(
        path: RouteConstants.otherOptions,
        name: 'other-options',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MorePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ),
      ),

      GoRoute(
        path: RouteConstants.contact,
        name: 'contact',
        builder: (context, state) => const ContactPage(),
      ),

      GoRoute(
        path: RouteConstants.beneficiaries,
        name: 'beneficiaries',
        builder: (context, state) => const BeneficiariesPage(),
      ),

      GoRoute(
        path: RouteConstants.scheduledTransfers,
        name: 'scheduled-transfers',
        builder: (context, state) => const ScheduledTransfersPage(),
      ),
    ],

    // Error handling
    errorBuilder: (context, state) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5F6FB),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0095A9),
          title: const Text(
            'P\u00e1gina no encontrada',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.go('/home'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Color(0xFF0095A9)),
              const SizedBox(height: 16),
              Text(
                'La ruta "${state.uri}" no existe',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },

    // TODO: Add redirect logic for authentication
    // redirect: (context, state) {
    //   final isAuthenticated = getIt<AuthBloc>().state is Authenticated;
    //   final isLoginRoute = state.matchedLocation == RouteConstants.login;
    //   
    //   if (!isAuthenticated && !isLoginRoute) {
    //     return RouteConstants.login;
    //   }
    //   
    //   if (isAuthenticated && isLoginRoute) {
    //     return RouteConstants.home;
    //   }
    //   
    //   return null;
    // },
  );
}
