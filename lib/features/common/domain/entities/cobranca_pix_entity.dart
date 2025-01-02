class CobrancaPixEntity {
  final String qrCode;
  final double valor;
  final int criacao;
  final int expiracaoEmSegundos;
  final bool ativa;
  final bool concluida;

  CobrancaPixEntity({
    required this.qrCode,
    required this.valor,
    required this.criacao,
    required this.expiracaoEmSegundos,
    required this.ativa,
    required this.concluida,
  });
}
