import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'requisicao_pagamento_entity.g.dart';

@JsonSerializable()
@immutable
class RequisicaoPagamentoEntity {
  const RequisicaoPagamentoEntity({
    required this.valorEmCentavos,
    required this.formaDePagamento,
    required this.sku,
    required this.imprimirViaEstabelecimento,
  });

  final int valorEmCentavos;
  final String formaDePagamento;
  final String sku;
  final bool imprimirViaEstabelecimento;

  factory RequisicaoPagamentoEntity.fromJson(Map<String, dynamic> json) => _$RequisicaoPagamentoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RequisicaoPagamentoEntityToJson(this);
}
