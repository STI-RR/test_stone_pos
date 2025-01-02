import 'package:flutter/services.dart';

class TelefoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String valor = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (valor.isNotEmpty) {
      valor = '($valor';
    }
    if (valor.length > 3) {
      valor = '${valor.substring(0, 3)}) ${valor.substring(3)}';
    }
    if (valor.length > 6) {
      valor = '${valor.substring(0, 6)} ${valor.substring(6)}';
    }
    if (valor.length > 11) {
      valor = '${valor.substring(0, 11)}-${valor.substring(11)}';
    }
    if (valor.length > 16) {
      valor = valor.substring(0, 16);
    }

    return TextEditingValue(
      text: valor,
      selection: TextSelection.collapsed(offset: valor.length),
    );
  }
}
