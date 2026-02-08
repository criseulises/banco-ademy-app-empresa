/// Input validators for forms and user input
class Validators {
  Validators._();

  /// Validate email address
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo electrónico es requerido';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido';
    }

    return null;
  }

  /// Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'La contraseña debe contener al menos una mayúscula';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'La contraseña debe contener al menos una minúscula';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'La contraseña debe contener al menos un número';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'La contraseña debe contener al menos un carácter especial';
    }

    return null;
  }

  /// Validate required field
  static String? validateRequired(String? value, [String fieldName = 'Campo']) {
    if (value == null || value.isEmpty) {
      return '$fieldName es requerido';
    }
    return null;
  }

  /// Validate phone number
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'El teléfono es requerido';
    }

    final phoneRegex = RegExp(r'^\+?1?\d{10,15}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'Ingresa un número de teléfono válido';
    }

    return null;
  }

  /// Validate minimum length
  static String? validateMinLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }

    if (value.length < minLength) {
      return 'Debe tener al menos $minLength caracteres';
    }

    return null;
  }

  /// Validate maximum length
  static String? validateMaxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'No puede exceder $maxLength caracteres';
    }
    return null;
  }

  /// Validate numeric input
  static String? validateNumeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Solo se permiten números';
    }

    return null;
  }

  /// Validate amount
  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'El monto es requerido';
    }

    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Ingresa un monto válido';
    }

    if (amount <= 0) {
      return 'El monto debe ser mayor a cero';
    }

    return null;
  }

  /// Validate account number
  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'El número de cuenta es requerido';
    }

    // Adjust this based on your bank's account number format
    if (value.length < 10 || value.length > 20) {
      return 'Número de cuenta inválido';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'El número de cuenta solo debe contener dígitos';
    }

    return null;
  }

  /// Validate card number (basic Luhn algorithm)
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'El número de tarjeta es requerido';
    }

    final cardNumber = value.replaceAll(RegExp(r'\s'), '');

    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return 'Número de tarjeta inválido';
    }

    if (!_luhnCheck(cardNumber)) {
      return 'Número de tarjeta inválido';
    }

    return null;
  }

  /// Validate CVV
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'El CVV es requerido';
    }

    if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) {
      return 'CVV inválido';
    }

    return null;
  }

  /// Validate expiry date (MM/YY format)
  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La fecha de vencimiento es requerida';
    }

    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
      return 'Formato inválido. Use MM/YY';
    }

    final parts = value.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}');

    final now = DateTime.now();
    final expiryDate = DateTime(year, month);

    if (expiryDate.isBefore(DateTime(now.year, now.month))) {
      return 'La tarjeta ha expirado';
    }

    return null;
  }

  /// Validate OTP code
  static String? validateOTP(String? value, [int length = 6]) {
    if (value == null || value.isEmpty) {
      return 'El código OTP es requerido';
    }

    if (value.length != length) {
      return 'El código debe tener $length dígitos';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'El código solo debe contener números';
    }

    return null;
  }

  /// Validate username
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre de usuario es requerido';
    }

    if (value.length < 4) {
      return 'El nombre de usuario debe tener al menos 4 caracteres';
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Solo se permiten letras, números y guiones bajos';
    }

    return null;
  }

  /// Luhn algorithm for card validation
  static bool _luhnCheck(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }
}
