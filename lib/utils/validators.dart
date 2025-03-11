class Validators {
  /// ✅ Validate Email Format
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) return "Email can't be empty";

    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!regex.hasMatch(email)) return "Enter a valid email address";

    return null;
  }

  /// ✅ Validate Strong Password (Min 8 chars, 1 digit, 1 special char)
  static String? validatePassword(String? password) {
    if (password == null || password.length < 8) return "Password must be at least 8 characters long";

    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!regex.hasMatch(password)) return "Include a number & special character";

    return null;
  }

  /// ✅ Generic Field Validator (Required Fields)
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) return "$fieldName can't be empty";
    return null;
  }

  /// ✅ Validate Credit Card Number using Luhn Algorithm
  static String? validateCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.length < 16) return "Enter a valid card number";

    if (!_luhnCheck(cardNumber)) return "Invalid card number";
    return null;
  }

  /// ✅ Validate CVV (Must be 3-4 digits)
  static String? validateCVV(String? cvv) {
    if (cvv == null || !RegExp(r'^\d{3,4}$').hasMatch(cvv)) return "CVV must be 3 or 4 digits";
    return null;
  }

  /// ✅ Validate Appointment Date Selection (Ensure it's in the future)
  static String? validateAppointmentDate(DateTime? selectedDate) {
    if (selectedDate == null) return "Please select a date";
    if (!selectedDate.isAfter(DateTime.now())) return "Select a future date";
    return null;
  }

  /// ✅ Luhn Algorithm for Credit Card Validation
  static bool _luhnCheck(String cardNumber) {
    List<int> digits = cardNumber.replaceAll(RegExp(r'\D'), '').split('').map(int.parse).toList();
    if (digits.length < 13 || digits.length > 19) return false;

    int sum = 0;
    bool doubleDigit = false;

    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits[i];
      if (doubleDigit) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      doubleDigit = !doubleDigit;
    }

    return sum % 10 == 0;
  }
}
