class PixDadosEntity {
  int id;
  String descricao;
  String chave;
  String? nomeEstabelecimento;
  String? psp;
  bool producao;
  String? clientId;
  String? clientSecret;
  dynamic outrosDados;
  String exclusao;
  String? cidade;
  int expiracaoCobrancaEmSegundos;

  PixDadosEntity({
    required this.id,
    required this.descricao,
    required this.chave,
    this.nomeEstabelecimento,
    this.psp,
    required this.producao,
    this.clientId,
    this.clientSecret,
    required this.outrosDados,
    required this.exclusao,
    this.cidade,
    required this.expiracaoCobrancaEmSegundos,
  });
}
