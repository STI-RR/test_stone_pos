// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesa_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MesaModelIn _$MesaModelInFromJson(Map<String, dynamic> json) => MesaModelIn(
      bloqueio: json['bloqueio'] as bool?,
      codigo: (json['codigo'] as num).toInt(),
      descricao: json['descricao'] as String,
      initPointMercadoPagoPreferencia:
          json['initPointMercadoPagoPreferencia'] as String?,
      situacao: json['situacao'] as String?,
      observacao: json['observacao'] as String?,
      statusPixCobranca: json['statusPixCobranca'] as String?,
      qrCodePixCobranca: json['qrCodePixCobranca'] as String?,
      nomeCliente: json['nomeCliente'] as String?,
      celularCliente: json['celularCliente'] as String?,
      temReserva: json['temReserva'] as bool?,
      reserva: json['reserva'],
    );

Map<String, dynamic> _$MesaModelInToJson(MesaModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'bloqueio': instance.bloqueio,
      'nomeCliente': instance.nomeCliente,
      'celularCliente': instance.celularCliente,
      'observacao': instance.observacao,
      'initPointMercadoPagoPreferencia':
          instance.initPointMercadoPagoPreferencia,
      'situacao': instance.situacao,
      'statusPixCobranca': instance.statusPixCobranca,
      'qrCodePixCobranca': instance.qrCodePixCobranca,
      'temReserva': instance.temReserva,
      'reserva': instance.reserva,
    };
