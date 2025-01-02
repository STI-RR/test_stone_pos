enum StatusTipoPagamentoTransacaoEntity {
  easyFoodCash('easyfood_dinheiro', 'Dinheiro', 0),
  stoneDebit('stone_debito', 'Débito', 20),
  stoneCredit('stone_credito', 'Crédito', 21),
  stonePix('stone_pix', 'PIX', 22),
  pagSeguroDebit('pagseguro_debito', 'Débito', 23),
  pagSeguroCredit('pagseguro_credito', 'Crédito', 24),
  pagSeguroPix('pagseguro_pix', 'PIX', 25),
  cieloDebit('cielo_debito', 'Débito', 26),
  cieloCredit('cielo_credito', 'Crédito', 27),
  cieloPix('cielo_pix', 'PIX', 28);

  final String value;
  final String description;
  final int ordinal;

  const StatusTipoPagamentoTransacaoEntity(this.value, this.description, this.ordinal);

  static StatusTipoPagamentoTransacaoEntity fromOrdinal(int ordinal) {
    switch (ordinal) {
      case 0:
        return StatusTipoPagamentoTransacaoEntity.easyFoodCash;
      case 20:
        return StatusTipoPagamentoTransacaoEntity.stoneDebit;
      case 21:
        return StatusTipoPagamentoTransacaoEntity.stoneCredit;
      case 22:
        return StatusTipoPagamentoTransacaoEntity.stonePix;
      case 23:
        return StatusTipoPagamentoTransacaoEntity.pagSeguroDebit;
      case 24:
        return StatusTipoPagamentoTransacaoEntity.pagSeguroCredit;
      case 25:
        return StatusTipoPagamentoTransacaoEntity.pagSeguroPix;
      case 26:
        return StatusTipoPagamentoTransacaoEntity.cieloDebit;
      case 27:
        return StatusTipoPagamentoTransacaoEntity.cieloCredit;
      case 28:
        return StatusTipoPagamentoTransacaoEntity.cieloPix;
      default:
        throw Exception('Invalid ordinal');
    }
  }

  static StatusTipoPagamentoTransacaoEntity fromString(String value) {
    switch (value) {
      case 'easyfood_dinheiro':
        return StatusTipoPagamentoTransacaoEntity.easyFoodCash;
      case 'stone_debito':
        return StatusTipoPagamentoTransacaoEntity.stoneDebit;
      case 'stone_credito':
        return StatusTipoPagamentoTransacaoEntity.stoneCredit;
      case 'stone_pix':
        return StatusTipoPagamentoTransacaoEntity.stonePix;
      case 'pagseguro_debito':
        return StatusTipoPagamentoTransacaoEntity.pagSeguroDebit;
      case 'pagseguro_credito':
        return StatusTipoPagamentoTransacaoEntity.pagSeguroCredit;
      case 'pagseguro_pix':
        return StatusTipoPagamentoTransacaoEntity.pagSeguroPix;
      case 'cielo_debito':
        return StatusTipoPagamentoTransacaoEntity.cieloDebit;
      case 'cielo_credito':
        return StatusTipoPagamentoTransacaoEntity.cieloCredit;
      case 'cielo_pix':
        return StatusTipoPagamentoTransacaoEntity.cieloPix;
      default:
        throw Exception('Invalid value');
    }
  }
}
