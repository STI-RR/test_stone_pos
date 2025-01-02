abstract interface class CancelamentoDataSource {
  Future<void> cancelarItem({
    required int idItem,
    required int idFuncionario,
    required String observacao,
  });
}
