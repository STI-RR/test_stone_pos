// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobranca_pix_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CobrancaPixModelIn _$CobrancaPixModelInFromJson(Map<String, dynamic> json) =>
    CobrancaPixModelIn(
      qrCode: json['qrCode'] as String,
      valor: (json['valor'] as num).toDouble(),
      criacao: (json['criacao'] as num).toInt(),
      expiracaoEmSegundos: (json['expiracaoEmSegundos'] as num).toInt(),
      ativa: json['ativa'] as bool,
      concluida: json['concluida'] as bool,
    );

Map<String, dynamic> _$CobrancaPixModelInToJson(CobrancaPixModelIn instance) =>
    <String, dynamic>{
      'qrCode': instance.qrCode,
      'valor': instance.valor,
      'criacao': instance.criacao,
      'expiracaoEmSegundos': instance.expiracaoEmSegundos,
      'ativa': instance.ativa,
      'concluida': instance.concluida,
    };
