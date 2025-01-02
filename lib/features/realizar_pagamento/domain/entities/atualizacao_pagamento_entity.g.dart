// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atualizacao_pagamento_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AtualizacaoPagamentoEntity _$AtualizacaoPagamentoEntityFromJson(
        Map<String, dynamic> json) =>
    AtualizacaoPagamentoEntity(
      codigoEvento: (json['codigoEvento'] as num).toInt(),
      descricaoEvento: json['descricaoEvento'] as String,
    );

Map<String, dynamic> _$AtualizacaoPagamentoEntityToJson(
        AtualizacaoPagamentoEntity instance) =>
    <String, dynamic>{
      'codigoEvento': instance.codigoEvento,
      'descricaoEvento': instance.descricaoEvento,
    };
