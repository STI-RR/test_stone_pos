import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conclusao_pagamento_entity.g.dart';

@JsonSerializable()
@immutable
class ConclusaoPagamentoEntity {
  const ConclusaoPagamentoEntity({
    required this.success,
    this.atk,
    this.deviceSerial,
    this.successMessage,
    this.errorMessage,
    this.authorizeMessage,
    this.cardBrand,
    this.acquirer,
    this.transactionTime,
  });

  final bool success;
  final String? atk;
  final String? deviceSerial;
  final String? successMessage;
  final String? errorMessage;
  final String? authorizeMessage;
  final String? cardBrand;
  final String? acquirer;
  final int? transactionTime;

  factory ConclusaoPagamentoEntity.fromJson(Map<String, dynamic> json) => _$ConclusaoPagamentoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ConclusaoPagamentoEntityToJson(this);
}
