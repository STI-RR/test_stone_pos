import 'package:easyfood_app/core/util/number_util.dart';
import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:flutter/material.dart';

class TotalCouvertWidget extends StatelessWidget {
  final ContaEntity conta;

  const TotalCouvertWidget(this.conta, {super.key});

  @override
  Widget build(BuildContext context) {
    const onEditPressed = null;
    final valor = conta.couvert;

    return valor == null || valor == 0
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: InkWell(
              onTap: onEditPressed,
              child: Row(
                children: [
                  const Expanded(child: Text('Couvert')),
                  Visibility(
                    visible: onEditPressed != null,
                    child: Icon(
                      Icons.delete,
                      size: 16,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  Text(NumberUtil.formatCurrency(valor)),
                ],
              ),
            ),
          );
  }
}
