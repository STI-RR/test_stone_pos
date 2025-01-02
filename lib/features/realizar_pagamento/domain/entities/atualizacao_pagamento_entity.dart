import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'atualizacao_pagamento_entity.g.dart';

@JsonSerializable()
@immutable
class AtualizacaoPagamentoEntity {
  const AtualizacaoPagamentoEntity({
    required this.codigoEvento,
    required this.descricaoEvento,
  });

  final int codigoEvento;
  final String descricaoEvento;

  factory AtualizacaoPagamentoEntity.fromJson(Map<String, dynamic> json) => _$AtualizacaoPagamentoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AtualizacaoPagamentoEntityToJson(this);
}
