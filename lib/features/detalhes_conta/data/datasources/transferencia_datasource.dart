abstract interface class TransferenciaDataSource {
  Future<void> transferirMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idFuncionario,
  });
  Future<void> transferirComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idFuncionario,
  });

  Future<void> transferirItemComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idItem,
    required int idFuncionario,
  });

  Future<void> transferirItemMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idItem,
    required int idFuncionario,
  });
}
