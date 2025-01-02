// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_mesa_comanda_model_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteMesaComandaModelOut _$ClienteMesaComandaModelOutFromJson(
        Map<String, dynamic> json) =>
    ClienteMesaComandaModelOut(
      nome: json['nome'] as String,
      telefone: json['telefone'] as String,
      mesa: (json['mesa'] as num?)?.toInt(),
      cartao: (json['cartao'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ClienteMesaComandaModelOutToJson(
        ClienteMesaComandaModelOut instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'telefone': instance.telefone,
      'mesa': instance.mesa,
      'cartao': instance.cartao,
    };
