// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_ficha_impressao_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemFichaImpressaoEntity _$ItemFichaImpressaoEntityFromJson(
        Map<String, dynamic> json) =>
    ItemFichaImpressaoEntity(
      conta: (json['conta'] as num).toInt(),
      descricao: json['descricao'] as String,
      observacao: json['observacao'] as String,
      index: (json['index'] as num).toInt(),
      ofIndex: (json['ofIndex'] as num).toInt(),
      funcionario: json['funcionario'] as String,
      preco: (json['preco'] as num).toDouble(),
    )
      ..selected = json['selected'] as bool
      ..printed = json['printed'] as bool;

Map<String, dynamic> _$ItemFichaImpressaoEntityToJson(
        ItemFichaImpressaoEntity instance) =>
    <String, dynamic>{
      'conta': instance.conta,
      'descricao': instance.descricao,
      'observacao': instance.observacao,
      'index': instance.index,
      'ofIndex': instance.ofIndex,
      'funcionario': instance.funcionario,
      'preco': instance.preco,
      'selected': instance.selected,
      'printed': instance.printed,
    };
