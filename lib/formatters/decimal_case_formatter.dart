
import 'package:flutter/services.dart';

/// This will allow only numbers and decimals
///
/// For Ex : 99.32
class DecimalNumberInputFormatter extends TextInputFormatter {
  /// pass the decimal range that you want to allow
  ///
  /// By Default it is 2.
  final int decimalRange;


  /// This is the constructor of the decimal number input formatter
  DecimalNumberInputFormatter({this.decimalRange = 2})
      : assert(decimalRange >= 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    if (text.isEmpty) return newValue;

    final newText = RegExp(r'^\d*\.?\d{0,' + decimalRange.toString() + r'}$');

    if (newText.hasMatch(text)) {
      return newValue;
    }

    return oldValue;
  }
}

