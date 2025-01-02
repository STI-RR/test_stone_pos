import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/data/datasources/conta_datasource.dart';
import 'package:easyfood_app/features/common/data/models/solicitacao_fechamento_conta_model_out.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_conta_repository.dart';

class ContaRepositoryImpl implements IContaRepository {
  ContaRepositoryImpl(this._dataSource);

  final ContaDataSource _dataSource;

  @override
  Future<void> fecharConta(
    int contaId, {
    required int quantidadePessoas,
    required int funcionarioId,
    int? mesaFisica,
    int? categoriaImpressaoConta,
  }) async {
    try {
      final solicitacao = SolicitacaoFechamentoContaModelOut(
        conta: contaId,
        funcionario: funcionarioId,
        numerodepessoas: quantidadePessoas,
        observacao: mesaFisica != null ? 'Mesa física: $mesaFisica' : '',
        categoriaimpressao: categoriaImpressaoConta,
      );
      await _dataSource.fecharConta(solicitacao);
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<void> solicitarImpressaoPreviaConta(
    int contaId, {
    required int funcionarioId,
    required int quantidadePessoas,
  }) async {
    try {
      await _dataSource.solicitarImpressaoPreviaConta(
        contaId,
        funcionarioId: funcionarioId,
        quantidadePessoas: quantidadePessoas,
      );
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
