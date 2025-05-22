import 'package:flutter/services.dart';

/// This will only allow add lower case text, it will automatically format the text in lower case
///
/// For Example: Manish will become manish
class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}
