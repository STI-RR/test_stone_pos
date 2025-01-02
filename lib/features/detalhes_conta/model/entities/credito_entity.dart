class CreditoEntity {
  final int codigo;
  final double valor;
  final String descricao;
  final String tipoPagamento;
  final String descricaoTipoPagamento;

  CreditoEntity({
    required this.codigo,
    required this.valor,
    required this.descricao,
    required this.tipoPagamento,
    required this.descricaoTipoPagamento,
  });
}
