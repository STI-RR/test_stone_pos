import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/login/domain/entities/permissoes_entity.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';

class LoginUseCase implements UseCase<UsuarioEntity, LoginParams> {
  LoginUseCase();

  @override
  Future<Result<UsuarioEntity>> call(LoginParams params) async {
    try {
      final usuario = UsuarioEntity(
          codigoUsuario: 1,
          codigoFuncionario: 1,
          codigoAcesso: 1,
          nomeFuncionario: 'TESTE',
          permissoes: PermissoesEntity(
              cancelarItens: '1',
              trocarItens: '1',
              trocarContas: '1',
              juntarContas: '1',
              fecharConta: '1',
              pagarPOSContaEmDinheiro: '1',
              pagarPOSContaEmDinheiroSemConfirmarSenha: '1',
              visualizarConta: '1',
              chamados: '1',
              pedido: '1',
              revisarSolicitacaoDeConta: '1',
              pedidosPendentes: '1'));
      return Result.success(usuario);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

class LoginParams {
  final String senha;

  LoginParams(this.senha);
}
