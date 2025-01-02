import 'package:easyfood_app/features/login/domain/entities/permissoes_entity.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model_in.g.dart';

@JsonSerializable()
class LoginModelIn {
  LoginModelIn({
    required this.acesso,
    required this.permissoes,
  });

  Acesso acesso;
  Permissoes permissoes;

  factory LoginModelIn.fromJson(Map<String, dynamic> json) => _$LoginModelInFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelInToJson(this);

  UsuarioEntity toEntity() => UsuarioEntity(
        codigoUsuario: acesso.usuarioBean.codigo,
        codigoFuncionario: acesso.usuarioBean.funcionario.codigo,
        codigoAcesso: acesso.codigo,
        nomeFuncionario: acesso.usuarioBean.funcionario.nome,
        permissoes: permissoes.toEntity(),
      );
}

@JsonSerializable()
class Acesso {
  Acesso({
    required this.usuarioBean,
    required this.codigo,
  });

  UsuarioBean usuarioBean;
  int codigo;

  factory Acesso.fromJson(Map<String, dynamic> json) => _$AcessoFromJson(json);

  Map<String, dynamic> toJson() => _$AcessoToJson(this);
}

@JsonSerializable()
class UsuarioBean {
  UsuarioBean({
    required this.login,
    required this.funcionario,
    required this.codigo,
  });

  String login;
  Funcionario funcionario;
  int codigo;

  factory UsuarioBean.fromJson(Map<String, dynamic> json) => _$UsuarioBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioBeanToJson(this);
}

@JsonSerializable()
class Funcionario {
  Funcionario({
    required this.codigo,
    required this.nome,
  });

  int codigo;
  String nome;

  factory Funcionario.fromJson(Map<String, dynamic> json) => _$FuncionarioFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionarioToJson(this);
}

@JsonSerializable()
class Permissoes {
  Permissoes({
    required this.cancelarItens,
    required this.juntarContas,
    required this.pagarPOSContaEmDinheiro,
    required this.trocarContas,
    required this.visualiarConta, // Erro de ortografia no backend
    required this.chamados,
    required this.pedido,
    required this.revisarSolicitacaoDeConta,
    required this.fecharConta,
    required this.trocarItens,
    required this.pedidosPendentes,
    required this.pagarPOSContaEmDinheiroSemConfirmarSenha,
  });

  String cancelarItens;
  String juntarContas;
  String pagarPOSContaEmDinheiro;
  String trocarContas;
  String visualiarConta; // Erro de ortografia no backend
  String chamados;
  String pedido;
  String revisarSolicitacaoDeConta;
  String fecharConta;
  String trocarItens;
  String pedidosPendentes;
  String pagarPOSContaEmDinheiroSemConfirmarSenha;

  factory Permissoes.fromJson(Map<String, dynamic> json) => _$PermissoesFromJson(json);

  Map<String, dynamic> toJson() => _$PermissoesToJson(this);

  PermissoesEntity toEntity() => PermissoesEntity(
        cancelarItens: cancelarItens,
        juntarContas: juntarContas,
        pagarPOSContaEmDinheiro: pagarPOSContaEmDinheiro,
        trocarContas: trocarContas,
        visualizarConta: visualiarConta, // Erro de ortografia no backend
        chamados: chamados,
        pedido: pedido,
        revisarSolicitacaoDeConta: revisarSolicitacaoDeConta,
        fecharConta: fecharConta,
        trocarItens: trocarItens,
        pedidosPendentes: pedidosPendentes,
        pagarPOSContaEmDinheiroSemConfirmarSenha: pagarPOSContaEmDinheiroSemConfirmarSenha,
      );
}
