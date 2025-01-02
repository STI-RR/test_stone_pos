import 'dart:convert';

import 'package:easyfood_app/features/common/data/models/categoria_impressao_model_in.dart';
import 'package:easyfood_app/features/common/domain/entities/categoria_impressao_entity.dart';

class CategoriaImpressaoConverter extends Converter<CategoriaImpressaoModelIn, CategoriaImpressaoEntity> {
  @override
  CategoriaImpressaoEntity convert(CategoriaImpressaoModelIn input) {
    return CategoriaImpressaoEntity(
      codigo: input.codigo,
      descricao: input.descricao,
    );
  }
}
