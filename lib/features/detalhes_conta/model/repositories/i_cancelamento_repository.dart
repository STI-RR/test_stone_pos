abstract interface class ICancelamentoRepository {
  Future<void> cancelarItem({
    required int idItem,
    required int idFuncionario,
    required String idObservacao,
  });
}
