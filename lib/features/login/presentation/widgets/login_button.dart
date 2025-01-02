import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/mesa_entity.dart';
import 'package:easyfood_app/features/controlar_mesas/domain/entities/status_mesa.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/pages/detalhes_conta_page.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:easyfood_app/features/login/presentation/pages/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.read<LoginController>().isModoOffline ? 'Iniciar pedido ficha' : 'Entrar';
    return ElevatedButton(
      onPressed: () => _processLogin(context),
      child: Text(text),
    );
  }

  void _processLogin(BuildContext context) async {
    final loginController = context.read<LoginController>();
    if (!loginController.validateForm()) {
      return;
    }

    final navigator = Navigator.of(context);
    final authState = context.read<AuthState>();

    if (!loginController.isModoOffline) {
      final usuarioEntity = await loginController.login();
      navigator.pushReplacement(MaterialPageRoute(builder: (_) => DetalhesContaPage(_fakeConta())));
      authState.usuario = usuarioEntity;

      return;
    }

    // Necessário para modo offline
    await loginController.loadConfiguracao();

    if (loginController.isFichaHabilitado) {
      authState.usuario = UsuarioEntity.offline();
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.error(context, 'Modo ficha não habilitado. Desabilite o modo offline para continuar.'),
      );
    }
  }

  ContaEntity _fakeConta() {
    return ContaMesaEntity(
        codigo: 1,
        dataHoraAbertura: DateTime.now().subtract(const Duration(hours: 1)),
        itensPedido: [
          ItemPedidoEntity(
              codigo: 1,
              descricao: 'TESTE',
              observacao: '',
              preco: 12.34,
              quantidade: 1,
              funcionarioLancamento: 'FUNCIONARIO',
              dataHoraLancamento: DateTime.now().subtract(const Duration(hours: 1)),
              imprimirFichaPos: false)
        ],
        subTotal: 12.34,
        mesa: MesaEntity(codigo: 1, status: StatusMesa.ocupada),
        couvertPorPessoa: false);
  }
}
