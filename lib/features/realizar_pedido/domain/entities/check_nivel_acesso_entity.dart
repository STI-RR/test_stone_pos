class CheckNivelAcessoEntity {
  final int idUsuario;
  final String login;
  final int idPermissao;
  final bool permissao;

  CheckNivelAcessoEntity({
    required this.idUsuario,
    required this.login,
    required this.idPermissao,
    required this.permissao,
  });
}
