abstract interface class IContaRepository {
  Future<void> fecharConta(
    int contaId, {
    required int funcionarioId,
    required int quantidadePessoas,
    int? mesaFisica,
    int? categoriaImpressaoConta,
  });

  Future<void> solicitarImpressaoPreviaConta(
    int contaId, {
    required int funcionarioId,
    required int quantidadePessoas,
  });
}
