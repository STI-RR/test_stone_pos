// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bairro_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BairroModelIn _$BairroModelInFromJson(Map<String, dynamic> json) =>
    BairroModelIn(
      codigo: (json['codigo'] as num).toInt(),
      valorAdicional: (json['valorAdicional'] as num).toDouble(),
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$BairroModelInToJson(BairroModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'valorAdicional': instance.valorAdicional,
      'descricao': instance.descricao,
    };
