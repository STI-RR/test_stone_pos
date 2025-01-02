// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_entrega_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnderecoEntregaModelIn _$EnderecoEntregaModelInFromJson(
        Map<String, dynamic> json) =>
    EnderecoEntregaModelIn(
      codigo: (json['codigo'] as num).toInt(),
      numero: json['numero'] as String,
      descricaoBairro: json['descricaoBairro'] as String,
      complemento: json['complemento'] as String,
      rua: json['rua'] as String,
      valorEntrega: (json['valorEntrega'] as num).toDouble(),
      bairro: BairroModelIn.fromJson(json['bairro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnderecoEntregaModelInToJson(
        EnderecoEntregaModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'numero': instance.numero,
      'descricaoBairro': instance.descricaoBairro,
      'complemento': instance.complemento,
      'rua': instance.rua,
      'valorEntrega': instance.valorEntrega,
      'bairro': instance.bairro,
    };
