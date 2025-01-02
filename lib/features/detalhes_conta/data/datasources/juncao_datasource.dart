abstract interface class JuncaoDataSource {
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
