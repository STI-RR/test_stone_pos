class PermissoesEntity {
  PermissoesEntity({
    required this.cancelarItens,
    required this.trocarItens,
    required this.trocarContas,
    required this.juntarContas,
    required this.fecharConta,
    required this.pagarPOSContaEmDinheiro,
    required this.pagarPOSContaEmDinheiroSemConfirmarSenha,
    required this.visualizarConta,
    required this.chamados,
    required this.pedido,
    required this.revisarSolicitacaoDeConta,
    required this.pedidosPendentes,
    this.realizarPedidoMesa,
    this.realizarPedidoCartao,
  });

  String cancelarItens;
  String juntarContas;
  String pagarPOSContaEmDinheiro;
  String trocarContas;
  String visualizarConta;
  String chamados;
  String pedido;
  String revisarSolicitacaoDeConta;
  String fecharConta;
  String trocarItens;
  String pedidosPendentes;
  String pagarPOSContaEmDinheiroSemConfirmarSenha;
  String? realizarPedidoMesa;
  String? realizarPedidoCartao;
}
