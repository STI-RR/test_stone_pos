import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String valor = newValue.text.replaceAll(RegExp(r'\D'), '');

    // remove left zeros
    valor = valor.replaceFirst(RegExp(r'^0+'), '');

    if (valor.isEmpty) {
      valor = 'R\$ 0,00';
    } else if (valor.length == 1) {
      valor = 'R\$ 0,0$valor';
    } else if (valor.length == 2) {
      valor = 'R\$ 0,$valor';
    } else {
      final integer = valor.substring(0, valor.length - 2);
      final cents = valor.substring(valor.length - 2);
      valor = 'R\$ $integer,$cents';
    }

    return TextEditingValue(
      text: valor,
      selection: TextSelection.collapsed(offset: valor.length),
    );
  }
}
