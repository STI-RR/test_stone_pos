abstract interface class IJuncaoRepository {
  Future<void> juntarMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idFuncionario,
  });

  Future<void> juntarComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idFuncionario,
  });
}
