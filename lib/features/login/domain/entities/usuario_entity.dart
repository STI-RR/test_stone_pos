import 'package:easyfood_app/features/login/domain/entities/permissoes_entity.dart';

class UsuarioEntity {
  UsuarioEntity({
    required this.codigoUsuario,
    required this.codigoFuncionario,
    required this.codigoAcesso,
    required this.nomeFuncionario,
    required this.permissoes,
  });

  int codigoUsuario;
  int codigoFuncionario;
  int codigoAcesso;
  String nomeFuncionario;
  PermissoesEntity permissoes;

  factory UsuarioEntity.offline() {
    return UsuarioEntity(
      codigoUsuario: 0,
      codigoFuncionario: 0,
      codigoAcesso: 0,
      nomeFuncionario: 'Offline',
      permissoes: PermissoesEntity(
        cancelarItens: '0',
        trocarItens: '0',
        trocarContas: '0',
        juntarContas: '0',
        fecharConta: '0',
        pagarPOSContaEmDinheiro: '0',
        pagarPOSContaEmDinheiroSemConfirmarSenha: '0',
        visualizarConta: '0',
        chamados: '0',
        pedido: '0',
        revisarSolicitacaoDeConta: '0',
        pedidosPendentes: '0',
      ),
    );
  }
}
