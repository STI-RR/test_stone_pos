// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credito_conta_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditoContaModelIn _$CreditoContaModelInFromJson(Map<String, dynamic> json) =>
    CreditoContaModelIn(
      codigo: (json['codigo'] as num).toInt(),
      descricao: json['descricao'] as String,
      valor: (json['valor'] as num).toDouble(),
      tipoPagamento: TipoPagamentoModelIn.fromJson(
          json['tipoPagamento'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditoContaModelInToJson(
        CreditoContaModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'valor': instance.valor,
      'tipoPagamento': instance.tipoPagamento,
    };
