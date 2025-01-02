// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_recibo_conta_pos_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemReciboContaPosEntity _$ItemReciboContaPosEntityFromJson(
        Map<String, dynamic> json) =>
    ItemReciboContaPosEntity(
      quantidade: (json['quantidade'] as num).toInt(),
      descricao: json['descricao'] as String,
      precoUnitario: (json['precoUnitario'] as num).toDouble(),
      precoVenda: (json['precoVenda'] as num).toDouble(),
    );

Map<String, dynamic> _$ItemReciboContaPosEntityToJson(
        ItemReciboContaPosEntity instance) =>
    <String, dynamic>{
      'quantidade': instance.quantidade,
      'descricao': instance.descricao,
      'precoUnitario': instance.precoUnitario,
      'precoVenda': instance.precoVenda,
    };
