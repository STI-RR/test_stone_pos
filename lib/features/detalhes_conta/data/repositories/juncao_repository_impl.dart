import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/juncao_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_juncao_repository.dart';

class JuncaoRepositoryImpl implements IJuncaoRepository {
  JuncaoRepositoryImpl(this._dataSource);

  final JuncaoDataSource _dataSource;

  @override
  Future<void> juntarMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idFuncionario,
  }) async {
    try {
      await _dataSource.juntarMesa(
        idMesaOrigem: idMesaOrigem,
        idMesaDestino: idMesaDestino,
        idFuncionario: idFuncionario,
      );
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<void> juntarComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idFuncionario,
  }) async {
    try {
      await _dataSource.juntarComanda(
        idComandaOrigem: idComandaOrigem,
        idComandaDestino: idComandaDestino,
        idFuncionario: idFuncionario,
      );
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
