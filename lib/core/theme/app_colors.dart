import 'package:flutter/material.dart';

/// Color palette for Banco Ademi application
/// 
/// Colores oficiales de Banco ADEMI
class AppColors {
  AppColors._();

  // ============================================================================
  // PRIMARY COLORS - Banco ADEMI
  // ============================================================================

  /// Primary brand color - Turquesa ADEMI
  static const Color primary = Color(0xFF0095A9);
  static const Color primaryLight = Color(0xFF00B8D4);
  static const Color primaryDark = Color(0xFF007A8A);
  static const Color primaryVariant = Color(0xFF008296);

  // ============================================================================
  // SECONDARY COLORS - Banco ADEMI
  // ============================================================================

  /// Secondary/accent color - Naranja ADEMI
  static const Color secondary = Color(0xFFFA6C26);
  static const Color secondaryLight = Color(0xFFFC8548);
  static const Color secondaryDark = Color(0xFFE85A15);

  // ============================================================================
  // NEUTRAL COLORS
  // ============================================================================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F6FB); // Background ADEMI
  static const Color grey200 = Color(0xFFEEEFF5);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF0C0A18); // Text ADEMI

  // ============================================================================
  // BACKGROUND COLORS - Banco ADEMI
  // ============================================================================

  static const Color background = Color(0xFFF5F6FB);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBackgroundDark = Color(0xFF2C2C2C);

  // ============================================================================
  // TEXT COLORS - Banco ADEMI
  // ============================================================================

  static const Color textPrimary = Color(0xFF0C0A18); // Banco ADEMI primary text
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textDisabled = Color(0xFFE0E0E0);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textLink = Color(0xFF0066CC);

  // ============================================================================
  // STATE COLORS
  // ============================================================================

  /// Success state color
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  /// Error state color
  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);

  /// Warning state color
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);

  /// Info state color
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // ============================================================================
  // BANKING SPECIFIC COLORS
  // ============================================================================

  /// Account types
  static const Color savingsAccount = Color(0xFF4CAF50);
  static const Color checkingAccount = Color(0xFF2196F3);
  static const Color creditAccount = Color(0xFFFF9800);
  static const Color loanAccount = Color(0xFF9C27B0);
  static const Color investmentAccount = Color(0xFF00BCD4);

  /// Transaction types
  static const Color income = Color(0xFF4CAF50);
  static const Color expense = Color(0xFFF44336);
  static const Color transfer = Color(0xFF2196F3);

  /// Card brands
  static const Color visaBlue = Color(0xFF1A1F71);
  static const Color mastercardOrange = Color(0xFFEB001B);
  static const Color amexBlue = Color(0xFF006FCF);

  // ============================================================================
  // BORDER COLORS
  // ============================================================================

  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);
  static const Color borderFocused = Color(0xFF0066CC);
  static const Color borderError = Color(0xFFF44336);

  // ============================================================================
  // SHADOW COLORS
  // ============================================================================

  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // ============================================================================
  // OVERLAY COLORS
  // ============================================================================

  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);
  static const Color overlayDark = Color(0xB3000000);

  // ============================================================================
  // GRADIENT COLORS
  // ============================================================================

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [success, successDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============================================================================
  // CHART COLORS
  // ============================================================================

  static const List<Color> chartColors = [
    Color(0xFF0066CC),
    Color(0xFFFF6B35),
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFF00BCD4),
    Color(0xFFE91E63),
    Color(0xFF8BC34A),
  ];
}
