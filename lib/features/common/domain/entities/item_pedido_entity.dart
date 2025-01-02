class ItemPedidoEntity {
  int codigo;
  String descricao;
  String observacao;
  double preco;
  int quantidade;
  double? peso;
  String funcionarioLancamento;
  DateTime dataHoraLancamento;
  bool imprimirFichaPos;

  ItemPedidoEntity({
    required this.codigo,
    required this.descricao,
    required this.observacao,
    required this.preco,
    required this.quantidade,
    this.peso,
    required this.funcionarioLancamento,
    required this.dataHoraLancamento,
    required this.imprimirFichaPos,
  });
}
