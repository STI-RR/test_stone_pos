import 'package:easyfood_app/core/util/permissions.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_transferencia_item_comanda.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_transferencia_item_mesa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonTransferirItemContaWidget extends StatelessWidget {
  final ItemPedidoEntity itemPedido;
  final ContaEntity conta;

  const ButtonTransferirItemContaWidget(this.itemPedido, this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    final hasPermission = context.read<AuthState>().hasPermission(Permissoes.trocarItens);

    if (!hasPermission) {
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () => _transferirItem(context),
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

  void _transferirItem(BuildContext context) async {
    final navigator = Navigator.of(context);
    dynamic result;

    if (conta is ContaMesaEntity) {
      result = await showDialog(
        context: context,
        builder: (context) => DialogTransferenciaItemMesa(
          mesa: (conta as ContaMesaEntity).mesa,
          item: itemPedido,
        ),
      );
    } else if (conta is ContaComandaEntity) {
      result = await showDialog(
        context: context,
        builder: (context) => DialogTransferenciaItemComanda(
          comanda: (conta as ContaComandaEntity).comanda,
          item: itemPedido,
        ),
      );
    }

    navigator.pop(result);
  }
}
