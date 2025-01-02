// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conclusao_pagamento_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConclusaoPagamentoEntity _$ConclusaoPagamentoEntityFromJson(
        Map<String, dynamic> json) =>
    ConclusaoPagamentoEntity(
      success: json['success'] as bool,
      atk: json['atk'] as String?,
      deviceSerial: json['deviceSerial'] as String?,
      successMessage: json['successMessage'] as String?,
      errorMessage: json['errorMessage'] as String?,
      authorizeMessage: json['authorizeMessage'] as String?,
      cardBrand: json['cardBrand'] as String?,
      acquirer: json['acquirer'] as String?,
      transactionTime: (json['transactionTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConclusaoPagamentoEntityToJson(
        ConclusaoPagamentoEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'atk': instance.atk,
      'deviceSerial': instance.deviceSerial,
      'successMessage': instance.successMessage,
      'errorMessage': instance.errorMessage,
      'authorizeMessage': instance.authorizeMessage,
      'cardBrand': instance.cardBrand,
      'acquirer': instance.acquirer,
      'transactionTime': instance.transactionTime,
    };
