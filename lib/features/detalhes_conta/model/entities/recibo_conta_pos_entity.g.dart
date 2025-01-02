// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recibo_conta_pos_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciboContaPosEntity _$ReciboContaPosEntityFromJson(
        Map<String, dynamic> json) =>
    ReciboContaPosEntity(
      descricao: json['descricao'] as String,
      codigo: (json['codigo'] as num).toInt(),
      observacao: json['observacao'] as String,
      subTotal: (json['subTotal'] as num).toDouble(),
      tituloServico: json['tituloServico'] as String,
      servico: (json['servico'] as num).toDouble(),
      cobrarCouvert: json['cobrarCouvert'] as bool,
      couvert: (json['couvert'] as num).toDouble(),
      quantidadeDePessoas: (json['quantidadeDePessoas'] as num).toInt(),
      total: (json['total'] as num).toDouble(),
      itens: (json['itens'] as List<dynamic>)
          .map((e) =>
              ItemReciboContaPosEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      nomeEstabelecimento: json['nomeEstabelecimento'] as String,
      funcionario: json['funcionario'] as String,
      qrCodePixImageBase64: json['qrCodePixImageBase64'] as String?,
    );

Map<String, dynamic> _$ReciboContaPosEntityToJson(
        ReciboContaPosEntity instance) =>
    <String, dynamic>{
      'descricao': instance.descricao,
      'codigo': instance.codigo,
      'observacao': instance.observacao,
      'subTotal': instance.subTotal,
      'tituloServico': instance.tituloServico,
      'servico': instance.servico,
      'cobrarCouvert': instance.cobrarCouvert,
      'couvert': instance.couvert,
      'quantidadeDePessoas': instance.quantidadeDePessoas,
      'total': instance.total,
      'itens': instance.itens,
      'nomeEstabelecimento': instance.nomeEstabelecimento,
      'funcionario': instance.funcionario,
      'qrCodePixImageBase64': instance.qrCodePixImageBase64,
    };
