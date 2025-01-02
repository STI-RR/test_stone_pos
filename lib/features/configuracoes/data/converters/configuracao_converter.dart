import 'dart:convert';

import 'package:easyfood_app/features/configuracoes/data/converters/configuracao_pos_converter.dart';
import 'package:easyfood_app/features/configuracoes/data/converters/pix_dados_converter.dart';
import 'package:easyfood_app/features/configuracoes/data/models/configuracao_model_in.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_entity.dart';

class ConfiguracaoConverter extends Converter<ConfiguracaoModelIn, ConfiguracaoEntity> {
  @override
  ConfiguracaoEntity convert(ConfiguracaoModelIn input) {
    return ConfiguracaoEntity(
      tipoPrecoPizza: input.tipoPrecoPizza == 'MAIOR_VALOR'
          ? TipoPrecoPizza.maiorValor
          : input.tipoPrecoPizza == 'MEDIA_ARITMETICA'
              ? TipoPrecoPizza.mediaAritmetica
              : TipoPrecoPizza.mediaAritmeticaArredondada,
      nomeEstabelecimento: input.nome,
      configuracaoPos: ConfiguracaoPosConverter().convert(input),
      textoParaGorjeta: input.servicoOuGorjeta == 0 ? 'Taxa de serviço' : 'Gorjeta',
      solicitarNumeroDePessoasComanda: input.alterarNumPessoas,
      habilitarPedidoMesa: input.configuracoesAppBean.padraoMesa,
      habilitarPedidoComanda: input.configuracoesAppBean.padraoCartao,
      habilitarPedidoPraViagem: input.configuracoesAppBean.padraoPraViagem,
      habilitarPedidoDelivery: input.configuracoesAppBean.padraoDelivery,
      agruparQuantidadeItensPedido: input.pedidoQtdeItensAgrupada,
      habilitarPixDinamico: input.statusPix == 'DINAMICO',
      habilitarPixEstatico: input.statusPix == 'ESTATICO',
      pixDadosEstatico: input.dadosPixEstatico != null ? PixDadosConverter().convert(input.dadosPixEstatico!) : null,
      mesaFisicaNoPedido: input.configuracoesAppBean.obsMesaFisicaPedido,
      mesaFisicaNoPedidoMesa: input.configuracoesAppBean.obsMesaFisicaPedidoMesa,
      mesaFisicaNoPedidoComanda: input.configuracoesAppBean.obsMesaFisicaPedidoCartao,
      mesaFisicaNoPedidoFicha: input.configuracoesAppBean.obsMesaFisicaPedidoFicha,
      mesaFisicaNaConta: input.configuracoesAppBean.obsMesaFisicaConta,
      mesaFisicaNaContaMesa: input.configuracoesAppBean.obsMesaFisicaContaMesa,
      mesaFisicaNaContaComanda: input.configuracoesAppBean.obsMesaFisicaContaCartao,
      habilitarCardapioPizzas: input.configuracoesAppBean.mostrarAbaDePizza,
      habilitarCardapioCombos: input.configuracoesAppBean.mostrarAbaDeCombo,
      permiteImpressaoItemPedidoEmEspera: input.permitidoImpressaoEmEspera,
      validarMesaFisica: input.configuracoesAppBean.statusMesaFisica == 'ATIVADA',
      escolherCategoriaImpressaoConta: input.configuracoesAppBean.escolhaCategoriaImpressao,
      valorPercentualTaxaServico: input.taxaServico,
      valorCouvert: input.taxaCouvert,
      cobrarCouvertFicha: input.cobrarCouvertFicha,
      cobrarServicoFicha: input.cobrarServicoFicha,
    );
  }
}
