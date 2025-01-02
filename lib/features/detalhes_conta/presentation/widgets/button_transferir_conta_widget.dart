import 'package:easyfood_app/core/util/permissions.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_transferencia_comanda.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_transferencia_mesa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonTransferirContaWidget extends StatelessWidget {
  final ContaEntity conta;

  const ButtonTransferirContaWidget(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    final hasPermission = context.read<AuthState>().hasPermission(Permissoes.trocarContas);

    if (!hasPermission) {
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () => _trocarConta(context),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shuffle, color: Colors.white),
          Text('Transferir', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  void _trocarConta(BuildContext context) {
    Navigator.of(context).pop();
    if (conta is ContaMesaEntity) {
      showDialog(
        context: context,
        builder: (context) => DialogTransferenciaMesa((conta as ContaMesaEntity).mesa),
      );
    } else if (conta is ContaComandaEntity) {
      showDialog(
        context: context,
        builder: (context) => DialogTransferenciaComanda((conta as ContaComandaEntity).comanda),
      );
    }
  }
}
