import 'package:easyfood_app/core/util/date_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/button_cancelar_item_conta_widget.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/widgets/button_transferir_item_conta_widget.dart';
import 'package:flutter/material.dart';

class DialogDetalheItemConta extends StatelessWidget {
  final ItemPedidoEntity itemPedido;
  final ContaEntity conta;
  final bool showButtonCancelar;
  final bool showButtonTransferir;

  const DialogDetalheItemConta(
    this.itemPedido,
    this.conta, {
    super.key,
    this.showButtonCancelar = true,
    this.showButtonTransferir = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemPedido.descricao),
                _SubTitleItemContaWidget(itemPedido),
              ],
            ),
          ),
          Visibility(
            visible: showButtonCancelar,
            child: ButtonCancelarItemContaWidget(itemPedido),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            const Text('Data/Hora lançamento:', style: TextStyle(fontWeight: FontWeight.w800)),
            Text(DateUtil.getFormattedDateTime(itemPedido.dataHoraLancamento)),
            const SizedBox(height: 16),
            const Text('Funcionário lançamento:', style: TextStyle(fontWeight: FontWeight.w800)),
            Text(itemPedido.funcionarioLancamento),
            const SizedBox(height: 16),
            const Text('Observação:', style: TextStyle(fontWeight: FontWeight.w800)),
            Text(itemPedido.observacao),
          ],
        ),
      ),
      actions: [
        Visibility(
          visible: showButtonTransferir,
          child: SizedBox(
            width: double.infinity,
            child: ButtonTransferirItemContaWidget(itemPedido, conta),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
        ),
      ],
    );
  }
}

class _SubTitleItemContaWidget extends StatelessWidget {
  final ItemPedidoEntity itemPedido;

  const _SubTitleItemContaWidget(this.itemPedido);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;
    if (itemPedido.peso != null && itemPedido.peso! > 0) {
      return Text('${itemPedido.quantidade} x ${(itemPedido.peso! * 1000).toStringAsFixed(0)}g', style: style);
    } else if (itemPedido.quantidade > 1) {
      return Text('${itemPedido.quantidade} unidades', style: style);
    } else {
      return const SizedBox.shrink();
    }
  }
}
