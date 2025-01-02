import 'package:easyfood_app/features/common/data/models/categoria_impressao_model_in.dart';

abstract interface class CategoriaImpressaoDataSource {
  Future<List<CategoriaImpressaoModelIn>> getCategoriasImpressao();
}
