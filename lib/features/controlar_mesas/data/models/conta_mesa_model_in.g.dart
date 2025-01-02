// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conta_mesa_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContaMesaModelIn _$ContaMesaModelInFromJson(Map<String, dynamic> json) =>
    ContaMesaModelIn(
      codigo: (json['codigo'] as num).toInt(),
      senha: (json['senha'] as num?)?.toInt(),
      mesa: MesaModelIn.fromJson(json['mesa'] as Map<String, dynamic>),
      dataHoraInicio: (json['dataHoraInicio'] as num).toInt(),
      cliente: json['cliente'] == null
          ? null
          : ClienteModelIn.fromJson(json['cliente'] as Map<String, dynamic>),
      qrCodePix: json['qrCodePix'] as String?,
      qrCodePagamentoOnline: json['qrCodePagamentoOnline'] as String?,
      quantidadePessoas: (json['quantidadePessoas'] as num?)?.toInt(),
      cobrarCouvert: json['cobrarCouvert'] as bool,
      couvertFixo: json['couvertFixo'] as bool,
      valorCouvert: (json['valorCouvert'] as num?)?.toDouble(),
      valorServico: (json['valorServico'] as num?)?.toDouble(),
      valorItens: (json['valorItens'] as num?)?.toDouble(),
      valorCreditos: (json['valorCreditos'] as num?)?.toDouble(),
      nomeClientePraViagem: json['nomeClientePraViagem'] as String?,
      formaPagamento: json['formaPagamento'] as String?,
      valorAPagar: (json['valorAPagar'] as num?)?.toDouble(),
      valorEntrega: (json['valorEntrega'] as num?)?.toDouble(),
      adicional: (json['adicional'] as num?)?.toDouble(),
      nomeFuncionarioAbertura: json['nomeFuncionarioAbertura'] as String?,
      bloqueio: json['bloqueio'] as bool?,
    );

Map<String, dynamic> _$ContaMesaModelInToJson(ContaMesaModelIn instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'senha': instance.senha,
      'mesa': instance.mesa,
      'dataHoraInicio': instance.dataHoraInicio,
      'cliente': instance.cliente,
      'qrCodePix': instance.qrCodePix,
      'qrCodePagamentoOnline': instance.qrCodePagamentoOnline,
      'quantidadePessoas': instance.quantidadePessoas,
      'cobrarCouvert': instance.cobrarCouvert,
      'couvertFixo': instance.couvertFixo,
      'valorCouvert': instance.valorCouvert,
      'valorServico': instance.valorServico,
      'valorItens': instance.valorItens,
      'valorCreditos': instance.valorCreditos,
      'nomeClientePraViagem': instance.nomeClientePraViagem,
      'formaPagamento': instance.formaPagamento,
      'valorAPagar': instance.valorAPagar,
      'valorEntrega': instance.valorEntrega,
      'adicional': instance.adicional,
      'nomeFuncionarioAbertura': instance.nomeFuncionarioAbertura,
      'bloqueio': instance.bloqueio,
    };
