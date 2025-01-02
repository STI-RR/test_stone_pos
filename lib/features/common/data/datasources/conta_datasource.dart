import 'package:easyfood_app/features/common/data/models/solicitacao_fechamento_conta_model_out.dart';

abstract interface class ContaDataSource {
  Future<void> fecharConta(SolicitacaoFechamentoContaModelOut solicitacao);

  Future<void> solicitarImpressaoPreviaConta(
    int contaId, {
    required int funcionarioId,
    required int quantidadePessoas,
  });
}
