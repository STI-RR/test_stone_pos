import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/controlar_mesas/data/datasources/mesa_datasource.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/repositories/i_mesa_repository.dart';

class MesaRepositoryImpl implements IMesaRepository {
  MesaRepositoryImpl(this._dataSource);

  final MesaDataSource _dataSource;

  @override
  Future<MesaEntity> getMesa(int id) async {
    try {
      final modelIn = await _dataSource.getMesa(id);
      return modelIn.toEntity();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  @override
  Future<List<MesaEntity>> getMesas() async {
    try {
      final modelIn = await _dataSource.getMesas();
      return modelIn.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
