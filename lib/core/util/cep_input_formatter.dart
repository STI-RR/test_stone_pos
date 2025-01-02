import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String valor = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (valor.length > 2) {
      valor = '${valor.substring(0, 2)}.${valor.substring(2)}';
    }
    if (valor.length > 6) {
      valor = '${valor.substring(0, 6)}-${valor.substring(6)}';
    }
    if (valor.length > 10) {
      valor = valor.substring(0, 10);
    }

    return TextEditingValue(
      text: valor,
      selection: TextSelection.collapsed(offset: valor.length),
    );
  }
}
