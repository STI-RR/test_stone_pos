import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_pos_entity.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/pix_dados_entity.dart';

class ConfiguracaoEntity {
  final TipoPrecoPizza tipoPrecoPizza;
  final String nomeEstabelecimento;
  final ConfiguracaoPosEntity configuracaoPos;
  final String textoParaGorjeta;
  bool solicitarNumeroDePessoasComanda;
  bool habilitarPedidoMesa;
  bool habilitarPedidoComanda;
  bool habilitarPedidoPraViagem;
  bool habilitarPedidoDelivery;
  bool agruparQuantidadeItensPedido;
  bool habilitarPixDinamico;
  bool habilitarPixEstatico;
  PixDadosEntity? pixDadosEstatico;
  bool mesaFisicaNoPedido;
  bool mesaFisicaNoPedidoMesa;
  bool mesaFisicaNoPedidoComanda;
  bool mesaFisicaNoPedidoFicha;
  bool mesaFisicaNaConta;
  bool mesaFisicaNaContaMesa;
  bool mesaFisicaNaContaComanda;
  bool habilitarCardapioPizzas;
  bool habilitarCardapioCombos;
  bool permiteImpressaoItemPedidoEmEspera;
  bool validarMesaFisica;
  bool escolherCategoriaImpressaoConta;
  double valorPercentualTaxaServico;
  double valorCouvert;
  bool cobrarCouvertFicha;
  bool cobrarServicoFicha;

  ConfiguracaoEntity({
    required this.tipoPrecoPizza,
    required this.nomeEstabelecimento,
    required this.configuracaoPos,
    required this.textoParaGorjeta,
    required this.solicitarNumeroDePessoasComanda,
    required this.habilitarPedidoMesa,
    required this.habilitarPedidoComanda,
    required this.habilitarPedidoPraViagem,
    required this.habilitarPedidoDelivery,
    required this.agruparQuantidadeItensPedido,
    required this.habilitarPixDinamico,
    required this.habilitarPixEstatico,
    this.pixDadosEstatico,
    required this.mesaFisicaNoPedido,
    required this.mesaFisicaNoPedidoMesa,
    required this.mesaFisicaNoPedidoComanda,
    required this.mesaFisicaNoPedidoFicha,
    required this.mesaFisicaNaConta,
    required this.mesaFisicaNaContaMesa,
    required this.mesaFisicaNaContaComanda,
    required this.habilitarCardapioPizzas,
    required this.habilitarCardapioCombos,
    required this.permiteImpressaoItemPedidoEmEspera,
    required this.validarMesaFisica,
    required this.escolherCategoriaImpressaoConta,
    required this.valorPercentualTaxaServico,
    required this.valorCouvert,
    required this.cobrarCouvertFicha,
    required this.cobrarServicoFicha,
  });
}

enum TipoPrecoPizza {
  maiorValor,
  mediaAritmetica,
  mediaAritmeticaArredondada,
}
