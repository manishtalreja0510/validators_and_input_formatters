import 'package:flutter/services.dart';

/// This will format the text into a credit card number
///
/// For Ex : 1234567890123456 will be treated as 1234 5678 9012 3456
class CreditCardNumberInputFormatter extends TextInputFormatter {
  /// This is the max length of text characters you want to add
  ///
  /// By default it is 19 (16+3 spaces)
  static const int maxLength = 19; // 16 digits + 3 spaces

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digit characters
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Group digits into 4s
    String newText = '';
    for (int i = 0; i < digits.length; i++) {
      if (i != 0 && i % 4 == 0) {
        newText += ' ';
      }
      newText += digits[i];
    }

    // Limit max length
    if (newText.length > maxLength) {
      newText = newText.substring(0, maxLength);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
