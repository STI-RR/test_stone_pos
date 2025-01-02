import 'package:easyfood_app/core/exception/repository_exception.dart';
import 'package:easyfood_app/features/common/data/converters/categoria_impressao_converter.dart';
import 'package:easyfood_app/features/common/data/datasources/categoria_impressao_datasource.dart';
import 'package:easyfood_app/features/common/domain/entities/categoria_impressao_entity.dart';
import 'package:easyfood_app/features/common/domain/repositories/i_categoria_impressao_repository.dart';

class CategoriaImpressaoRepositoryImpl implements ICategoriaImpressaoRepository {
  final CategoriaImpressaoDataSource _dataSource;

  CategoriaImpressaoRepositoryImpl(this._dataSource);

  @override
  Future<List<CategoriaImpressaoEntity>> getCategoriasImpressao() async {
    try {
      final categoriasImpressao = await _dataSource.getCategoriasImpressao();
      final converter = CategoriaImpressaoConverter();

      return categoriasImpressao.map((e) => converter.convert(e)).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
