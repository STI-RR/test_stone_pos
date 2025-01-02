// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModelIn _$ClienteModelInFromJson(Map<String, dynamic> json) =>
    ClienteModelIn(
      codigo: (json['codigo'] as num).toInt(),
      nome: json['nome'] as String,
      celular: json['celular'] as String?,
      cpf: json['cpf'] as String?,
      rg: json['rg'] as String?,
      socio: json['socio'] as bool?,
      inadimplente: json['inadimplente'] as bool?,
    );

Map<String, dynamic> _$ClienteModelInToJson(ClienteModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nome': instance.nome,
      'celular': instance.celular,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'socio': instance.socio,
      'inadimplente': instance.inadimplente,
    };
