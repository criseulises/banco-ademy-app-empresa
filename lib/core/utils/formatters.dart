import 'package:intl/intl.dart';

/// Currency and number formatting utilities
class Formatters {
  Formatters._();

  /// Format amount as currency (Dominican Pesos)
  static String formatCurrency(
    double amount, {
    String currencySymbol = 'RD\$',
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.currency(
      symbol: currencySymbol,
      decimalDigits: decimalDigits,
    );
    return formatter.format(amount);
  }

  /// Format amount as USD
  static String formatUSD(double amount) {
    return formatCurrency(amount, currencySymbol: 'US\$');
  }

  /// Format number with thousands separator
  static String formatNumber(
    num number, {
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat('#,##0.${'0' * decimalDigits}');
    return formatter.format(number);
  }

  /// Format account number with masking
  /// Example: 1234567890 → ****7890
  static String formatAccountNumber(
    String accountNumber, {
    int visibleDigits = 4,
  }) {
    if (accountNumber.length <= visibleDigits) {
      return accountNumber;
    }

    final masked = '*' * (accountNumber.length - visibleDigits);
    final visible = accountNumber.substring(accountNumber.length - visibleDigits);
    return masked + visible;
  }

  /// Format card number with spacing
  /// Example: 1234567890123456 → 1234 5678 9012 3456
  static String formatCardNumber(String cardNumber) {
    final cleaned = cardNumber.replaceAll(RegExp(r'\s'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < cleaned.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(cleaned[i]);
    }

    return buffer.toString();
  }

  /// Format card number with masking
  /// Example: 1234567890123456 → **** **** **** 3456
  static String formatMaskedCardNumber(String cardNumber) {
    final cleaned = cardNumber.replaceAll(RegExp(r'\s'), '');
    if (cleaned.length < 4) return cardNumber;

    final lastFour = cleaned.substring(cleaned.length - 4);
    return '**** **** **** $lastFour';
  }

  /// Format phone number
  /// Example: 8095551234 → (809) 555-1234
  static String formatPhoneNumber(String phoneNumber) {
    final cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    } else if (cleaned.length == 11 && cleaned.startsWith('1')) {
      return '+1 (${cleaned.substring(1, 4)}) ${cleaned.substring(4, 7)}-${cleaned.substring(7)}';
    }

    return phoneNumber;
  }

  /// Format date
  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Format date and time
  static String formatDateTime(
    DateTime dateTime, {
    String format = 'dd/MM/yyyy HH:mm',
  }) {
    return DateFormat(format).format(dateTime);
  }

  /// Format time
  static String formatTime(DateTime time, {String format = 'HH:mm'}) {
    return DateFormat(format).format(time);
  }

  /// Format date to relative time (e.g., "hace 2 horas")
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return 'hace $years ${years == 1 ? 'año' : 'años'}';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return 'hace $months ${months == 1 ? 'mes' : 'meses'}';
    } else if (difference.inDays > 0) {
      return 'hace ${difference.inDays} ${difference.inDays == 1 ? 'día' : 'días'}';
    } else if (difference.inHours > 0) {
      return 'hace ${difference.inHours} ${difference.inHours == 1 ? 'hora' : 'horas'}';
    } else if (difference.inMinutes > 0) {
      return 'hace ${difference.inMinutes} ${difference.inMinutes == 1 ? 'minuto' : 'minutos'}';
    } else {
      return 'hace un momento';
    }
  }

  /// Format file size
  static String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }

  /// Format percentage
  static String formatPercentage(
    double value, {
    int decimalDigits = 2,
  }) {
    return '${value.toStringAsFixed(decimalDigits)}%';
  }

  /// Capitalize first letter of each word
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;

    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Format ID/document number
  /// Example: 00112345678 → 001-1234567-8
  static String formatDominicanID(String id) {
    final cleaned = id.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length != 11) return id;

    return '${cleaned.substring(0, 3)}-${cleaned.substring(3, 10)}-${cleaned.substring(10)}';
  }

  /// Format RNC (Registro Nacional de Contribuyentes)
  /// Example: 123456789 → 1-23-45678-9
  static String formatRNC(String rnc) {
    final cleaned = rnc.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length != 9) return rnc;

    return '${cleaned.substring(0, 1)}-${cleaned.substring(1, 3)}-${cleaned.substring(3, 8)}-${cleaned.substring(8)}';
  }
}
