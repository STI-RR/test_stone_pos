import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/data/datasources/conta_mesa_datasource.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_conta_mesa_repository.dart';

class ContaMesaRepositoryImpl implements IContaMesaRepository {
  ContaMesaRepositoryImpl(this._dataSource);

  final ContaMesaDataSource _dataSource;

  @override
  Future<ContaMesaEntity?> findByMesaCodigo(int mesaCodigo) async {
    try {
      final modelIn = await _dataSource.findByMesaCodigo(mesaCodigo);
      return modelIn?.toEntity();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
