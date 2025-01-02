import 'dart:convert';

import 'package:easyfood_app/features/configuracoes/data/models/configuracao_model_in.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_pos_entity.dart';

class ConfiguracaoPosConverter extends Converter<ConfiguracaoModelIn, ConfiguracaoPosEntity> {
  @override
  ConfiguracaoPosEntity convert(ConfiguracaoModelIn input) {
    return ConfiguracaoPosEntity(
      permitirPagamentoEmDinheiroParaTodos: input.permitirPagamentoEmDinheiroParaTodos,
      permitirPagamentoParcialPos: input.permitirPagamentoParcialPos,
      permitirRemoverTaxaDeServico: input.permitirRemoverTaxaDeServicoPos,
      permitirRemoverCouvert: input.permitirRemoverCouvertPos,
      habilitarPosDinheiro: input.habilitarPosDinheiro,
      habilitarPosDebito: input.habilitarPosDebito,
      habilitarPosCredito: input.habilitarPosCredito,
      habilitarPosPix: input.habilitarPosPix,
      habilitarPedidoFichaPos: input.habilitarPedidoFichaPos,
      especificarBandeiraPos: input.especificarBandeiraPos,
      impressaoPosPedidoFicha: input.impressaoPedidoFichaPos == 'MAQUINA'
          ? ImpressaoPedidoFichaPos.imprimir
          : input.impressaoPedidoFichaPos == 'CONFORME_ITEM'
              ? ImpressaoPedidoFichaPos.conformeItem
              : ImpressaoPedidoFichaPos.naoImprimir,
      impressaoPosContaFicha:
          input.impressaoContaFichaPos == 'MAQUINA' || input.impressaoContaFichaPos == 'IMPRIMIR_EM_AMBOS',
      descricaoComanda: input.cabecalhoContaCartao,
      imprimirViaEstabelecimento: input.imprimirViaEstabelecimentoPos,
    );
  }
}
