import 'package:easyfood_app/features/common/data/datasources/categoria_impressao_datasource.dart';
import 'package:easyfood_app/features/common/data/datasources/dio_datasource.dart';
import 'package:easyfood_app/features/common/data/models/categoria_impressao_model_in.dart';

class CategoriaImpressaoDataSourceImpl extends DioDataSource implements CategoriaImpressaoDataSource {
  CategoriaImpressaoDataSourceImpl(super.dio);

  @override
  Future<List<CategoriaImpressaoModelIn>> getCategoriasImpressao() {
    return get('/categoriaimpressao')
        .then((value) => (value as List).map((e) => CategoriaImpressaoModelIn.fromJson(e)).toList());
  }
}
