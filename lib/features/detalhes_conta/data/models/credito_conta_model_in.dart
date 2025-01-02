import 'package:easyfood_app/features/detalhes_conta/data/models/tipo_pagamento_model_in.dart';
import 'package:easyfood_app/features/detalhes_conta/model/entities/credito_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credito_conta_model_in.g.dart';

@JsonSerializable()
class CreditoContaModelIn {
  final int codigo;
  final String descricao;
  final double valor;
  final TipoPagamentoModelIn tipoPagamento;

  CreditoContaModelIn({
    required this.codigo,
    required this.descricao,
    required this.valor,
    required this.tipoPagamento,
  });

  factory CreditoContaModelIn.fromJson(Map<String, dynamic> json) => _$CreditoContaModelInFromJson(json);

  Map<String, dynamic> toJson() => _$CreditoContaModelInToJson(this);

  CreditoEntity toEntity() => CreditoEntity(
        codigo: codigo,
        descricao: descricao,
        valor: valor,
        tipoPagamento: tipoPagamento.status,
        descricaoTipoPagamento: tipoPagamento.descricao,
      );
}
