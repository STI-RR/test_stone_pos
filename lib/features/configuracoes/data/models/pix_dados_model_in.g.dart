// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_dados_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixDadosModelIn _$PixDadosModelInFromJson(Map<String, dynamic> json) =>
    PixDadosModelIn(
      codigo: (json['codigo'] as num).toInt(),
      chave: json['chave'] as String,
      descricao: json['descricao'] as String,
      cidade: json['cidade'] as String?,
      nomeEstabelecimento: json['nomeEstabelecimento'] as String?,
      psp: json['psp'] as String?,
      producao: json['producao'] as bool,
      clientId: json['clientId'] as String?,
      clientSecret: json['clientSecret'] as String?,
      outrosDados: json['outrosDados'],
      exclusao: json['exclusao'] as String,
      expiracaoCobrancaEmSegundos:
          (json['expiracaoCobrancaEmSegundos'] as num).toInt(),
    );

Map<String, dynamic> _$PixDadosModelInToJson(PixDadosModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'chave': instance.chave,
      'descricao': instance.descricao,
      'cidade': instance.cidade,
      'nomeEstabelecimento': instance.nomeEstabelecimento,
      'psp': instance.psp,
      'producao': instance.producao,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'outrosDados': instance.outrosDados,
      'exclusao': instance.exclusao,
      'expiracaoCobrancaEmSegundos': instance.expiracaoCobrancaEmSegundos,
    };
