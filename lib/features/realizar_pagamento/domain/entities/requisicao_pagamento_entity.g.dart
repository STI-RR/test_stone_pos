// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requisicao_pagamento_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequisicaoPagamentoEntity _$RequisicaoPagamentoEntityFromJson(
        Map<String, dynamic> json) =>
    RequisicaoPagamentoEntity(
      valorEmCentavos: (json['valorEmCentavos'] as num).toInt(),
      formaDePagamento: json['formaDePagamento'] as String,
      sku: json['sku'] as String,
      imprimirViaEstabelecimento: json['imprimirViaEstabelecimento'] as bool,
    );

Map<String, dynamic> _$RequisicaoPagamentoEntityToJson(
        RequisicaoPagamentoEntity instance) =>
    <String, dynamic>{
      'valorEmCentavos': instance.valorEmCentavos,
      'formaDePagamento': instance.formaDePagamento,
      'sku': instance.sku,
      'imprimirViaEstabelecimento': instance.imprimirViaEstabelecimento,
    };
