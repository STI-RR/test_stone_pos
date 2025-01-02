import 'dart:convert';

import 'package:easyfood_app/features/configuracoes/data/models/pix_dados_model_in.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/pix_dados_entity.dart';

class PixDadosConverter extends Converter<PixDadosModelIn, PixDadosEntity> {
  @override
  PixDadosEntity convert(PixDadosModelIn input) {
    return PixDadosEntity(
      id: input.codigo,
      descricao: input.descricao,
      chave: input.chave,
      nomeEstabelecimento: input.nomeEstabelecimento,
      psp: input.psp,
      producao: input.producao,
      clientId: input.clientId,
      clientSecret: input.clientSecret,
      outrosDados: input.outrosDados,
      exclusao: input.exclusao,
      cidade: input.cidade,
      expiracaoCobrancaEmSegundos: input.expiracaoCobrancaEmSegundos,
    );
  }
}
