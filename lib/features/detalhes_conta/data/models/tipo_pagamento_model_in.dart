import 'package:json_annotation/json_annotation.dart';

part 'tipo_pagamento_model_in.g.dart';

@JsonSerializable()
class TipoPagamentoModelIn {
  final int codigo;
  final String status;
  final String descricao;
  final int ordem;

  TipoPagamentoModelIn({
    required this.codigo,
    required this.status,
    required this.descricao,
    required this.ordem,
  });

  factory TipoPagamentoModelIn.fromJson(Map<String, dynamic> json) => _$TipoPagamentoModelInFromJson(json);

  Map<String, dynamic> toJson() => _$TipoPagamentoModelInToJson(this);
}
