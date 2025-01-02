import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/data/datasources/mesa_fisica_datasource.dart';
import 'package:easyfood_app/features/common/domain/entities/mesa_fisica_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_mesa_fisica_repository.dart';

class MesaFisicaRepositoryImpl implements IMesaFisicaRepository {
  MesaFisicaRepositoryImpl({required this.dataSource});

  final MesaFisicaDataSource dataSource;
  @override
  Future<List<MesaFisicaEntity>> getMesasFisicas() async {
    try {
      final result = await dataSource.getMesasFisicas();
      return result.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
