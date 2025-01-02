import 'package:json_annotation/json_annotation.dart';

part 'pix_dados_model_in.g.dart';

@JsonSerializable()
class PixDadosModelIn {
  int codigo;
  String chave;
  String descricao;
  String? cidade;
  String? nomeEstabelecimento;
  String? psp;
  bool producao;
  String? clientId;
  String? clientSecret;
  dynamic outrosDados;
  String exclusao;
  int expiracaoCobrancaEmSegundos;

  PixDadosModelIn({
    required this.codigo,
    required this.chave,
    required this.descricao,
    this.cidade,
    this.nomeEstabelecimento,
    this.psp,
    required this.producao,
    this.clientId,
    this.clientSecret,
    required this.outrosDados,
    required this.exclusao,
    required this.expiracaoCobrancaEmSegundos,
  });

  factory PixDadosModelIn.fromJson(Map<String, dynamic> json) => _$PixDadosModelInFromJson(json);

  Map<String, dynamic> toJson() => _$PixDadosModelInToJson(this);
}
