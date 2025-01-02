class StringUtil {
  static String formataTelefoneComDDDeNonoDigito(String telefone) {
    final onlyDigits = telefone.replaceAll(RegExp('\\D'), '');

    if (onlyDigits.isEmpty) {
      return '';
    }

    if (onlyDigits.length > 7) {
      final ddd = onlyDigits.substring(0, 2);
      final nonoDigito = onlyDigits.substring(2, 3);
      final prefixo = onlyDigits.substring(3, 7);
      final sufixo = onlyDigits.substring(7);

      return '($ddd) $nonoDigito $prefixo-$sufixo';
    }

    if (onlyDigits.length > 3) {
      final ddd = onlyDigits.substring(0, 2);
      final nonoDigito = onlyDigits.substring(2, 3);
      final prefixo = onlyDigits.substring(3);

      return '($ddd) $nonoDigito $prefixo';
    }

    if (onlyDigits.length > 2) {
      final ddd = onlyDigits.substring(0, 2);
      final nonoDigito = onlyDigits.substring(2);

      return '($ddd) $nonoDigito ';
    }

    if (onlyDigits.length > 1) {
      return '($onlyDigits) ';
    }

    return '($onlyDigits';
  }
}
