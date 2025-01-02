// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_mesa_comanda_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteMesaComandaModelIn _$ClienteMesaComandaModelInFromJson(
        Map<String, dynamic> json) =>
    ClienteMesaComandaModelIn(
      codigo: (json['codigo'] as num).toInt(),
      nome: json['nome'] as String,
      celular: json['celular'] as String,
      cpf: json['cpf'] as String?,
      rg: json['rg'] as String?,
      socio: json['socio'] as bool?,
      inadimplente: json['inadimplente'] as bool?,
    );

Map<String, dynamic> _$ClienteMesaComandaModelInToJson(
        ClienteMesaComandaModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nome': instance.nome,
      'celular': instance.celular,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'socio': instance.socio,
      'inadimplente': instance.inadimplente,
    };
