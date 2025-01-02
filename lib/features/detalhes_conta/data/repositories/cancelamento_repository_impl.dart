import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/cancelamento_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_cancelamento_repository.dart';

class CancelamentoRepositoryImpl implements ICancelamentoRepository {
  CancelamentoRepositoryImpl(this._dataSource);

  final CancelamentoDataSource _dataSource;
  @override
  Future<void> cancelarItem({
    required int idItem,
    required int idFuncionario,
    required String idObservacao,
  }) async {
    try {
      await _dataSource.cancelarItem(
        idItem: idItem,
        idFuncionario: idFuncionario,
        observacao: idObservacao,
      );
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
