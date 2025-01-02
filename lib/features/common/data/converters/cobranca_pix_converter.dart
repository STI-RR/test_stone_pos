import 'dart:convert';

import 'package:easyfood_app/features/common/data/models/cobranca_pix_model_in.dart';
import 'package:easyfood_app/features/common/domain/entities/cobranca_pix_entity.dart';

class CobrancaPixConverter extends Converter<CobrancaPixModelIn, CobrancaPixEntity> {
  @override
  CobrancaPixEntity convert(CobrancaPixModelIn input) {
    return CobrancaPixEntity(
      ativa: input.ativa,
      concluida: input.concluida,
      criacao: input.criacao,
      expiracaoEmSegundos: input.expiracaoEmSegundos,
      qrCode: input.qrCode,
      valor: input.valor,
    );
  }
}
