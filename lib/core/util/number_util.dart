class NumberUtil {
  /// Formats a double value to a currency string
  /// Example: 123.45 -> R$ 123,45
  static String formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  static double parseCurrency(String text) {
    return double.parse(text.replaceAll(RegExp(r'[^\d]'), '')) / 100;
  }
}
