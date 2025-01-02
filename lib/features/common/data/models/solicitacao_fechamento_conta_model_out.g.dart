// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_fechamento_conta_model_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolicitacaoFechamentoContaModelOut _$SolicitacaoFechamentoContaModelOutFromJson(
        Map<String, dynamic> json) =>
    SolicitacaoFechamentoContaModelOut(
      conta: (json['conta'] as num).toInt(),
      funcionario: (json['funcionario'] as num).toInt(),
      numerodepessoas: (json['numerodepessoas'] as num).toInt(),
      observacao: json['observacao'] as String?,
      imprimir: json['imprimir'] as bool? ?? true,
      gerarCobrancaPix: json['gerarCobrancaPix'] as bool? ?? false,
      categoriaimpressao: (json['categoriaimpressao'] as num?)?.toInt(),
      deviceSerial: json['deviceSerial'] as String?,
      sistemaOrigem: json['sistemaOrigem'] as String? ?? 'POS',
    );

Map<String, dynamic> _$SolicitacaoFechamentoContaModelOutToJson(
    SolicitacaoFechamentoContaModelOut instance) {
  final val = <String, dynamic>{
    'sistemaOrigem': instance.sistemaOrigem,
    'conta': instance.conta,
    'funcionario': instance.funcionario,
    'numerodepessoas': instance.numerodepessoas,
    'observacao': instance.observacao,
    'imprimir': instance.imprimir,
    'gerarCobrancaPix': instance.gerarCobrancaPix,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('categoriaimpressao', instance.categoriaimpressao);
  writeNotNull('deviceSerial', instance.deviceSerial);
  return val;
}
