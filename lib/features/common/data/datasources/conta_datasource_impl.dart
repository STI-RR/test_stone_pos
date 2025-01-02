import 'package:easyfood_app/features/common/data/datasources/conta_datasource.dart';
import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/common/data/models/solicitacao_fechamento_conta_model_out.dart';

class ContaDataSourceImpl extends DioDataSource implements ContaDataSource {
  ContaDataSourceImpl(super.dio);

  @override
  Future<void> fecharConta(SolicitacaoFechamentoContaModelOut solicitacao) {
    return post('/solicitacaofechamentoconta', data: solicitacao.toJson());
  }

  @override
  Future<void> solicitarImpressaoPreviaConta(
    int contaId, {
    required int funcionarioId,
    required int quantidadePessoas,
  }) {
    return get('/conta/$contaId/previa', queryParameters: {
      'funcionario': funcionarioId,
      'numPessoas': quantidadePessoas,
    });
  }
}
