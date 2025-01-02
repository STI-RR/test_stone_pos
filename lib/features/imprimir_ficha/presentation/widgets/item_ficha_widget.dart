import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/imprimir_ficha/presentation/states/imprimir_ficha_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemFichaWidget extends StatelessWidget {
  const ItemFichaWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ImprimirFichaState>();
    final item = state.item[index];
    final printingItem = state.printing;

    if (item.printed) {
      return ListTile(
        title: Text(item.descricao),
        subtitle: Text(NumberUtil.formatCurrency(item.preco)),
        trailing: const Icon(Icons.check, color: Colors.green),
      );
    } else if (printingItem == item) {
      return ListTile(
        title: Text(item.descricao),
        subtitle: Text(NumberUtil.formatCurrency(item.preco)),
        trailing: const CircularProgressIndicator(),
      );
    } else {
      return CheckboxListTile(
        title: Text(item.descricao),
        subtitle: Text(NumberUtil.formatCurrency(item.preco)),
        value: item.selected,
        onChanged: printingItem == null ? (value) => state.changeSelection(index) : null,
      );
    }
  }
}
