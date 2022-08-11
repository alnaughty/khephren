import 'package:flutter/services.dart';

class CommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(",")) {
      return TextEditingValue(
        text: newValue.text.replaceFirst(",", ".").replaceAll(",", ""),
        selection: TextSelection.collapsed(
          offset: newValue.selection.end + 1,
        ),
      );
    }
    return newValue;
  }
}
