import 'package:easyfood_app/core/exception/datasource_exception.dart';
import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/core/exception/validation_exception.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/transferencia_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_transferencia_repository.dart';

class TransferenciaRepositoryImpl implements ITransferenciaRepository {
  TransferenciaRepositoryImpl(this._dataSource);

  final TransferenciaDataSource _dataSource;

  @override
  Future<void> transferirMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idFuncionario,
  }) async {
    try {
      await _dataSource.transferirMesa(
        idMesaOrigem: idMesaOrigem,
        idMesaDestino: idMesaDestino,
        idFuncionario: idFuncionario,
      );
    } on DataSourceException catch (e) {
      if (e.statusCode == 409) {
        // conflito
        throw ValidationException(e.message ?? 'Conflito');
      } else if (e.statusCode == 403) {
        // proibido
        throw ValidationException(e.message ?? 'Proibido');
      } else if (e.statusCode == 400) {
        // bad request
        throw ValidationException(e.message ?? 'Requisição inválida');
      } else {
        throw RepositoryException(e.message ?? 'Erro interno no servidor');
      }
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<void> transferirComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idFuncionario,
  }) async {
    try {
      await _dataSource.transferirComanda(
        idComandaOrigem: idComandaOrigem,
        idComandaDestino: idComandaDestino,
        idFuncionario: idFuncionario,
      );
    } on DataSourceException catch (e) {
      if (e.statusCode == 409) {
        // conflito
        throw ValidationException(e.message ?? 'Conflito');
      } else if (e.statusCode == 403) {
        // proibido
        throw ValidationException(e.message ?? 'Proibido');
      } else if (e.statusCode == 400) {
        // bad request
        throw ValidationException(e.message ?? 'Requisição inválida');
      } else {
        throw RepositoryException(e.message ?? 'Erro interno no servidor');
      }
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<void> transferirItemComanda({
    required int idComandaOrigem,
    required int idComandaDestino,
    required int idItem,
    required int idFuncionario,
  }) async {
    try {
      await _dataSource.transferirItemComanda(
        idComandaOrigem: idComandaOrigem,
        idComandaDestino: idComandaDestino,
        idItem: idItem,
        idFuncionario: idFuncionario,
      );
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<void> transferirItemMesa({
    required int idMesaOrigem,
    required int idMesaDestino,
    required int idItem,
    required int idFuncionario,
  }) async {
    try {
      await _dataSource.transferirItemMesa(
        idMesaOrigem: idMesaOrigem,
        idMesaDestino: idMesaDestino,
        idItem: idItem,
        idFuncionario: idFuncionario,
      );
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
