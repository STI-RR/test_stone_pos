import 'package:easyfood_app/core/util/permissions.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_cancelamento_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCancelarItemContaWidget extends StatelessWidget {
  final ItemPedidoEntity itemPedido;

  const ButtonCancelarItemContaWidget(this.itemPedido, {super.key});

  @override
  Widget build(BuildContext context) {
    final hasPermission = context.read<AuthState>().hasPermission(Permissoes.cancelarItens);

    if (!hasPermission) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: () => _cancelarItem(context),
      iconSize: 42,
      icon: const Icon(Icons.delete),
    );
  }

  void _cancelarItem(BuildContext context) async {
    final navigator = Navigator.of(context);
    final result = await showDialog(
      context: context,
      builder: (context) => DialogCancelamentoItem(item: itemPedido),
    );
    navigator.pop(result);
  }
}
