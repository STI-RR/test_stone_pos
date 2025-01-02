import 'package:easyfood_app/features/common/domain/entities/categoria_impressao_entity.dart';

abstract interface class ICategoriaImpressaoRepository {
  Future<List<CategoriaImpressaoEntity>> getCategoriasImpressao();
}
