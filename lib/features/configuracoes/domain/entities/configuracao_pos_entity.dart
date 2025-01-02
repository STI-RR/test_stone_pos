class ConfiguracaoPosEntity {
  final bool permitirPagamentoEmDinheiroParaTodos;
  final bool permitirPagamentoParcialPos;
  final bool permitirRemoverTaxaDeServico;
  final bool permitirRemoverCouvert;
  final bool habilitarPosDinheiro;
  final bool habilitarPosDebito;
  final bool habilitarPosCredito;
  final bool habilitarPosPix;
  final bool habilitarPedidoFichaPos;
  final bool especificarBandeiraPos;
  final ImpressaoPedidoFichaPos impressaoPosPedidoFicha;
  final bool impressaoPosContaFicha;
  final String descricaoComanda;
  final bool imprimirViaEstabelecimento;

  ConfiguracaoPosEntity({
    required this.permitirPagamentoEmDinheiroParaTodos,
    required this.permitirPagamentoParcialPos,
    required this.permitirRemoverTaxaDeServico,
    required this.permitirRemoverCouvert,
    required this.habilitarPosDinheiro,
    required this.habilitarPosDebito,
    required this.habilitarPosCredito,
    required this.habilitarPosPix,
    required this.habilitarPedidoFichaPos,
    required this.especificarBandeiraPos,
    required this.impressaoPosPedidoFicha,
    required this.impressaoPosContaFicha,
    required this.descricaoComanda,
    required this.imprimirViaEstabelecimento,
  });
}

enum ImpressaoPedidoFichaPos { imprimir, conformeItem, naoImprimir }
