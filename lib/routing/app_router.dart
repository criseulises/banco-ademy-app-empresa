import 'package:go_router/go_router.dart';

import '../core/constants/route_constants.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/reset_password_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/verify_code_page.dart';

/// Application router configuration using go_router
/// 
/// Defines all routes and navigation structure for the app
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteConstants.splash,
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
        builder: (context, state) {
          // TODO: Return HomePage()
          throw UnimplementedError('Home page not implemented');
        },
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

      // ======================================================================
      // TRANSFERS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.transfers,
        name: 'transfers',
        builder: (context, state) {
          // TODO: Return TransfersPage()
          throw UnimplementedError('Transfers page not implemented');
        },
      ),

      // ======================================================================
      // PAYMENTS ROUTES
      // ======================================================================

      GoRoute(
        path: RouteConstants.payments,
        name: 'payments',
        builder: (context, state) {
          // TODO: Return PaymentsPage()
          throw UnimplementedError('Payments page not implemented');
        },
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
        builder: (context, state) {
          // TODO: Return NotificationsPage()
          throw UnimplementedError('Notifications page not implemented');
        },
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
        builder: (context, state) {
          // TODO: Return SettingsPage()
          throw UnimplementedError('Settings page not implemented');
        },
      ),
    ],

    // Error handling
    errorBuilder: (context, state) {
      // TODO: Return ErrorPage(error: state.error)
      throw UnimplementedError('Error page not implemented');
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
