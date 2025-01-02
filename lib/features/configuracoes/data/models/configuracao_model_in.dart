import 'package:easyfood_app/features/configuracoes/data/models/configuracao_app_model_in.dart';
import 'package:easyfood_app/features/configuracoes/data/models/pix_dados_model_in.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configuracao_model_in.g.dart';

@JsonSerializable()
class ConfiguracaoModelIn {
  String tipoPrecoPizza;
  String nome;
  bool permitirPagamentoEmDinheiroParaTodos;
  bool permitirPagamentoParcialPos;
  bool permitirRemoverTaxaDeServicoPos;
  bool permitirRemoverCouvertPos;
  bool pedidoQtdeItensAgrupada;
  bool habilitarPosDinheiro;
  bool habilitarPosDebito;
  bool habilitarPosCredito;
  bool habilitarPosPix;
  bool habilitarPedidoFichaPos;
  bool especificarBandeiraPos;
  String impressaoPedidoFichaPos;
  String? impressaoContaFichaPos;
  int servicoOuGorjeta;
  bool alterarNumPessoas;
  String cabecalhoContaCartao;
  String statusPix;
  PixDadosModelIn? dadosPixEstatico;
  bool imprimirViaEstabelecimentoPos;
  bool permitidoImpressaoEmEspera;
  ConfiguracaoAppModelIn configuracoesAppBean;
  double taxaServico;
  double taxaCouvert;
  bool cobrarCouvertFicha;
  bool cobrarServicoFicha;

  ConfiguracaoModelIn({
    required this.tipoPrecoPizza,
    required this.nome,
    required this.permitirPagamentoEmDinheiroParaTodos,
    required this.permitirPagamentoParcialPos,
    this.permitirRemoverTaxaDeServicoPos = false,
    this.permitirRemoverCouvertPos = false,
    required this.pedidoQtdeItensAgrupada,
    required this.habilitarPosDinheiro,
    required this.habilitarPosDebito,
    required this.habilitarPosCredito,
    required this.habilitarPosPix,
    required this.habilitarPedidoFichaPos,
    required this.especificarBandeiraPos,
    required this.impressaoPedidoFichaPos,
    this.impressaoContaFichaPos,
    required this.servicoOuGorjeta,
    required this.alterarNumPessoas,
    required this.cabecalhoContaCartao,
    required this.statusPix,
    this.dadosPixEstatico,
    required this.imprimirViaEstabelecimentoPos,
    required this.permitidoImpressaoEmEspera,
    required this.configuracoesAppBean,
    required this.taxaServico,
    this.taxaCouvert = 0.0,
    this.cobrarCouvertFicha = false,
    this.cobrarServicoFicha = false,
  })  : assert(tipoPrecoPizza == 'MAIOR_VALOR' ||
            tipoPrecoPizza == 'MEDIA_ARITMETICA' ||
            tipoPrecoPizza == 'MEDIA_ARITIMETICA_ARREDONDADA'),
        assert(impressaoPedidoFichaPos == 'MAQUINA' ||
            impressaoPedidoFichaPos == 'CAIXA' ||
            impressaoPedidoFichaPos == 'IMPRESSORA_DO_ITEM' ||
            impressaoPedidoFichaPos == 'CONFORME_ITEM'),
        assert(impressaoContaFichaPos == null ||
            impressaoContaFichaPos == 'NAO_IMPRIMIR' ||
            impressaoContaFichaPos == 'MAQUINA' ||
            impressaoContaFichaPos == 'CAIXA' ||
            impressaoContaFichaPos == 'IMPRIMIR_EM_AMBOS'),
        assert(servicoOuGorjeta == 0 || servicoOuGorjeta == 1),
        assert(statusPix == 'DINAMICO' || statusPix == 'ESTATICO' || statusPix == 'DESATIVADO');

  factory ConfiguracaoModelIn.fromJson(Map<String, dynamic> json) => _$ConfiguracaoModelInFromJson(json);

  Map<String, dynamic> toJson() => _$ConfiguracaoModelInToJson(this);
}
