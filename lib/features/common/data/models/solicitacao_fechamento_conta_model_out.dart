import 'package:json_annotation/json_annotation.dart';

part 'solicitacao_fechamento_conta_model_out.g.dart';

@JsonSerializable()
class SolicitacaoFechamentoContaModelOut {
  final String sistemaOrigem;
  int conta;
  int funcionario;
  int numerodepessoas;
  String? observacao;
  bool imprimir;
  bool gerarCobrancaPix;

  @JsonKey(includeIfNull: false)
  int? categoriaimpressao;

  @JsonKey(includeIfNull: false)
  String? deviceSerial;

  SolicitacaoFechamentoContaModelOut({
    required this.conta,
    required this.funcionario,
    required this.numerodepessoas,
    this.observacao,
    this.imprimir = true,
    this.gerarCobrancaPix = false,
    this.categoriaimpressao,
    this.deviceSerial,
    this.sistemaOrigem = 'POS',
  });

  factory SolicitacaoFechamentoContaModelOut.fromJson(Map<String, dynamic> json) =>
      _$SolicitacaoFechamentoContaModelOutFromJson(json);

  Map<String, dynamic> toJson() => _$SolicitacaoFechamentoContaModelOutToJson(this);
}
