// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_impressao_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriaImpressaoModelIn _$CategoriaImpressaoModelInFromJson(
        Map<String, dynamic> json) =>
    CategoriaImpressaoModelIn(
      codigo: (json['codigo'] as num).toInt(),
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$CategoriaImpressaoModelInToJson(
        CategoriaImpressaoModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'descricao': instance.descricao,
    };
