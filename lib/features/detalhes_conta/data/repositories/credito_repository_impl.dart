import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/detalhes_conta/data/datasources/credito_conta_datasource.dart';
import 'package:easyfood_app/features/detalhes_conta/model/entities/credito_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/model/repositories/i_credito_repository.dart';

class CreditoRepositoryImpl implements ICreditoRepository {
  final CreditoContaDataSource _dataSource;

  CreditoRepositoryImpl(this._dataSource);

  @override
  Future<List<CreditoEntity>> getCreditosConta(int idConta) async {
    try {
      final creditos = await _dataSource.getCreditosConta(idConta);
      return creditos.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
