// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_pagamento_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoPagamentoModelIn _$TipoPagamentoModelInFromJson(
        Map<String, dynamic> json) =>
    TipoPagamentoModelIn(
      codigo: (json['codigo'] as num).toInt(),
      status: json['status'] as String,
      descricao: json['descricao'] as String,
      ordem: (json['ordem'] as num).toInt(),
    );

Map<String, dynamic> _$TipoPagamentoModelInToJson(
        TipoPagamentoModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'status': instance.status,
      'descricao': instance.descricao,
      'ordem': instance.ordem,
    };
