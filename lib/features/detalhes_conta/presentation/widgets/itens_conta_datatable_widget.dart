import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/common/domain/entities/item_pedido_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/dialogs/dialog_detalhe_item_conta.dart';
import 'package:easyfood_app/features/detalhes_conta/presentation/states/detalhes_conta_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItensContaDataTableWidget extends StatelessWidget {
  const ItensContaDataTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 16,
      columns: const [
        DataColumn(label: Text('Item')),
        DataColumn(label: Text('Qtd')),
        DataColumn(label: Text('R\$ Unit')),
        DataColumn(label: Text('R\$ Total')),
      ],
      rows: context
          .watch<DetalhesContaState>()
          .itens
          .map<DataRow>(
            (item) => DataRow(
              cells: [
                DataCell(
                  Text(item.descricao),
                  onTap: () => _showDialogDetalhes(context, item),
                ),
                DataCell(
                  (item.peso ?? 0) > 0 == true
                      ? Text('${item.quantidade.toString()} x ${(item.peso! * 1000).toStringAsFixed(0)}g')
                      : Text(item.quantidade.toString()),
                  onTap: () => _showDialogDetalhes(context, item),
                ),
                DataCell(
                  Text(NumberUtil.formatCurrency(item.preco)),
                  onTap: () => _showDialogDetalhes(context, item),
                ),
                DataCell(
                  Text(NumberUtil.formatCurrency(item.preco * item.quantidade)),
                  onTap: () => _showDialogDetalhes(context, item),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  void _showDialogDetalhes(BuildContext context, ItemPedidoEntity item) async {
    final state = context.read<DetalhesContaState>();
    final conta = state.conta;
    final result = await showDialog(
      context: context,
      builder: (context) => DialogDetalheItemConta(
        item,
        conta,
        showButtonTransferir: conta is ContaMesaEntity || conta is ContaComandaEntity,
      ),
    );
    if (result == 'reload') {
      state.refresh();
    }
  }
}
