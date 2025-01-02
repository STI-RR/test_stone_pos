// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracao_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfiguracaoModelIn _$ConfiguracaoModelInFromJson(Map<String, dynamic> json) =>
    ConfiguracaoModelIn(
      tipoPrecoPizza: json['tipoPrecoPizza'] as String,
      nome: json['nome'] as String,
      permitirPagamentoEmDinheiroParaTodos:
          json['permitirPagamentoEmDinheiroParaTodos'] as bool,
      permitirPagamentoParcialPos: json['permitirPagamentoParcialPos'] as bool,
      permitirRemoverTaxaDeServicoPos:
          json['permitirRemoverTaxaDeServicoPos'] as bool? ?? false,
      permitirRemoverCouvertPos:
          json['permitirRemoverCouvertPos'] as bool? ?? false,
      pedidoQtdeItensAgrupada: json['pedidoQtdeItensAgrupada'] as bool,
      habilitarPosDinheiro: json['habilitarPosDinheiro'] as bool,
      habilitarPosDebito: json['habilitarPosDebito'] as bool,
      habilitarPosCredito: json['habilitarPosCredito'] as bool,
      habilitarPosPix: json['habilitarPosPix'] as bool,
      habilitarPedidoFichaPos: json['habilitarPedidoFichaPos'] as bool,
      especificarBandeiraPos: json['especificarBandeiraPos'] as bool,
      impressaoPedidoFichaPos: json['impressaoPedidoFichaPos'] as String,
      impressaoContaFichaPos: json['impressaoContaFichaPos'] as String?,
      servicoOuGorjeta: (json['servicoOuGorjeta'] as num).toInt(),
      alterarNumPessoas: json['alterarNumPessoas'] as bool,
      cabecalhoContaCartao: json['cabecalhoContaCartao'] as String,
      statusPix: json['statusPix'] as String,
      dadosPixEstatico: json['dadosPixEstatico'] == null
          ? null
          : PixDadosModelIn.fromJson(
              json['dadosPixEstatico'] as Map<String, dynamic>),
      imprimirViaEstabelecimentoPos:
          json['imprimirViaEstabelecimentoPos'] as bool,
      permitidoImpressaoEmEspera: json['permitidoImpressaoEmEspera'] as bool,
      configuracoesAppBean: ConfiguracaoAppModelIn.fromJson(
          json['configuracoesAppBean'] as Map<String, dynamic>),
      taxaServico: (json['taxaServico'] as num).toDouble(),
      taxaCouvert: (json['taxaCouvert'] as num?)?.toDouble() ?? 0.0,
      cobrarCouvertFicha: json['cobrarCouvertFicha'] as bool? ?? false,
      cobrarServicoFicha: json['cobrarServicoFicha'] as bool? ?? false,
    );

Map<String, dynamic> _$ConfiguracaoModelInToJson(
        ConfiguracaoModelIn instance) =>
    <String, dynamic>{
      'tipoPrecoPizza': instance.tipoPrecoPizza,
      'nome': instance.nome,
      'permitirPagamentoEmDinheiroParaTodos':
          instance.permitirPagamentoEmDinheiroParaTodos,
      'permitirPagamentoParcialPos': instance.permitirPagamentoParcialPos,
      'permitirRemoverTaxaDeServicoPos':
          instance.permitirRemoverTaxaDeServicoPos,
      'permitirRemoverCouvertPos': instance.permitirRemoverCouvertPos,
      'pedidoQtdeItensAgrupada': instance.pedidoQtdeItensAgrupada,
      'habilitarPosDinheiro': instance.habilitarPosDinheiro,
      'habilitarPosDebito': instance.habilitarPosDebito,
      'habilitarPosCredito': instance.habilitarPosCredito,
      'habilitarPosPix': instance.habilitarPosPix,
      'habilitarPedidoFichaPos': instance.habilitarPedidoFichaPos,
      'especificarBandeiraPos': instance.especificarBandeiraPos,
      'impressaoPedidoFichaPos': instance.impressaoPedidoFichaPos,
      'impressaoContaFichaPos': instance.impressaoContaFichaPos,
      'servicoOuGorjeta': instance.servicoOuGorjeta,
      'alterarNumPessoas': instance.alterarNumPessoas,
      'cabecalhoContaCartao': instance.cabecalhoContaCartao,
      'statusPix': instance.statusPix,
      'dadosPixEstatico': instance.dadosPixEstatico,
      'imprimirViaEstabelecimentoPos': instance.imprimirViaEstabelecimentoPos,
      'permitidoImpressaoEmEspera': instance.permitidoImpressaoEmEspera,
      'configuracoesAppBean': instance.configuracoesAppBean,
      'taxaServico': instance.taxaServico,
      'taxaCouvert': instance.taxaCouvert,
      'cobrarCouvertFicha': instance.cobrarCouvertFicha,
      'cobrarServicoFicha': instance.cobrarServicoFicha,
    };
